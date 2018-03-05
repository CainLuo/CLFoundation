//
//  EXFileManagerController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/3/4.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXFileManagerController.h"

@interface EXFileManagerController ()

@property (nonatomic, copy) NSString *ex_string;

@property (nonatomic, strong) NSData *ex_encodingData;

@end

@implementation EXFileManagerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self ex_designationCache];
    [self ex_clcache];
    [self ex_document];
    [self ex_checkFile];
    
    [self ex_reloadTextView];
}

#pragma mark - Cache
- (void)ex_designationCache {
    
    BOOL ex_saveSuccess = [NSFileManager cl_saveDataCacheWithData:self.ex_encodingData
                                                        cacheName:[NSBundle cl_getBundleDisplayName]
                                                       identifier:@"CLFoundationExample"];
    NSData *ex_data = [NSFileManager cl_getDataCacheWithCacheName:[NSBundle cl_getBundleDisplayName]
                                                       identifier:@"CLFoundationExample"];
    NSString *ex_dataString = [[NSString alloc] initWithData:ex_data
                                                    encoding:NSUTF8StringEncoding];
    BOOL ex_removeSuccess = [NSFileManager cl_removeDataWithCacheWithCacheName:[NSBundle cl_getBundleDisplayName]];

    [self.ex_textViewString appendString:@"----------存储在指定的Cache----------\n"];
    [self.ex_textViewString appendFormat:@"%@存储成功: %@\n", self.ex_string, ex_saveSuccess ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"取出来的数据: %@\n", ex_dataString];
    [self.ex_textViewString appendFormat:@"删除数据成功: %@\n", ex_removeSuccess ? @"YES" : @"NO"];
}

- (void)ex_clcache {
    
    BOOL ex_saveSuccess = [NSFileManager cl_saveDataCacheWithData:self.ex_encodingData
                                                       identifier:@"CLFoundationExample"];
    NSData *ex_data = [NSFileManager cl_getDataCacheWithIdentifier:@"CLFoundationExample"];
    NSString *ex_dataString = [[NSString alloc] initWithData:ex_data
                                                    encoding:NSUTF8StringEncoding];
    BOOL ex_removeSuccess = [NSFileManager cl_removeDataWithCache];

    [self.ex_textViewString appendString:@"\n----------存储在CLDataCache----------\n"];
    [self.ex_textViewString appendFormat:@"%@存储成功: %@\n", self.ex_string, ex_saveSuccess ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"取出来的数据: %@\n", ex_dataString];
    [self.ex_textViewString appendFormat:@"删除数据成功: %@\n", ex_removeSuccess ? @"YES" : @"NO"];
}

#pragma mark - Document
- (void)ex_document {
    
    BOOL ex_saveSuccess = [NSFileManager cl_saveDocumentWithObject:self.ex_encodingData
                                                          fileName:@"EXEncodingData"];
    NSData *ex_data = [NSFileManager cl_getDocumentObjectWithFileName:@"EXEncodingData"];
    NSString *ex_dataString = [[NSString alloc] initWithData:ex_data
                                                    encoding:NSUTF8StringEncoding];
//    BOOL ex_removeSuccess = [NSFileManager cl_removeDocumentObjectWithFileName:@"EXEncodingData"];

    [self.ex_textViewString appendString:@"\n----------存储在Document----------\n"];
    [self.ex_textViewString appendFormat:@"%@存储成功: %@\n", self.ex_string, ex_saveSuccess ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"取出来的数据: %@\n", ex_dataString];
//    [self.ex_textViewString appendFormat:@"删除数据成功: %@\n", ex_removeSuccess ? @"YES" : @"NO"];
}

- (void)ex_checkFile {
    
    NSString *ex_document = [NSURL cl_getDocumentPathURL];
    NSString *ex_filePath = [ex_document stringByAppendingPathComponent:@"EXEncodingData.archiver"];
    
    BOOL ex_fileReal = [NSFileManager cl_checkFileExistWithFilePath:ex_filePath];
    
    [self.ex_textViewString appendString:@"\n----------查询文件是否存在----------\n"];
    [self.ex_textViewString appendFormat:@"检查%@文件是否存在: %@\n", ex_filePath, ex_fileReal ? @"YES" : @"NO"];
}

- (NSString *)ex_string {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_string);
    
    _ex_string = @"Hello Word";
    
    return _ex_string;
}

- (NSData *)ex_encodingData {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_encodingData);
    
    NSString *ex_string = @"Hello Word";
    
    _ex_encodingData = [ex_string dataUsingEncoding:NSUTF8StringEncoding];
    
    return _ex_encodingData;
}

@end
