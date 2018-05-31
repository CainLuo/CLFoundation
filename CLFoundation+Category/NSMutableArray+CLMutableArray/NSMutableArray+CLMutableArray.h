//
//  NSMutableArray+CLMutableArray.h
//  SimpleProject
//
//  Created by Cain on 2017/8/28.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (CLMutableArray)

/**
 序列化一个NSMutableArray

 @param plist NSData
 @return NSMutableArray
 */
+ (NSMutableArray *)cl_mutableArrayWithPlistData:(NSData *)plist;

#pragma mark - 增加对象
/**
 安全的添加一个对象

 @param object 对象
 */
- (void)cl_addSafeObject:(id)object;

/**
 根据索引安全的插入一个对象

 @param object 对象
 @param index NSUInteger
 */
- (void)cl_insertSafeObject:(id)object
                      index:(NSUInteger)index;

/**
 安全的插入一个数组

 @param array NSArray
 */
- (void)cl_insertSafeArray:(NSArray *)array;

/**
 根据索引安全的插入一个数组

 @param array NSArray
 @param indexSet NSIndexSet
 */
- (void)cl_insertSafeArray:(NSArray *)array
                  indexSet:(NSIndexSet *)indexSet;

#pragma mark - 删除对象
/**
 安全的删除第一个对象
 */
- (void)cl_safeRemoveFirstObject;

/**
 安全的删除最后一个对象
 */
- (void)cl_safeRemoveLastObject;

/**
 根据索引安全的删除一个对象

 @param index NSUInteger
 */
- (void)cl_safeRemoveObjectAtIndex:(NSUInteger)index;

/**
 根据范围安全的删除

 @param range NSRange
 */
- (void)cl_safeRemoveObjectsInRange:(NSRange)range;

#pragma mark - 数组排序
/**
 获取倒序排列的数组

 @return NSMutableArray
 */
- (NSMutableArray *)cl_getReverseArray;

/**
 获取乱序排列的数组

 @return NSMutableArray
 */
- (NSMutableArray *)cl_getDisorderArray;

@end
