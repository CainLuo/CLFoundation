//
//  NSMutableDictionary+CLMutableDictionary.h
//  SimpleProject
//
//  Created by Cain on 2017/8/29.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (CLMutableDictionary)

/**
 安全的存储一个键值对

 @param object 值
 @param key 键
 */
- (void)cl_setSafeObject:(id)object
                  forKey:(id)key;

/**
 安全的根据一个键获取对应的对象

 @param key key
 @return id
 */
- (id)cl_safeObjectForKey:(id)key;

/**
 安全的根据value获取对应的key

 @param value id object
 @return id
 */
- (id)cl_safeKeyForValue:(id)value;

@end
