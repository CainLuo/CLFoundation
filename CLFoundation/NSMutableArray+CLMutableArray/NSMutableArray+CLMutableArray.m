//
//  NSMutableArray+CLMutableArray.m
//  SimpleProject
//
//  Created by Cain on 2017/8/28.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "NSMutableArray+CLMutableArray.h"

@implementation NSMutableArray (CLMutableArray)

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

@end
