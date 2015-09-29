//
//  ConditionViewController.h
//  PACS_CAMERA
//
//  Created by Leiyou Who on 15/9/18.
//  Copyright (c) 2015年 Leiyou Who. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface ConditionViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *pateintidTF;
@property (weak, nonatomic) IBOutlet UISegmentedControl *conditionSegment;
- (IBAction)done:(id)sender;
@property (strong, nonatomic) NSNumber *index;
@property (strong, nonatomic) User *user;
@end
