//
//  NSFileManager+CLFileManager.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/28.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "NSFileManager+CLFileManager.h"
#import "NSURL+CLURL.h"
#import "NSString+CLString.h"

@implementation NSFileManager (CLFileManager)

#pragma mark - 获取Cache Path
+ (NSString *)cl_checkCachePathWithCacheName:(NSString *)cacheName {
    
    NSString *cl_cachePath = [NSURL cl_getCachesPathURL];
    
    cl_cachePath = [cl_cachePath stringByAppendingPathComponent:cacheName];
    
    if (![[self defaultManager] fileExistsAtPath:cl_cachePath]) {
        
        [[self defaultManager] createDirectoryAtPath:cl_cachePath
                         withIntermediateDirectories:YES
                                          attributes:nil
                                               error:nil];
    }

    return cl_cachePath;
}

#pragma mark - 保存数据到Cache
+ (BOOL)cl_saveDataCacheWithData:(NSData *)data
                      identifier:(NSString *)identifier {
    
    return [self cl_saveDataCacheWithData:data
                                cacheName:@"CLDataCache"
                               identifier:identifier];
}

+ (BOOL)cl_saveDataCacheWithData:(NSData *)data
                       cacheName:(NSString *)cacheName
                      identifier:(NSString *)identifier {
    
    NSString *cl_cachePath = [self cl_checkCachePathWithCacheName:cacheName];
    
    NSString *path = [cl_cachePath stringByAppendingPathComponent:[NSString cl_encodingMD5WithString:identifier]];
    
    return [data writeToFile:path
                  atomically:YES];
}

#pragma mark - 获取Cache的数据
+ (NSData *)cl_getDataCacheWithIdentifier:(NSString *)identifier {
    
    return [self cl_getDataCacheWithCacheName:@"CLDataCache"
                                   identifier:identifier];
}

+ (NSData *)cl_getDataCacheWithCacheName:(NSString *)cacheName
                              identifier:(NSString *)identifier {
    
    NSString *cl_cachePath     = [self cl_checkCachePathWithCacheName:cacheName];
    NSString *cl_identifierMD5 = [NSString cl_encodingMD5WithString:identifier];
    NSString *cl_dataPath      = [cl_cachePath stringByAppendingPathComponent:cl_identifierMD5];
    
    NSData *cl_data = [NSData dataWithContentsOfFile:cl_dataPath];
    
    [self cl_appendFilePath:cacheName];

    return cl_data;
}

#pragma mark - 删除Cache里的数据
+ (BOOL)cl_removeDataWithCache {
    
    return [self cl_removeDataWithCacheWithCacheName:@"CLDataCache"];
}

+ (BOOL)cl_removeDataWithCacheWithCacheName:(NSString *)cacheName {
    
    NSString *cl_cachePath = [self cl_checkCachePathWithCacheName:cacheName];

    return [[self defaultManager] removeItemAtPath:cl_cachePath
                                             error:nil];
}

#pragma mark - Document
+ (NSString *)cl_appendFilePath:(NSString *)fileName {
    
    NSString *cl_documentsPath = [NSURL cl_getDocumentPathURL];
    
    NSString *cl_filePath = [NSString stringWithFormat:@"%@/%@.archiver", cl_documentsPath,fileName];
    
    return cl_filePath;
}

+ (BOOL)cl_saveDocumentWithObject:(id)object
                         fileName:(NSString *)fileName {
    
    NSString *cl_documentsPath = [self cl_appendFilePath:fileName];
    
    return [NSKeyedArchiver archiveRootObject:object
                                       toFile:cl_documentsPath];
}

+ (id)cl_getDocumentObjectWithFileName:(NSString *)fileName {
    
    NSString *cl_documentsPath = [self cl_appendFilePath:fileName];
    
    return [NSKeyedUnarchiver unarchiveObjectWithFile:cl_documentsPath];
}

+ (BOOL)cl_removeDocumentObjectWithFileName:(NSString *)fileName {
    
    NSString *cl_documentsPath = [self cl_appendFilePath:fileName];
    
    return [[self defaultManager] removeItemAtPath:cl_documentsPath
                                             error:nil];
}

+ (BOOL)cl_checkFileExistWithFilePath:(NSString *)filePath {
    
    BOOL isDirectory;
    
    return [[self defaultManager] fileExistsAtPath:filePath
                                       isDirectory:&isDirectory];
}

+ (NSUInteger)cl_getApplicationDocumentSize {
        
    NSString *cl_documentPath = [NSString stringWithFormat:@"%@", [NSURL cl_getDocumentPathURL]];
    
    return [self cl_getApplicationFileSizeWithFilePath:cl_documentPath];
}

+ (NSUInteger)cl_getApplicationCacheSize {

    NSString *cl_cachesPath = [NSString stringWithFormat:@"%@", [NSURL cl_getCachesPathURL]];
    
    return [self cl_getApplicationFileSizeWithFilePath:cl_cachesPath];
}

+ (NSUInteger)cl_getApplicationLibrarySize {
    
    NSString *cl_libraryPath = [NSString stringWithFormat:@"%@", [NSURL cl_getLibraryPathURL]];
    
    return [self cl_getApplicationFileSizeWithFilePath:cl_libraryPath];
}

+ (NSUInteger)cl_getApplicationFileSizeWithFilePath:(NSString *)folderPath {
    
    NSArray *cl_contentArray = [[self defaultManager] contentsOfDirectoryAtPath:folderPath
                                                                          error:nil];
    
    NSEnumerator *cl_enumerator = [cl_contentArray objectEnumerator];
    
    NSString *cl_file;
    
    unsigned long long cl_folderSize = 0;
    
    while (cl_file = [cl_enumerator nextObject]) {
        
        NSString *cl_filePath = [folderPath stringByAppendingPathComponent:cl_file];

        NSDictionary *cl_fileDictionary = [[NSFileManager defaultManager] attributesOfItemAtPath:cl_filePath
                                                                                           error:nil];
        cl_folderSize += [[cl_fileDictionary objectForKey:NSFileSize] intValue];
    }
    
    return cl_folderSize;
}

@end
