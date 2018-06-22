//
//  EXArrayController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/14.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXArrayController.h"

@interface EXArrayController ()

@end

@implementation EXArrayController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self ex_array];
    [self ex_mutableArray];
    
    [self ex_reloadTextView];
}

- (void)ex_array {
    
    //    这么写会直接Cash
    //    NSArray *cl_array = [NSArray arrayWithObject:nil];
    
    NSArray *ex_safeArray = [NSArray cl_initSafeArrayWithObject:nil];
    
    [self.ex_textViewString appendString:@"----------NSArray----------\n"];
    [self.ex_textViewString appendFormat:@"创建数组: %@\n", ex_safeArray];
    [self.ex_textViewString appendFormat:@"获取对象的索引: %lud\n", (unsigned long)[ex_safeArray cl_safeIndexOfObject:@"Hello Word"]];
    [self.ex_textViewString appendFormat:@"获取指定区间的数组: %@\n", [ex_safeArray cl_safeArrayWithRange:NSMakeRange(0, 10)]];
    [self.ex_textViewString appendFormat:@"获取指定索引的对象: %@\n", [ex_safeArray cl_safeObjectAtIndex:10]];
    [self.ex_textViewString appendFormat:@"获取指定Plist文件的数组: %@\n", [NSArray cl_getArrayWithPlistName:@"Array"]];

    NSArray *ex_friendArray = @[@"A", @"B", @"C", @"E", @"F"];
    
    NSData *ex_arrayData = [NSPropertyListSerialization dataWithPropertyList:ex_friendArray
                                                                      format:NSPropertyListBinaryFormat_v1_0
                                                                     options:NSPropertyListImmutable
                                                                       error:nil];
    
    NSArray *ex_array = [NSArray cl_arrayWithPlistData:ex_arrayData];
    
    NSMutableArray *ex_mutableArray = [[NSMutableArray alloc] initWithArray:ex_array];
    
    [self.ex_textViewString appendFormat:@"获取长度为\"%ld\"NSData序列化数组: %@\n\n", ex_arrayData.length, ex_array];
    [self.ex_textViewString appendFormat:@"获取倒序排列的数组: %@\n", [ex_mutableArray cl_getReverseArray]];
    [self.ex_textViewString appendFormat:@"获取乱序排列的数组: %@\n", [ex_mutableArray cl_getDisorderArray]];
    
    NSString *ex_jsonString = [NSString cl_jsonStringWithObject:ex_friendArray];
    
    [self.ex_textViewString appendFormat:@"JSON %@ To Array: %@\n", ex_jsonString, [NSArray cl_getArrayWithJSONString:ex_jsonString]];
}

- (void)ex_mutableArray {
    
    NSMutableArray *ex_safeMutableArray = [[NSMutableArray alloc] init];
    
    [ex_safeMutableArray cl_addSafeObject:nil];
    [ex_safeMutableArray cl_addSafeObject:@"Hello Word"];
    
    [self.ex_textViewString appendString:@"\n----------NSMutableArray----------\n"];
    [self.ex_textViewString appendFormat:@"安全的添加一个对象: %@\n", ex_safeMutableArray];
    
    [ex_safeMutableArray cl_insertSafeObject:@"13800138000"
                                       index:10];
    
    [self.ex_textViewString appendFormat:@"安全的插入一个对象: %@\n", ex_safeMutableArray];
    
    NSIndexSet *ex_indexSet = [NSIndexSet indexSetWithIndex:1000];
    
    [ex_safeMutableArray cl_insertSafeArray:@[@"acount", @"passowrd"]
                                   indexSet:ex_indexSet];
    
    [self.ex_textViewString appendFormat:@"安全的插入一个数组: %@\n", ex_safeMutableArray];
    
    [ex_safeMutableArray cl_safeRemoveObjectAtIndex:10];
    
    [self.ex_textViewString appendFormat:@"安全的删除索引为10的对象: %@\n", ex_safeMutableArray];
    
    [ex_safeMutableArray cl_safeRemoveObjectsInRange:NSMakeRange(2, 1)];
    
    [self.ex_textViewString appendFormat:@"安全的区域为2~1的对象: %@\n", ex_safeMutableArray];
}

@end
