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

//+ (void)load {
//    
//    NSArray *bundleID = @[@"com.fishSwimInformation.FishSwimInformation",
//                          @"com.CainLuo.SimpleProject"];
//    
//    if (![bundleID containsObject:[[NSBundle mainBundle] bundleIdentifier]]) {
//        
//        NSAssert(nil, @"你没有权利使用该框架");
//    }
//}

+ (NSString *)cl_getBundleDisplayName {
    
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

+ (NSString *)cl_getBundleShortVersionString {
    
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)cl_getBundleVersion {
    
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSString *)cl_getBundleIdentifier {
    
    return [[NSBundle mainBundle] bundleIdentifier];
}

@end
