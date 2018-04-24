//
//  NSDictionary+CLDictionary.m
//  SimpleProject
//
//  Created by Cain on 2017/8/28.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "NSDictionary+CLDictionary.h"
#import "NSString+CLString.h"

@implementation NSDictionary (CLDictionary)

+ (NSDictionary *)cl_dictionaryWithPlistData:(NSData *)plist {
    
    if (!plist) {
        return nil;
        
    }
    
    NSDictionary *dictionary = [NSPropertyListSerialization propertyListWithData:plist
                                                                         options:NSPropertyListImmutable
                                                                          format:NULL
                                                                           error:NULL];
    if ([dictionary isKindOfClass:[NSDictionary class]]) {
        
        return dictionary;
    }
    
    return nil;
}

+ (NSDictionary *)cl_dictionaryWithURLString:(NSString *)urlString {
    
    NSString *cl_queryString;
    
    if ([urlString containsString:@"?"]) {
        
        NSArray *cl_urlArray = [urlString componentsSeparatedByString:@"?"];
        
        cl_queryString = cl_urlArray.lastObject;
    } else {
        
        cl_queryString = urlString;
    }
    
    NSMutableDictionary *cl_queryDictionary = [NSMutableDictionary dictionary];
    
    NSArray *cl_parameters = [cl_queryString componentsSeparatedByString:@"&"];
    
    [cl_parameters enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSArray *cl_contents = [obj componentsSeparatedByString:@"="];
        
        NSString *cl_key   = cl_contents.firstObject;
        NSString *cl_value = cl_contents.lastObject;
        
        cl_value = [cl_value stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        if (cl_key && cl_value) {
            
            [cl_queryDictionary setObject:cl_value
                                   forKey:cl_key];
        }
    }];
    
    return [cl_queryDictionary copy];
}

- (NSArray *)cl_getAllKeysSorted {
    return [[self allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

- (NSArray *)cl_getAllValuesSortedByKeys {
    
    NSArray *cl_sortedKeys = [self cl_getAllKeysSorted];
    
    NSMutableArray *cl_array = [NSMutableArray array];
    
    for (id cl_key in cl_sortedKeys) {
        
        [cl_array addObject:self[cl_key]];
    }
    
    return cl_array;
}

- (BOOL)cl_containsObjectForKey:(id)key {
    
    if (!key) {
        
        return NO;
    }
    
    return self[key] != nil;
}

- (NSDictionary *)cl_getDictionaryForKeys:(NSArray *)keys {
    
    NSMutableDictionary *cl_mutableDictionary = [NSMutableDictionary new];
    
    for (id key in keys) {
        
        id value = self[key];
        
        if (value) {
            
            cl_mutableDictionary[key] = value;
        }
    }
    
    return cl_mutableDictionary;
}

@end
