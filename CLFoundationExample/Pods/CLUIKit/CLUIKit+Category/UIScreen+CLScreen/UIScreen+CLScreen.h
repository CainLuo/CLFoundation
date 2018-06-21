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
 获取屏幕的比例

 @return CGFloat
 */
+ (CGFloat)cl_getScreenScale;

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
 iPhone是以 (iPhone 6)1334x750 为基准, iPad是以 (iPad Pro 10.5)2224x1668 为基准

 @param value UI原始值
 @return CGFloat
 */
+ (CGFloat)cl_fitScreen:(CGFloat)value;

/**
 适配iPhone Plus机型的尺寸

 @param value UI原始值
 @return CGFloat
 */
+ (CGFloat)cl_fitPlusScreen:(CGFloat)value;

/**
 获取UITabBar的高度

 @return CGFloat
 */
+ (CGFloat)cl_getTabBarHeight;

@end
