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
 安全的添加一个对象

 @param object 对象
 */
- (void)cl_addSafeObject:(id)object;

/**
 根据索引安全的插入一个对象

 @param object 对象
 @param index 索引
 */
- (void)cl_insertSafeObject:(id)object
                      index:(NSUInteger)index;

/**
 根据索引安全的插入一个数组

 @param array 数组
 @param index 索引
 */
- (void)cl_insertSafeArray:(NSArray *)array
                     index:(NSIndexSet *)index;

/**
 根据索引安全的删除一个对象

 @param index 索引
 */
- (void)cl_safeRemoveObjectAtIndex:(NSUInteger)index;

/**
 根据范围安全的删除

 @param range 范围
 */
- (void)cl_safeRemoveObjectsInRange:(NSRange)range;

@end
