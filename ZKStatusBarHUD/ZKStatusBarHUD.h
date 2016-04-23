//
//  ZKStatusBarHUD.h
//  ZKStatusBarHUD
//
//  Created by 闫振奎 on 16/4/23.
//  Copyright © 2016年 only. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZKStatusBarHUD : NSObject

/** 显示文字 + 图片信息 */
+ (void)showWithString:(NSString *)string image:(UIImage *)image;
+ (void)showWithString:(NSString *)string imageName:(NSString *)imageName;

/** 显示文字信息 */
+ (void)showWithString:(NSString *)string;

/** 显示登录失败信息 */
+ (void)showErrorWithString:(NSString *)string;

/** 显示登录成功信息 */
+ (void)showSuccessWithString:(NSString *)string;

/** 显示正在登录 */
+ (void)showLoadingWith:(NSString *)string;

/** 隐藏 */
+ (void)hide;

@end
