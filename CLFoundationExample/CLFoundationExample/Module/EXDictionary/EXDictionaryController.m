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
    
    [self.ex_textViewString appendString:@"----------NSDictionary----------\n"];
    [self.ex_textViewString appendFormat:@"URL Dictionary: %@\n\n", cl_urlDictionary];
    
    [self.ex_textViewString appendString:@"----------NSMutableDictionary----------\n"];
    [self.ex_textViewString appendFormat:@"安全的存储一个空的键值对: %@\n", cl_mutableDictionary];
    [self.ex_textViewString appendFormat:@"安全的获取一个空的Key: %@\n", [cl_mutableDictionary cl_safeKeyForValue:@"13800138000"]];
    [self.ex_textViewString appendFormat:@"安全的获取一个空的Value: %@\n", [cl_mutableDictionary cl_safeObjectForKey:@"acount"]];

    [self ex_reloadTextView];    
}

@end
