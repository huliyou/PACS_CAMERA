//
//  Login.h
//  PACS_CAMERA
//
//  Created by Leiyou Who on 15/9/17.
//  Copyright (c) 2015年 Leiyou Who. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Login : NSObject
/**
 *  登陆
 *
 *  @param username 用户名
 *  @param password 密码
 *
 *  @return 登陆成功返回该User对象 失败返回nil
 */
+ (User *)loginWithUsername:(NSString *)username andPassWord:(NSString *) password;
@end
