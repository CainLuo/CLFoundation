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
+ (CGSize)cl_getScreenSize {
    
    return [[UIScreen mainScreen] bounds].size;
}

+ (CGFloat)cl_getScreenWidth {
    return [[UIScreen mainScreen] bounds].size.width;
}

+ (CGFloat)cl_getScreenHeight {
    return [[UIScreen mainScreen] bounds].size.height;
}

#pragma mark - 适配iPad, iPhone, iPod Touch
+ (CGFloat)cl_fitScreen:(CGFloat)value {
    
    if ([[UIDevice cl_getDeviceModelType] isEqualToString:@"iPad"]) {
        return ceilf([self cl_getScreenWidth] / (1535.0f / 2)  * (value / 2.0f));
    } else {
        return ceilf([self cl_getScreenWidth] / (750.0f / 2)  * (value / 2.0f));
    }
}

#pragma mark - 获取UIStatusBar的高度
+ (CGFloat)cl_getStatusBarHeight {
    
    return [[UIApplication sharedApplication] statusBarFrame].size.height;
}

#pragma mark - 获取UINavigationBar的高度
+ (CGFloat)cl_getNavigationBarHeight {
    
    UIViewController *cl_rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    if ([cl_rootViewController isKindOfClass:[UITabBarController class]]) {
        
        UITabBarController *cl_tabBarController = (UITabBarController *)cl_rootViewController;
        
        UIViewController *cl_tabBarFirstController = cl_tabBarController.viewControllers.firstObject;
        
        if ([cl_tabBarFirstController isKindOfClass:[UINavigationController class]]) {
            
            UINavigationController *cl_navigationController = (UINavigationController *)cl_tabBarFirstController;
            
            return CGRectGetHeight(cl_navigationController.navigationBar.frame);
        } else {
            
            return 0.f;
        }
        
    } else if ([cl_rootViewController isKindOfClass:[UINavigationController class]]) {
        
        UINavigationController *cl_navigationController = (UINavigationController *)cl_rootViewController;
        
        return CGRectGetHeight(cl_navigationController.navigationBar.frame);
    } else {
     
        return 0.f;
    }
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
