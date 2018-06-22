//
//  EXDictionaryController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/15.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXDictionaryController.h"

@interface EXDictionaryController ()

@end

@implementation EXDictionaryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableDictionary *cl_mutableDictionary = [[NSMutableDictionary alloc] init];
    
    [cl_mutableDictionary cl_setSafeObject:nil
                                    forKey:@"nil"];

    [cl_mutableDictionary cl_setSafeObject:@"13800138000"
                                    forKey:@"acount"];
    
    NSDictionary *cl_urlDictionary = [NSDictionary cl_dictionaryWithURLString:@"http://www.baidu.com?acount=13800138000&password=123456"];
    
    NSString *ex_jsonString = [NSString cl_jsonStringWithObject:cl_urlDictionary];
    
    [self.ex_textViewString appendString:@"----------NSDictionary----------\n"];
    [self.ex_textViewString appendFormat:@"URL Dictionary: %@\n\n", cl_urlDictionary];
    [self.ex_textViewString appendFormat:@"JSON %@ To Dictionary: %@\n\n", ex_jsonString, [NSDictionary cl_dictionaryWithJSONString:ex_jsonString]];

    [self.ex_textViewString appendString:@"\n----------NSMutableDictionary----------\n"];
    [self.ex_textViewString appendFormat:@"安全的存储一个空的键值对: %@\n", cl_mutableDictionary];
    [self.ex_textViewString appendFormat:@"安全的获取一个空的Key: %@\n", [cl_mutableDictionary cl_safeKeyForValue:@"13800138000"]];
    [self.ex_textViewString appendFormat:@"安全的获取一个空的Value: %@\n", [cl_mutableDictionary cl_safeObjectForKey:@"acount"]];
    
    NSDictionary *ex_dictionaryInfo = @{@"name":@"xiaoming",
                                        @"age":@"19"};
    
    NSData *ex_dictionaryData = [NSPropertyListSerialization dataWithPropertyList:ex_dictionaryInfo
                                                                           format:NSPropertyListBinaryFormat_v1_0
                                                                          options:NSPropertyListImmutable
                                                                            error:nil];
    
    NSDictionary *ex_dictionary = [NSDictionary cl_dictionaryWithPlistData:ex_dictionaryData];

    [self.ex_textViewString appendString:@"\n----------序列化NSDictionary----------\n"];
    [self.ex_textViewString appendFormat:@"获取长度为\"%ld\"的NSData序列化字典: %@\n\n", ex_dictionaryData.length, ex_dictionary];
    [self.ex_textViewString appendFormat:@"获取的\"%@\"排序好的Keys: %@\n\n", ex_dictionary, [ex_dictionary cl_getAllKeysSorted]];
    [self.ex_textViewString appendFormat:@"获取的\"%@\"排序好的Values: %@\n\n", ex_dictionary, [ex_dictionary cl_getAllValuesSortedByKeys]];
    [self.ex_textViewString appendFormat:@"查看\"%@\"是否包含\"name\": %@\n\n", ex_dictionary, [ex_dictionary cl_containsObjectForKey:@"name"] ? @"YES" :@"NO"];
    [self.ex_textViewString appendFormat:@"获取\"%@\"指定Keys的NSDictionary: %@\n\n", ex_dictionary, [ex_dictionary cl_getDictionaryForKeys:@[@"age"]]];
    
    [self ex_reloadTextView];
}

@end
