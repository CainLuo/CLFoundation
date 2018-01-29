//
//  NSDictionary+CLDictionary.h
//  SimpleProject
//
//  Created by Cain on 2017/8/28.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (CLDictionary)

/**
 安全的设置一个键值对

 @param object 值
 @param key 键
 */
- (void)cl_setSafeObject:(id)object
                  forKey:(id)key;

/**
 根据指定的Key安全的获取对象

 @param key 键
 @return 喜爱那个
 */
- (id)cl_safeObjectForKey:(id)key;

/**
 根据指定的值获取键

 @param value 值
 @return 键
 */
- (id)cl_safeKeyForValue:(id)value;

/**
 *  字段转成json的字符串
 *
 *  @return json 字符串
 */
- (NSString *)toJSONStringForDictionary;

@end
