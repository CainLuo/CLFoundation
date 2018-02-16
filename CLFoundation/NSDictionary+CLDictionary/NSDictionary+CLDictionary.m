//
//  NSDictionary+CLDictionary.m
//  SimpleProject
//
//  Created by Cain on 2017/8/28.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "NSDictionary+CLDictionary.h"

@implementation NSDictionary (CLDictionary)

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

@end
