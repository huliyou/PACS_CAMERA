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
    __block User *user = nil;
    
    //Temorary User
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"(username == %@) AND (password == %@)",username,password];
    User *temporaryUser = [User MR_findFirstWithPredicate:predicate];
    if (temporaryUser) {
        return temporaryUser;
    }
    
    //WebService User
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *param  = @{@"username":username, @"password":password};
    [manager POST:LoginURL parameters:param success:^(AFHTTPRequestOperation *operation, id responseData){
        if (operation.response.statusCode == 200) { // 登陆成功
            NSError *jsonError;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
            
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"username == %@",username];
            user = [User MR_findFirstWithPredicate:predicate];
            if (user) { //曾经登陆过
                return;
            } else { //第一次登陆
                user = [User MR_createEntity];
                user.username = username;
                user.userid = json[@"userid"];
                [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:nil];
            }
        } else if (operation.response.statusCode == 403){ //登陆失败
            user = nil;
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        user = nil;
    }];
    
    return user;
}
@end
