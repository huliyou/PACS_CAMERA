//
//  ShowSinglePictureViewController.m
//  PACS_CAMERA
//
//  Created by Leiyou Who on 15/9/14.
//  Copyright (c) 2015年 Leiyou Who. All rights reserved.
//

#import "ShowSinglePictureViewController.h"

@interface ShowSinglePictureViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)cancel:(id)sender;
- (IBAction)delete:(id)sender;

@end

@implementation ShowSinglePictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imageView.image = self.image;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// can't call at runtime when segue unwind
- (IBAction)delete:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
