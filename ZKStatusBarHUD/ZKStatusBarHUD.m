//
//  ZKStatusBarHUD.m
//  ZKStatusBarHUD
//
//  Created by 闫振奎 on 16/4/23.
//  Copyright © 2016年 only. All rights reserved.
//

#import "ZKStatusBarHUD.h"
@interface ZKStatusBarHUD ()

@end

static UIWindow *window_ ;
/** 定时器 */
static NSTimer *timer ;

/** 按钮内部图片文字偏移量 */
static CGFloat const inset = 10;

/** 动画执行时间 */
static CGFloat const ZKAnimationDuration = 0.25;

/** 动画停留时间 */
static CGFloat const ZKStayDuration = 2.0;


@implementation ZKStatusBarHUD

#pragma mark -------------------
#pragma mark 私有方法
/**
 *  初始化文字图片
 */
+ (void)setUptitle:(NSString *)title image:(UIImage *)image
{
    CGRect windowF = [UIApplication sharedApplication].statusBarFrame;
    
    // 创建StatusBarHUD
    window_ = ({
        
        window_ = [[UIWindow alloc]init];
        
        window_.frame = windowF;
        
        window_.hidden = NO;
        
        window_.windowLevel = UIWindowLevelAlert;
        
        window_.backgroundColor = [UIColor blackColor];
        
        window_;
        
    });
    
    
    // 添加内容按钮
    UIButton *button =({
        
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        // 让按钮填充整个window_
        button.frame = window_.bounds;
        
        [window_ addSubview:button];
        
        
        // 设置按钮数据
        [button setTitle:title forState:UIControlStateNormal];
        
        if (image) {
            
            [button setImage:image forState:UIControlStateNormal];
            
            // 设置按钮图片文字偏移量
            button.titleEdgeInsets = UIEdgeInsetsMake(0, inset, 0, 0);
            button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, inset);
        }
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [button.titleLabel sizeToFit];
        
        button;
        
        
    });
    
    // 设置开始动画
    CGRect beginWindowF = windowF;
    
    beginWindowF.origin.y = - windowF.size.height;
    
    window_.frame = beginWindowF;
    
    [UIView animateWithDuration:ZKAnimationDuration animations:^{
        
        window_.frame = windowF;
        
    }];
}

#pragma mark -------------------
#pragma mark 公共方法
/**
 *  传入图片和文字
 */
+ (void)showWithString:(NSString *)string image:(UIImage *)image
{
    // 初始化文字图片
    [self setUptitle:string image:image];
    
    // 定时器相关
    // 停止上次定时器
    [timer invalidate];
    // 开启新定时器
    timer = [NSTimer scheduledTimerWithTimeInterval:ZKStayDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
    
}

+ (void)showWithString:(NSString *)string imageName:(NSString *)imageName
{
    [self showWithString:string image:[UIImage imageNamed:imageName]];
}

/**
 *  传入文字
 */
+ (void)showWithString:(NSString *)string
{
    [self showWithString:string image:nil];
}


/**
 *  登录成功
 */
+ (void)showSuccessWithString:(NSString *)string
{
    [self showWithString:@"登录成功" image:[UIImage imageNamed:@"ZKStatusBarHUD.bundle/success"]];
}

/**
 *  登录失败
 */
+ (void)showErrorWithString:(NSString *)string
{
    [self showWithString:@"登录失败" image:[UIImage imageNamed:@"ZKStatusBarHUD.bundle/error"]];
}

/**
 *  显示正在登录
 */
+ (void)showLoadingWith:(NSString *)string
{
    // 初始化文字图片
    [self setUptitle:string image:nil];
    
    UIButton *button = [window_.subviews firstObject];
    
    // 添加圈圈
    UIActivityIndicatorView *loadView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    CGFloat loadViewCenterX = (window_.frame.size.width - button.titleLabel.frame.size.width) * 0.5 - 20;

    loadView.center = CGPointMake(loadViewCenterX, window_.frame.size.height * 0.5);
    
    [loadView startAnimating];
    
    [window_ addSubview:loadView];
    


}

// 隐藏
+ (void)hide
{
    [UIView animateWithDuration:ZKAnimationDuration animations:^{
        
        CGRect beginWindowF = window_.frame;
        
        beginWindowF.origin.y = - window_.frame.size.height;
        
        window_.frame = beginWindowF;
        
    } completion:^(BOOL finished) {
        window_.hidden = YES;
        window_ = nil;
    }];
}

@end
