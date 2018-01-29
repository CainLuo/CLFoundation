//
//  NSMutableDictionary+CLMutableDictionary.m
//  SimpleProject
//
//  Created by Cain on 2017/8/29.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "NSMutableDictionary+CLMutableDictionary.h"

@implementation NSMutableDictionary (CLMutableDictionary)

- (void)cl_safeSetObject:(id)object
                  forKey:(id<NSCopying>)key {
    
    if (object && ![object isKindOfClass:[NSNull class]] && key) {
        
        [self setObject:object forKey:key];
        
    } else {
        
        return;
    }
}

- (id)cl_safeObjectForKey:(id<NSCopying>)key {
    
    if (key != nil) {
        
        return [self objectForKey:key];
        
    } else {
        
        return nil;
    }
}

@end
