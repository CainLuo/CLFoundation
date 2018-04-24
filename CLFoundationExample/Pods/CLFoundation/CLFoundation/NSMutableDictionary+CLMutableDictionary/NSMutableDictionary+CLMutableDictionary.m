//
//  NSMutableDictionary+CLMutableDictionary.m
//  SimpleProject
//
//  Created by Cain on 2017/8/29.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "NSMutableDictionary+CLMutableDictionary.h"

@implementation NSMutableDictionary (CLMutableDictionary)

- (void)cl_setSafeObject:(id)object
                  forKey:(id)key {
    
    if ([key isKindOfClass:[NSNull class]]) {
        
        return;
    }
    
    if ([object isKindOfClass:[NSNull class]]) {
        
        [self setValue:@""
                forKey:key];
        
    } else {
        [self setValue:object
                forKey:key];
    }
}

- (id)cl_safeObjectForKey:(id)key {
    
    if (key != nil) {
        
        return [self objectForKey:key];
        
    } else {
        
        return nil;
    }
}

- (id)cl_safeKeyForValue:(id)value {
    
    for (id key in self.allKeys) {
        
        if ([value isEqual:[self objectForKey:key]]) {
            
            return key;
        }
    }
    return nil;
}

+ (NSMutableDictionary *)cl_mutableDictionaryWithPlistData:(NSData *)plist {
    
    if (!plist) {
        
        return nil;
    }
    
    NSMutableDictionary *cl_mutableDictionary = [NSPropertyListSerialization propertyListWithData:plist
                                                                                          options:NSPropertyListMutableContainersAndLeaves
                                                                                           format:NULL
                                                                                            error:NULL];
    
    if ([cl_mutableDictionary isKindOfClass:[NSMutableDictionary class]]) {
        
        return cl_mutableDictionary;
    }
    
    return nil;
}

- (NSMutableDictionary *)cl_popEntriesForKeys:(NSArray *)keys {

    NSMutableDictionary *cl_mutableDictionary = [NSMutableDictionary dictionary];
    
    for (id key in keys) {
        
        id value = self[key];
        
        if (value) {
            
            [self removeObjectForKey:key];
            
            cl_mutableDictionary[key] = value;
        }
    }
    
    return cl_mutableDictionary;
}

@end
