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
- (void)cl_safeSetObject:(id)object
                  forKey:(id<NSCopying>)key;

/**
 安全的根据一个键获取对应的对象

 @param key 键
 @return 对象
 */
- (id)cl_safeObjectForKey:(id<NSCopying>)key;

@end
