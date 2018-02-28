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
    
    [self cl_array];
    [self cl_mutableArray];
    
    [self ex_reloadTextView];
}

- (void)cl_array {
    
    //    这么写会直接Cash
    //    NSArray *cl_array = [NSArray arrayWithObject:nil];
    
    NSArray *cl_safeArray = [NSArray cl_initSafeArrayWithObject:nil];
    
    [self.ex_textViewString appendFormat:@"NSArray:\n创建数组: %@\n", cl_safeArray];
    [self.ex_textViewString appendFormat:@"获取对象的索引: %lud\n", (unsigned long)[cl_safeArray cl_safeIndexOfObject:@"Hello Word"]];
    [self.ex_textViewString appendFormat:@"获取指定区间的数组: %@\n", [cl_safeArray cl_safeArrayWithRange:NSMakeRange(0, 10)]];
    [self.ex_textViewString appendFormat:@"获取指定索引的对象: %@\n", [cl_safeArray cl_safeObjectAtIndex:10]];
    [self.ex_textViewString appendFormat:@"获取指定Plist文件的数组: %@\n\n", [NSArray cl_getArrayWithPlistName:@"Array"]];
}

- (void)cl_mutableArray {
    
    NSMutableArray *cl_safeMutableArray = [[NSMutableArray alloc] init];
    
    [cl_safeMutableArray cl_addSafeObject:nil];
    [cl_safeMutableArray cl_addSafeObject:@"Hello Word"];
    
    [self.ex_textViewString appendFormat:@"NSMutableArray:\n安全的添加一个对象: %@\n", cl_safeMutableArray];
    
    [cl_safeMutableArray cl_insertSafeObject:@"13800138000"
                                       index:10];
    
    [self.ex_textViewString appendFormat:@"安全的插入一个对象: %@\n", cl_safeMutableArray];
    
    NSIndexSet *cl_indexSet = [NSIndexSet indexSetWithIndex:1000];
    
    [cl_safeMutableArray cl_insertSafeArray:@[@"acount", @"passowrd"]
                                   indexSet:cl_indexSet];
    
    [self.ex_textViewString appendFormat:@"安全的插入一个数组: %@\n", cl_safeMutableArray];
    
    [cl_safeMutableArray cl_safeRemoveObjectAtIndex:10];
    
    [self.ex_textViewString appendFormat:@"安全的删除索引为10的对象: %@\n", cl_safeMutableArray];
    
    [cl_safeMutableArray cl_safeRemoveObjectsInRange:NSMakeRange(2, 1)];
    
    [self.ex_textViewString appendFormat:@"安全的区域为2~1的对象: %@\n", cl_safeMutableArray];
}

@end
