//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIScreen+CLScreen.h
//
//  Created by Cain Luo on 11/10/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (CLScreen)

/**
 获取屏幕的尺寸

 @return CGSize
 */
+ (CGSize)cl_getScreenSize;

/**
 获取屏幕宽度
 
 @return CGFloat
 */
+ (CGFloat)cl_getScreenWidth;

/**
 获取屏幕高度
 
 @return CGFloat
 */
+ (CGFloat)cl_getScreenHeight;

/**
 iPhone是以 (iPhone 6)750x1334 为基准, iPad是以 (iPad Air)2048×1536 为基准

 @param value @param value UI原始值
 @return CGFloat
 */
+ (CGFloat)cl_fitScreen:(CGFloat)value;

/**
 获取UIStatusBar的高度
 
 @return CGFloat
 */
+ (CGFloat)cl_getStatusBarHeight;

/**
 获取UINavigationBar的高度

 @return CGFloat
 */
+ (CGFloat)cl_getNavigationBarHeight;

/**
 获取UITabBar的高度

 @return CGFloat
 */
+ (CGFloat)cl_getTabBarHeight;

@end
