//
//  ViewController.m
//  ZKStatusBarHUD
//
//  Created by 闫振奎 on 16/4/23.
//  Copyright © 2016年 only. All rights reserved.
//

#import "ViewController.h"
#import "ZKStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -------------------
#pragma mark Events
- (IBAction)success{
    
    // 显示登录成功
    [ZKStatusBarHUD showSuccessWithString:@"登录成功"];
//    [ZKStatusBarHUD showWithString:@"登录成功" imageName:@"Snip20160423_2"];
//    [ZKStatusBarHUD showWithString:@"faifhef"];
}

- (IBAction)error{
    
    // 显示登录失败
    [ZKStatusBarHUD showErrorWithString:@"登录失败"];
}

- (IBAction)loading{
    
    // 显示正在登录
    [ZKStatusBarHUD showLoadingWith:@"正在登录..."];
}

- (IBAction)hide{
    
    // 隐藏
    [ZKStatusBarHUD hide];
}

@end
