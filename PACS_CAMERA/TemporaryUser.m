//
//  TemporaryUser.m
//  PACS_CAMERA
//
//  Created by Leiyou Who on 15/9/17.
//  Copyright (c) 2015年 Leiyou Who. All rights reserved.
//

#import "TemporaryUser.h"
#import "MagicalRecord.h"

@implementation TemporaryUser

+ (void)initTemporaryUserWithUsername:(NSString *)username andPassword:(NSString *)password {
    User *temporaryUser = [User MR_createEntity];
    temporaryUser.username = username;
    temporaryUser.password = password;
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:nil];
}
@end
