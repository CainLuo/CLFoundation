//
//  NSFileManager+CLFileManager.h
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/28.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (CLFileManager)

#pragma mark - Cache相关
/**
 存储NSData到CLDataCache文件夹

 @param data NSData
 @param identifier NSString
 @return BOOL
 */
+ (BOOL)cl_saveDataCacheWithData:(NSData *)data
                      identifier:(NSString *)identifier;

/**
 存储NSData到指定Cache文件夹
 
 @param data NSData
 @param cacheName NSString
 @param identifier NSString
 @return BOOL
 */
+ (BOOL)cl_saveDataCacheWithData:(NSData *)data
                       cacheName:(NSString *)cacheName
                      identifier:(NSString *)identifier;

/**
 获取CLDataCache里的NSData

 @param identifier NSString
 @return NSData
 */
+ (NSData *)cl_getDataCacheWithIdentifier:(NSString *)identifier;

/**
 获取指定Cache文件夹里的NSData
 
 @param cacheName NSString
 @param identifier NSString
 @return NSData
 */
+ (NSData *)cl_getDataCacheWithCacheName:(NSString *)cacheName
                              identifier:(NSString *)identifier;

/**
 删除CLDataCache里的数据
 */
+ (BOOL)cl_removeDataWithCache;

/**
 删除指定Cache文件夹里的数据

 @param cacheName NSString
 */
+ (BOOL)cl_removeDataWithCacheWithCacheName:(NSString *)cacheName;

#pragma mark - Document
/**
 存储指定fileName文件到Document

 @param object id
 @param fileName NSString
 @return BOOL
 */
+ (BOOL)cl_saveDocumentWithObject:(id)object
                         fileName:(NSString *)fileName;

/**
 删除Document里指定的fileName文件

 @param fileName NSString
 @return BOOL
 */
+ (BOOL)cl_removeDocumentObjectWithFileName:(NSString *)fileName;

/**
 获取Document里指定的fileName文件

 @param fileName NSString
 @return id
 */
+ (id)cl_getDocumentObjectWithFileName:(NSString *)fileName;

/**
 检查路径里的文件是否存在

 @param filePath NSString
 @return BOOL
 */
+ (BOOL)cl_checkFileExistWithFilePath:(NSString *)filePath;

#pragma mark - 获取App的沙盒大小
/**
 获取App的沙盒大小, 单位为字节
 
 @return NSUInteger
 */
+ (NSUInteger)cl_getApplicationDocumentSize;

/**
 获取App的Cache大小, 单位为字节

 @return NSUInteger
 */
+ (NSUInteger)cl_getApplicationCacheSize;

/**
 获取App的Library的大小, 单位为字节

 @return NSUInteger
 */
+ (NSUInteger)cl_getApplicationLibrarySize;

/**
 获取指定文件夹路径的大小, 单位为字节

 @param folderPath NSString
 @return NSUInteger
 */
+ (NSUInteger)cl_getApplicationFileSizeWithFilePath:(NSString *)folderPath;

@end
