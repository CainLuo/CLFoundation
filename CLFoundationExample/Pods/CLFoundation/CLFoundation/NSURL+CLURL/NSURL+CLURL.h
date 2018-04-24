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

#pragma mark - 获取Folder URL
/**
 获取Document File URL
 
 @return NSURL
 */
+ (NSURL *)cl_getDocumentFileURL;

/**
 获取Library File URL
 
 @return NSURL
 */
+ (NSURL *)cl_getLibraryFileURL;

/**
 获取Caches File URL
 
 @return NSURL
 */
+ (NSURL *)cl_getCachesFileURL;

/**
 获取指定NSSearchPathDirectory的File URL
 
 @param directory NSSearchPathDirectory
 @return NSURL
 */
+ (NSURL *)cl_getFileURLForDirectory:(NSSearchPathDirectory)directory;

#pragma mark - 获取Folder Path URL

/**
 获取Document Path URL
 
 @return NSString
 */
+ (NSString *)cl_getDocumentPathURL;

/**
 获取Library Path URL
 
 @return NSString
 */
+ (NSString *)cl_getLibraryPathURL;

/**
 获取Caches Path URL

 @return NSString
 */
+ (NSString *)cl_getCachesPathURL;

/**
 获取指定NSSearchPathDirectory的Path URL
 
 @param directory NSSearchPathDirectory
 @return NSString
 */
+ (NSString *)cl_getPathURLForDirectory:(NSSearchPathDirectory)directory;

@end
