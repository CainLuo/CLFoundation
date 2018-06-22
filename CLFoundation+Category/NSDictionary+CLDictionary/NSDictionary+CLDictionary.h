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
 序列化创建一个NSDictionary
 
 @param plist NSData
 @return NSDictionary
 */
+ (NSDictionary *)cl_dictionaryWithPlistData:(NSData *)plist;

/**
 将指定的URL字符串转成NSDictionary
 
 @param urlString URL字符串, 格式: http://www.xxxx.com?a=1&b=2 || a=1&b=2
 @return NSDictionary
 */
+ (NSDictionary *)cl_dictionaryWithURLString:(NSString *)urlString;

/**
 根据给定的JSON String转成NSDictionary
 
 @param jsonString NSString
 @return NSDictionary
 */
+ (NSDictionary *)cl_dictionaryWithJSONString:(NSString *)jsonString;

/**
 获取NSDictionary的所有排序完成的Keys

 @return NSArray
 */
- (NSArray *)cl_getAllKeysSorted;

/**
 获取NSDictionary的所有排序完成的Value

 @return NSArray
 */
- (NSArray *)cl_getAllValuesSortedByKeys;

/**
 查看是否包含指定Key的Object

 @param key id
 @return BOOL
 */
- (BOOL)cl_containsObjectForKey:(id)key;

/**
 获取指定Keys的NSDictionary

 @param keys NSArray
 @return NSDictionary
 */
- (NSDictionary *)cl_getDictionaryForKeys:(NSArray *)keys;

@end
