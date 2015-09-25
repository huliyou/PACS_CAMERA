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

@implementation ConditionViewController

#pragma mark - view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
}

//TODO: add condition

#pragma mark - navigation 
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [formatter stringFromDate:date];
    Pictures *pictures = [Pictures MR_createEntity];
    pictures.date = dateString;
    pictures.user = self.user;
//    [self.user.picturesList setByAddingObject:pictures];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:nil];
    
    if ([segue.identifier isEqualToString:@"ShowViewController"]) {
        ViewController *vc = segue.destinationViewController;
        vc.user = self.user;
    }
    
    
}
@end
