//
//  NSNumber+CLNumber.h
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/25.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (CLNumber)

/**
 显示向最近的整数四舍五入取整的字符串

 @param number NSNumber
 @param digit NSUInteger, 限制位数
 @return NSString
 */
+ (NSString *)cl_displayDecimalWithNumber:(NSNumber *)number
                                    digit:(NSUInteger)digit;

/**
 显示向最近的整数四舍五入取整并添加了货币符号NSNumber的NSString
 
 @param number NSNumber
 @param digit NSUInteger, 限制位数
 @return NSString
 */
+ (NSString *)cl_displayCurrencyWithNumber:(NSNumber *)number
                                     digit:(NSUInteger)digit;

/**
 显示向最近的整数四舍五入取整并添加了百分号NSNumber的NSString

 @param number NSNumber
 @param digit NSUInteger, 限制位数
 @return NSString
 */
+ (NSString *)cl_displayPercentWithNumber:(NSNumber *)number
                                    digit:(NSUInteger)digit;

/**
 向最近的整数四舍五入取整

 @param number NSNumber
 @param digit NSUInteger, 限制位数
 @return NSNumber
 */
+ (NSNumber *)cl_roundingWithNumber:(NSNumber *)number
                              digit:(NSUInteger)digit;

/**
 正无穷的四舍五入取整

 @param number NSNumber
 @param digit NSUInteger, 最大限制多少位数
 @return NSNumber
 */
+ (NSNumber *)cl_roundCeilingWithNumber:(NSNumber *)number
                                  digit:(NSUInteger)digit;

/**
 负无穷的四舍五入取整
 
 @param number NSNumber
 @param digit NSUInteger, 最大限制多少位数
 @return NSNumber
 */
+ (NSNumber *)cl_roundFloorWithNumber:(NSNumber *)number
                                digit:(NSUInteger)digit;

#pragma mark - NSNumber转换
/**
 将字符串数字转换成NSNumber, 支持的格式为@"12", @"12.345", @" -0xFF", @" .23e99 "...

 @param string NSString
 @return NSNumber
 */
+ (NSNumber *)cl_numberWithString:(NSString *)string;

@end
