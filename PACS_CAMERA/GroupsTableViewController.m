//
//  GroupsTableViewController.m
//  PACS_CAMERA
//
//  Created by Leiyou Who on 15/9/14.
//  Copyright (c) 2015年 Leiyou Who. All rights reserved.
//

#import "GroupsTableViewController.h"
#import "ConditionViewController.h"
#import "ViewController.h"
#import "MagicalRecord.h"
#import "Pictures.h"
#import "Picture.h"
#import "CombinePhotos.h"


//TODO: 批量上传

@interface GroupsTableViewController ()
@property BOOL editStyleIsDelete;
@end

@implementation GroupsTableViewController

#pragma mark - view life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"%@",self.user.username);
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
//    self.tableView.allowsMultipleSelection = YES;
    
    self.navigationItem.title = self.user.username;
    self.editStyleIsDelete = YES;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem * uploadBtn = [[UIBarButtonItem alloc] initWithTitle:@"批量上传"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(upload:)];
    [self.navigationItem setLeftBarButtonItem:uploadBtn];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView setEditing:NO animated:YES];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)upload:(id)sender {
    UIBarButtonItem *btn = sender;
    if ([self.tableView isEditing]) {
        NSArray *indexPaths = [self.tableView indexPathsForSelectedRows];
        for (NSIndexPath *path in indexPaths) {
            [(Pictures *)([self.user.picturesList allObjects][path.row]) MR_deleteEntity];
        }
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL b, NSError *error) {
            [self.tableView reloadData];
        }];
        btn.title = @"批量上传";
        [self.tableView setEditing:NO animated:YES];
        self.editStyleIsDelete = YES;
    }else {
        btn.title = @"上传";
        self.editStyleIsDelete = NO;
        [self.tableView setEditing:YES];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.user.picturesList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSSortDescriptor *dateSort = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO];
    Pictures *pictures = [self.user.picturesList sortedArrayUsingDescriptors: @[dateSort]][indexPath.row];
    
    NSDate *date = pictures.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    
    UILabel *dateLabel = (UILabel *)[cell viewWithTag:3];
    dateLabel.text = [formatter stringFromDate:date];
    
    UILabel *patientidLabel = (UILabel *)[cell viewWithTag:1];
    patientidLabel.text = pictures.patientid;
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:0];
//    Picture *picture = (Picture *)[pictures.imageDataList anyObject];
//    imageView.image = [UIImage imageWithData:picture.imageData];
    imageView.image = [CombinePhotos getPhotoSliceWithPictures:pictures];
    
    return cell;
}

#pragma mark - table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSSortDescriptor *dateSort = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO];
    Pictures *pictures = [self.user.picturesList sortedArrayUsingDescriptors: @[dateSort]][indexPath.row];
    [self performSegueWithIdentifier:@"SelectRow" sender:pictures];
}


#pragma mark - table view edit
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.editStyleIsDelete) {
        return UITableViewCellEditingStyleDelete;
    }else {
        return UITableViewCellEditingStyleInsert;
    }
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [(Pictures *)([self.user.picturesList allObjects][indexPath.row]) MR_deleteEntity];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL b, NSError *error) {
            [self.tableView reloadData];
        }];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        [(Pictures *)([self.user.picturesList allObjects][indexPath.row]) MR_deleteEntity];
//        //        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL b, NSError *error) {
//            [self.tableView reloadData];
//        }];
        
        if ([self.tableView cellForRowAtIndexPath:indexPath].isSelected) {
            [self.tableView cellForRowAtIndexPath:indexPath].selected = NO;
        } else {
            [self.tableView cellForRowAtIndexPath:indexPath].selected = YES;
        }
    }
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"Add"]) {
        ConditionViewController *vc = segue.destinationViewController;
        vc.user = self.user;
    }
    if ([segue.identifier isEqualToString:@"SelectRow"]) {
        ViewController *vc = segue.destinationViewController;
        vc.pictures = (Pictures *)sender;
    }
}



@end
