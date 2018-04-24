//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIFont+CLFont.h
//
//  Created by Cain Luo on 2017/12/18.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (CLFont)

/**
 自适应设备系统文字大小

 @param fontSize 文字大小
 @return UIFont
 */
+ (UIFont *)cl_fitSystemFontOfSize:(CGFloat)fontSize;

/**
 自适应设备系统加粗文字大小
 
 @param fontSize 文字大小
 @return UIFont
 */
+ (UIFont *)cl_fitBoldSystemFontOfSize:(CGFloat)fontSize;

/**
 自适应设备系统斜体文字大小
 
 @param fontSize 文字大小
 @return UIFont
 */
+ (UIFont *)cl_fitItalicSystemFontOfSize:(CGFloat)fontSize;

/**
 设置UIFont的Size和Weight

 @param fontSize CGFloat
 @param weight UIFontWeight
 @return UIFont
 */
+ (UIFont *)cl_fitSystemFontOfSize:(CGFloat)fontSize
                            weight:(UIFontWeight)weight NS_AVAILABLE_IOS(8_2);

/**
 根据指定的Size和Weight返回UIFont

 @param fontSize CGFloat
 @param weight UIFontWeight
 @return UIFont
 */
+ (UIFont *)cl_fitMonospacedDigitSystemFontOfSize:(CGFloat)fontSize
                                           weight:(UIFontWeight)weight NS_AVAILABLE_IOS(9_0);

@end
