//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  NSBundle+CLBundle.m
//
//  Created by Cain on 2017/6/8.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "NSBundle+CLBundle.h"

@implementation NSBundle (CLBundle)

+ (NSString *)cl_getBundleDisplayName {
    
    return [[[self mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

+ (NSString *)cl_getBundleScheme {
    
    NSString *cl_bundleIndentifier = [[self mainBundle] bundleIdentifier];
    
    NSArray<NSDictionary *> *cl_bundleURLTypes = [[[self mainBundle] infoDictionary] valueForKey:@"CFBundleURLTypes"];
    
    NSString __block *cl_schemeString;
    
    [cl_bundleURLTypes enumerateObjectsUsingBlock:^(NSDictionary *cl_dictionary, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *cl_bundleURLName = [cl_dictionary valueForKey:@"CFBundleURLName"];
        
        if ([cl_bundleURLName isEqualToString:cl_bundleIndentifier]) {
            
            cl_schemeString = [[cl_dictionary valueForKey:@"CFBundleURLSchemes"] objectAtIndex:0];
        }
    }];
    
    return cl_schemeString;
}

+ (NSString *)cl_getBundleShortVersionString {
    
    return [[[self mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)cl_getBundleVersion {
    
    return [[[self mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSString *)cl_getBundleIdentifier {
    
    return [[self mainBundle] bundleIdentifier];
}

+ (NSString *)cl_getBundleFileWithName:(NSString *)name
                                  type:(NSString *)type {
    
    return [[self mainBundle] pathForResource:name
                                       ofType:type];
}

@end
