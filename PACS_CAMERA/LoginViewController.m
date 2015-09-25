//
//  LoginViewController.m
//  PACS_CAMERA
//
//  Created by Leiyou Who on 15/9/17.
//  Copyright (c) 2015年 Leiyou Who. All rights reserved.
//

#import "LoginViewController.h"
#import "GroupsTableViewController.h"
#import "Login.h"
#import "User.h"

@interface LoginViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)loginAction:(id)sender;

@end

@implementation LoginViewController
#pragma mark  - view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - login
/**
 *  登陆信息格式是否正确
 *
 *  @return 正确返回 YES 否则则反
 */
- (BOOL)loginFormIsCorrect {
    if ([self.usernameTextField.text isEqualToString:@""]) {
        return NO;
    } else if ([self.passwordTextField.text isEqualToString:@""]) {
        return NO;
    }
    return YES;
}

/**
 *  点击登陆按钮， 验证用户信息
 *
 */
- (IBAction)loginAction:(id)sender {
    if ([self loginFormIsCorrect]) {
        User *user = [Login loginWithUsername:self.usernameTextField.text andPassWord:self.passwordTextField.text];
        if (user) {
            [self performSegueWithIdentifier:@"Login" sender:user];
        } else { // 登陆失败
            [[[UIAlertView alloc] initWithTitle:@"登陆"
                                        message:@"用户名或密码错误，或登录受到限制"
                                       delegate:self
                              cancelButtonTitle:@"重新登陆"
                              otherButtonTitles:nil, nil]
             show];
        }
    } else {
        [[[UIAlertView alloc] initWithTitle:@"登陆"
                                   message:@"请填写正确登陆信息"
                                  delegate:self
                         cancelButtonTitle:@"取消"
                         otherButtonTitles:nil, nil]
        show];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"Login"]) {
        UINavigationController *nvc = segue.destinationViewController;
        GroupsTableViewController *vc = nvc.viewControllers[0];
        vc.user = sender;
    }
}

#pragma mark - text field delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end
