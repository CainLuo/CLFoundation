//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  NSURL+CLURL.m
//
//  Created by Cain on 2017/7/10.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "NSURL+CLURL.h"

@implementation NSURL (CLURL)

+ (void)cl_openBrowserWithURL:(NSString *)urlString {
    
    [[UIApplication sharedApplication] openURL:[self URLWithString:urlString]];
}

+ (NSURL *)cl_getURLForDirectory:(NSSearchPathDirectory)directory {
    
    NSArray *cl_urlArray = [NSFileManager.defaultManager URLsForDirectory:directory
                                                                inDomains:NSUserDomainMask];
    
    return cl_urlArray.lastObject;
}

+ (NSURL *)cl_getDocumentURLPath {
    
    return [self cl_getURLForDirectory:NSDocumentDirectory];
}

+ (NSURL *)cl_getLibraryURLPath {
    
    return [self cl_getURLForDirectory:NSLibraryDirectory];
}

+ (NSURL *)cl_getCachesURLPath {
    
    return [self cl_getURLForDirectory:NSCachesDirectory];
}

@end
