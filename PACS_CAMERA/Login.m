//
//  Login.m
//  PACS_CAMERA
//
//  Created by Leiyou Who on 15/9/17.
//  Copyright (c) 2015年 Leiyou Who. All rights reserved.
//

#import "Login.h"
#import "MagicalRecord.h"
#import "AFNetworking.h"
#import "WebService.h"

@implementation Login
+ (User *)loginWithUsername:(NSString *)username andPassWord:(NSString *) password {
    User *user = nil;
    //Temorary User
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"(username == %@) AND (password == %@)",username,password];
    User *temporaryUser = [User MR_findFirstWithPredicate:predicate];
    NSLog(@"%@",temporaryUser.username);
    if (temporaryUser) {
        return temporaryUser;
    }
    
    //WebService User
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSArray * param = @[@{@"username":username},@{@"password":password}];
    [manager POST:LoginURL parameters:param success:^(AFHTTPRequestOperation *operation, id responseData){
        // TODO: complete user
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData
                                                             options:NSJSONReadingMutableContainers
                                                               error:&jsonError];
        // user
    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        
    }];
    
    return user;
}
@end
