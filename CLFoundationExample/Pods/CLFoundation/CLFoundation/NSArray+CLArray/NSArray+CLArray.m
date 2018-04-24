//
//  NSArray+CLArray.m
//  SimpleProject
//
//  Created by Cain on 2017/8/27.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "NSArray+CLArray.h"

@implementation NSArray (CLArray)

+ (instancetype)cl_initSafeArrayWithObject:(id)object {
    
    if (object == nil) {
        
        return [self array];
        
    } else {
        
        return [self arrayWithObject:object];
    }
}

+ (NSArray *)cl_arrayWithPlistData:(NSData *)plist {
    
    if (!plist) {
        
        return nil;
    }
    
    NSArray *cl_array = [NSPropertyListSerialization propertyListWithData:plist
                                                                  options:NSPropertyListImmutable
                                                                   format:NULL
                                                                    error:NULL];
    
    if ([cl_array isKindOfClass:[NSArray class]]) {
        
        return cl_array;
    }
    
    return nil;
}

- (id)cl_safeObjectAtIndex:(NSUInteger)index {
    
    if (index >= self.count) {
        
        return nil;
    } else {
        
        return [self objectAtIndex:index];
    }
}

- (NSArray *)cl_safeArrayWithRange:(NSRange)range {
    
    NSUInteger location = range.location;
    NSUInteger length   = range.length;
    
    if (location + length > self.count) {
        
        //超过了边界,就获取从loction开始所有的item
        if ((location + length) > self.count) {
            
            length = (self.count - location);
            
            return [self cl_safeArrayWithRange:NSMakeRange(location, length)];
        }
        
        return nil;
        
    } else {
        
        return [self subarrayWithRange:range];
    }
}

- (NSUInteger)cl_safeIndexOfObject:(id)object {
    
    if (object == nil) {
        
        return NSNotFound;
    } else {
        
        return [self indexOfObject:object];
    }
}

+ (NSArray *)cl_getArrayWithPlistName:(NSString *)name {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:name
                                                     ofType:@"plist"];
        
    return [NSArray arrayWithContentsOfFile:path];
}

@end
