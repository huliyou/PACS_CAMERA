//
//  ConditionViewController.m
//  PACS_CAMERA
//
//  Created by Leiyou Who on 15/9/18.
//  Copyright (c) 2015年 Leiyou Who. All rights reserved.
//

#import "ConditionViewController.h"
#import "ViewController.h"
#import "MagicalRecord.h"
#import "Pictures.h"
#import "ConditionInit.h"

@implementation ConditionViewController

#pragma mark - view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // init condition segementControl
    [ConditionInit getAndSetConditionSegement:self.conditionSegment];
    
}


#pragma mark - navigation 
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowViewController"]) {
        ViewController *vc = segue.destinationViewController;
        vc.user = self.user;
        vc.index = nil;
        vc.pictures = (Pictures *)sender;
    }
}

- (IBAction)done:(id)sender {
    if (self.index == nil) {
        NSDate *date = [NSDate date];
        
        Pictures *pictures = [Pictures MR_createEntity];
        pictures.user = self.user;
        pictures.patientid = self.pateintidTF.text;
        pictures.date = date;
        //FIXME: 需要将此处 conditionName 替换成 conditionid
        pictures.conditionid = [self.conditionSegment titleForSegmentAtIndex:self.conditionSegment.selectedSegmentIndex];
        
        [self.user.picturesList setByAddingObject:pictures];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:nil];
        [self performSegueWithIdentifier:@"ShowViewController" sender:pictures];
    }
}

#pragma mark - text filed delegete
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end
