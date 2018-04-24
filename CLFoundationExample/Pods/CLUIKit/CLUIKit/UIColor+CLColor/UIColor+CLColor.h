//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIColor+CLColor.h
//
//  Created by Cain Luo on 11/10/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CLColor)

/**
 获取随机色值
 
 @return 返回随机色值的UIColor
 */
+ (UIColor *)cl_getARC4RandomColor;

#pragma mark - 十六进制颜色值
/**
 十六进制转UIColor
 
 @param hexValue 十六进制颜色值
 @return UIColor
 */
+ (UIColor *)cl_colorWithHex:(NSInteger)hexValue;

/**
 十六进制转UIColor

 @param hexValue 十六进制颜色值
 @param alphaValue 透明度
 @return 返回十六进制转成的UIColor
 */
+ (UIColor *)cl_colorWithHex:(NSInteger)hexValue
                       alpha:(CGFloat)alphaValue;

/**
 十六进制字符串转颜色值
 
 @param hexString 十六进制的字符串, 比如: #1874de
 @return UIColor
 */
+ (UIColor *)cl_colorWithHexString:(NSString *)hexString;

/**
 十六进制字符串转颜色值
 
 @param hexString 十六进制的字符串, 比如: #1874de
 @param alphaValue 透明度
 @return UIColor
 */
+ (UIColor *)cl_colorWithHexString:(NSString *)hexString
                             alpha:(CGFloat)alphaValue;

#pragma mark - 三原色
/**
 三原色, 并且可控制alpha

 @param red CGFloat
 @param green CGFloat
 @param blue CGFloat
 @param alpha CGFloat
 @return UIColor
 */
+ (UIColor *)cl_colorWithRed:(CGFloat)red
                       green:(CGFloat)green
                        blue:(CGFloat)blue
                       alpha:(CGFloat)alpha;

/**
 三原色
 
 @param red CGFloat
 @param green CGFloat
 @param blue CGFloat
 @return UIColor
 */
+ (UIColor *)cl_colorWithRed:(CGFloat)red
                       green:(CGFloat)green
                        blue:(CGFloat)blue;

/**
 设置渐变色

 @param beginColor 开始的颜色
 @param endColor 结束的颜色
 @param height 颜色的高度
 @return UIColor
 */
+ (UIColor *)cl_configGradientWithBeginColor:(UIColor *)beginColor
                                    endColor:(UIColor *)endColor
                                      height:(CGFloat)height;

@end
