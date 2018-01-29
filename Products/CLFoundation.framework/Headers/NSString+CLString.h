//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  NSString+CLString.h
//
//  Created by Cain on 2017/7/28.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (CLString)

/**
 返回过滤后的数字

 @param string 字符串
 @return 数字
 */
+ (NSInteger)cl_getNumberWithString:(NSString *)string;

//电话号码中间4位****显示

/**
 电话号码中间4位****显示

 @param phoneNumber 手机号
 @return 隐藏后的手机号
 */
+ (NSString *)cl_getSecrectStringWithPhoneNumber:(NSString *)phoneNumber;

/**
 银行卡号中间8位显示

 @param cardNumber 银行卡号
 @return 隐藏后的银行卡号
 */
+ (NSString *)cl_getSecrectStringWithCardNumber:(NSString *)cardNumber;

/**
 根据条件计算文字的高度

 @param fontSize 字体大小
 @param width 宽度
 @return CGFloat
 */
- (CGFloat)cl_heightWithFontSize:(CGFloat)fontSize
                           width:(CGFloat)width;

/**
 抹除运费小数末尾的0

 @return NSString
 */
- (NSString *)cl_removeUnwantedZero;

/**
 去掉字符串前后的空格

 @return NSString
 */
- (NSString *)cl_trimmedString;

/**
 手机号格式化, 默认: 138 0013 8000

 @param phoneNumber 手机号
 @return NSString
 */
+ (NSString *)cl_stringMobileFormat:(NSString *)phoneNumber;

/**
 手机号格式化

 @param phoneNumber 手机号
 @param separator 号码分隔符, 比如: 138-0013-8000
 @return NSString
 */
+ (NSString *)cl_stringMobileFormat:(NSString *)phoneNumber
                          separator:(NSString *)separator;

/**
 字符串单位格式化

 @param value 数值
 @param unitString 单位, 比如亿, 万
 @return NSString
 */
+ (NSString *)cl_stringUnitFormat:(CGFloat)value
                       unitString:(NSString *)unitString;

/**
 获取指定字符串的尺寸

 @param string 字符串
 @param font 字体
 @return CGFloat
 */
+ (CGSize)cl_measureSinglelineStringSize:(NSString *)string
                                    font:(UIFont *)font;

/**
 获取指定字符串的宽度

 @param string 字符串
 @param font 字体
 @return CGFloat
 */
+ (CGFloat)cl_measureSinglelineStringWidth:(NSString *)string
                                      font:(UIFont *)font;

/**
 获取指定字符串的高度

 @param string 字符串
 @param font 字体
 @param width 宽度
 @return CGFloat
 */
+ (CGFloat)cl_measureMutilineStringHeight:(NSString *)string
                                     font:(UIFont *)font
                                    width:(CGFloat)width;

@end
