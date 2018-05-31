//
//  NSMutableArray+CLMutableArray.m
//  SimpleProject
//
//  Created by Cain on 2017/8/28.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "NSMutableArray+CLMutableArray.h"

@implementation NSMutableArray (CLMutableArray)

+ (NSMutableArray *)cl_mutableArrayWithPlistData:(NSData *)plist {
    
    if (!plist) {
        return nil;
    }
    
    NSMutableArray *array = [NSPropertyListSerialization propertyListWithData:plist
                                                                      options:NSPropertyListMutableContainersAndLeaves
                                                                       format:NULL
                                                                        error:NULL];
    if ([array isKindOfClass:[NSMutableArray class]]) {
        
        return array;
    }
    
    return nil;
}

#pragma mark - 增加对象
- (void)cl_addSafeObject:(id)object {
    
    if (object == nil) {
        
        return;
    } else {
        
        [self addObject:object];
    }
}

- (void)cl_insertSafeObject:(id)object
                      index:(NSUInteger)index {
    
    if (object == nil) {
        
        return;
        
    } else if (index > self.count) {
        
        [self insertObject:object
                   atIndex:self.count];
        
    } else {
        
        [self insertObject:object
                   atIndex:index];
    }
}

- (void)cl_insertSafeArray:(NSArray *)array {
    if (!array) {
        return;
    }
    
    [self addObjectsFromArray:array];
}

- (void)cl_insertSafeArray:(NSArray *)array
                  indexSet:(NSIndexSet *)indexSet {
    
    if (indexSet == nil) {
        
        return;
    } else if (indexSet.count != array.count || indexSet.firstIndex > array.count) {
        
        [self insertObject:array
                   atIndex:self.count];
        
    } else {
        
        [self insertObjects:array
                  atIndexes:indexSet];
    }
}

#pragma mark - 删除对象
- (void)cl_safeRemoveFirstObject {
    
    if (self.count) {
        
        [self removeObjectAtIndex:0];
    }
}

- (void)cl_safeRemoveLastObject {
    
    if (self.count) {
        
        [self removeObjectAtIndex:self.count - 1];
    }
}

- (void)cl_safeRemoveObjectAtIndex:(NSUInteger)index {
    
    if (index >= self.count) {
        
        return;
    } else {
        
        [self removeObjectAtIndex:index];
    }
}

- (void)cl_safeRemoveObjectsInRange:(NSRange)range {
    
    NSUInteger location = range.location;
    NSUInteger length   = range.length;
    
    if (location + length > self.count) {
        
        return;
    } else {
        
        [self removeObjectsInRange:range];
    }
}

#pragma mark - 数组排序
- (NSMutableArray *)cl_getReverseArray {

    NSUInteger cl_arrayCount = self.count;
    
    NSInteger cl_mid = floor(cl_arrayCount / 2.0);
    
    for (NSUInteger i = 0; i < cl_mid; i++) {
        
        [self exchangeObjectAtIndex:i
                  withObjectAtIndex:(cl_arrayCount - (i + 1))];
    }
    
    return self;
}

- (NSMutableArray *)cl_getDisorderArray {
    
    for (NSUInteger i = self.count; i > 1; i--) {
        
        [self exchangeObjectAtIndex:(i - 1)
                  withObjectAtIndex:arc4random_uniform((u_int32_t)i)];
    }
    
    return self;
}

@end
