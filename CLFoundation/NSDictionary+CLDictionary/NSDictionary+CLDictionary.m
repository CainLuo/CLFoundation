//
//  NSDictionary+CLDictionary.m
//  SimpleProject
//
//  Created by Cain on 2017/8/28.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "NSDictionary+CLDictionary.h"

@implementation NSDictionary (CLDictionary)

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
    
    id object = nil;
    
    // 检查是否字典对象
    if (![self isKindOfClass:[NSDictionary class]]) {
        
        return object;
    }
    
    // 保证key必须为字符串
    if (key && [key isKindOfClass:[NSString class]]) {
        
        object  = [self cl_safeObjectForKey:key];
    }
    
    return object;
}

- (id)cl_safeKeyForValue:(id)value {
    
    for (id key in self.allKeys) {
        
        if ([value isEqual:[self objectForKey:key]]) {
            
            return key;
        }
    }
    return nil;
}

- (NSString *)toJSONStringForDictionary {
    
    NSData *paramsJSONData = [NSJSONSerialization dataWithJSONObject:self
                                                             options:0
                                                               error:nil];
    
    return [[NSString alloc] initWithData:paramsJSONData
                                 encoding:NSUTF8StringEncoding];
}

@end
