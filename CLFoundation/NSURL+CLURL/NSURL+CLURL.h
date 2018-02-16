//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  NSURL+CLURL.h
//
//  Created by Cain on 2017/7/10.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSURL (CLURL)

/**
 通过传入的URL地址打开外部浏览器

 @param urlString URL地址
 */
+ (void)cl_openBrowserWithURL:(NSString *)urlString;

/**
 获取Document URL Path

 @return NSURL
 */
+ (NSURL *)cl_getDocumentURLPath;

/**
 获取Library URL Path

 @return NSURL
 */
+ (NSURL *)cl_getLibraryURLPath;

/**
 获取Caches URL Path

 @return NSURL
 */
+ (NSURL *)cl_getCachesURLPath;

@end
