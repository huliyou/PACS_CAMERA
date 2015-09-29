//
//  ViewController.h
//  PACS_CAMERA
//
//  Created by Leiyou Who on 15/9/11.
//  Copyright (c) 2015年 Leiyou Who. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) User *user;
@property (strong, nonatomic) Pictures *pictures;
@property (strong, nonatomic) NSNumber *index;
@end

