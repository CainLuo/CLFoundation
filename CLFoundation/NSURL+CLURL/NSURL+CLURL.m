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
#import "NSString+CLString.h"

@implementation NSURL (CLURL)

+ (void)cl_openBrowserWithURL:(NSString *)urlString {
    
    [[UIApplication sharedApplication] openURL:[self URLWithString:urlString]];
}

#pragma mark - Document
+ (NSURL *)cl_getDocumentFileURL {
    
    return [self cl_getFileURLForDirectory:NSDocumentDirectory];
}

+ (NSString *)cl_getDocumentPathURL {
    
    return [self cl_getPathURLForDirectory:NSDocumentDirectory];
}

#pragma mark - Library
+ (NSURL *)cl_getLibraryFileURL {
    
    return [self cl_getFileURLForDirectory:NSLibraryDirectory];
}

+ (NSString *)cl_getLibraryPathURL {
    
    return [self cl_getPathURLForDirectory:NSLibraryDirectory];
}

#pragma mark - Caches
+ (NSURL *)cl_getCachesFileURL {
    
    return [self cl_getFileURLForDirectory:NSCachesDirectory];
}

+ (NSString *)cl_getCachesPathURL {
    
    return [self cl_getPathURLForDirectory:NSCachesDirectory];
}

#pragma mark - 获取File URL
+ (NSURL *)cl_getFileURLForDirectory:(NSSearchPathDirectory)directory {
    
    NSArray *cl_urlArray = [NSFileManager.defaultManager URLsForDirectory:directory
                                                                inDomains:NSUserDomainMask];
    
    return cl_urlArray.lastObject;
}

#pragma mark - 获取Path URL
+ (NSString *)cl_getPathURLForDirectory:(NSSearchPathDirectory)directory {
    
    NSArray *cl_urlArray = NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES);
    
    return [NSString stringWithFormat:@"%@", cl_urlArray.firstObject];
}

@end
