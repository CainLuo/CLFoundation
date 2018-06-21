//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIScreen+CLScreen.m
//
//  Created by Cain Luo on 11/10/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "UIScreen+CLScreen.h"
#import "UIDevice+CLDevice.h"

@implementation UIScreen (CLScreen)

#pragma mark - 获取屏幕相关的
+ (CGFloat)cl_getScreenScale {
    
    return [self mainScreen].scale;
}

+ (CGSize)cl_getScreenSize {
    
    return [[self mainScreen] bounds].size;
}

+ (CGFloat)cl_getScreenWidth {
    return [[self mainScreen] bounds].size.width;
}

+ (CGFloat)cl_getScreenHeight {
    return [[self mainScreen] bounds].size.height;
}

#pragma mark - 适配iPad, iPhone, iPod Touch
+ (CGFloat)cl_fitScreen:(CGFloat)value {
    
    if ([[UIDevice cl_getDeviceModelType] isEqualToString:@"iPad"]) {
        return ceilf([self cl_getScreenWidth] / (1668.0f / 2)  * (value / 2.0f));
    } else {
        return ceilf([self cl_getScreenWidth] / (750.0f / 2)  * (value / 2.0f));
    }
}

+ (CGFloat)cl_fitPlusScreen:(CGFloat)value {
    
    return ceilf([self cl_getScreenWidth] / (1080.0f / 2)  * (value / 2.0f));
}

#pragma mark - 获取UITabBar的高度
+ (CGFloat)cl_getTabBarHeight {
    
    UIViewController *cl_rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    if ([cl_rootViewController isKindOfClass:[UITabBarController class]]) {
        
        UITabBarController *cl_tabBarController = (UITabBarController *)cl_rootViewController;
        
        return CGRectGetHeight(cl_tabBarController.tabBar.frame);
    } else {
        
        return 0.f;
    }
}

@end
