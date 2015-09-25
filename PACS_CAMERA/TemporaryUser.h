//
//  TemporaryUser.h
//  PACS_CAMERA
//
//  Created by Leiyou Who on 15/9/17.
//  Copyright (c) 2015年 Leiyou Who. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface TemporaryUser : NSObject
+ (void)initTemporaryUserWithUsername:(NSString *)username andPassword:(NSString *)password;
@end
