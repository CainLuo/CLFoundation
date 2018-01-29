//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  NSBundle+CLBundle.h
//
//  Created by Cain on 2017/6/8.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (CLBundle)

/**
 获取App名称

 @return NSString
 */
+ (NSString *)cl_getBundleDisplayName;

/**
 获取App版本号

 @return NSString
 */
+ (NSString *)cl_getBundleShortVersionString;

/**
 获取Build版本号

 @return NSString
 */
+ (NSString *)cl_getBundleVersion;

/**
 获取App Bundle Identifier

 @return NSString
 */
+ (NSString *)cl_getBundleIdentifier;

@end
