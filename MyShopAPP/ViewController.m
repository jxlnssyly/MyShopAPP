//
//  ViewController.m
//  MyShopAPP
//
//  Created by user on 2019/5/13.
//  Copyright © 2019 Ly. All rights reserved.
//

#import "ViewController.h"
#import "NetWorkTool.h"
#import "NSString+LyAdd.h"
#import "SVProgressHUD.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *passWordField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    self.title = @"登录";
}

- (IBAction)loginClick:(id)sender {
    
    if (self.userNameField.text.length <= 0 || self.passWordField.text.length <= 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入账号或密码"];
        return;
    }
    
    [SVProgressHUD showWithStatus:@"正在登录"];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"username"] = self.userNameField.text;
    params[@"password"] = self.passWordField.text.md5;
    
    
    
    [NetWorkTool POST:@"http://127.0.0.1:8080/admin/login" params:params success:^(id response, id code) {
        [SVProgressHUD dismiss];
        
        if ([response[@"code"] integerValue] == 1) {
            [SVProgressHUD showSuccessWithStatus:response[@"msg"]];

        } else {
            [SVProgressHUD showErrorWithStatus:response[@"msg"]];
        }
        NSLog(@"%@",response);
    } fail:^(id response, id code) {
        NSLog(@"%@",response);
        [SVProgressHUD dismiss];

    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
