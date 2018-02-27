//
//  EXObjectController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/24.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXObjectController.h"

@interface EXObjectController ()

@end

@implementation EXObjectController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.ex_textViewString appendFormat:@"RunTime:\n"];
    [self.ex_textViewString appendFormat:@"获取已注册类的列表数量(太多了): %ld\n\n", [[NSObject cl_getClassList] count]];
    [self.ex_textViewString appendFormat:@"获取指定类的方法列表: %@\n\n", [NSObject cl_getClassMethodListWithClass:[NSArray class]]];
    [self.ex_textViewString appendFormat:@"获取指定类的属性列表: %@\n\n", [NSObject cl_getPropertyListWithClass:[NSArray class]]];
    [self.ex_textViewString appendFormat:@"获取指定类的成员变量列表: %@\n\n", [NSObject cl_getIVarListWithClass:[NSObject class]]];
    [self.ex_textViewString appendFormat:@"获取指定类的协议列表: %@\n\n", [NSObject cl_getProtocolListWithClass:[NSArray class]]];
    
    NSString *cl_hash = @"hash";
    NSString *cl_isa = @"isa";

    [self.ex_textViewString appendFormat:@"NSObject是否包含\"%@\"属性: %@\n\n", cl_hash, [NSObject cl_hasPropertyWithKey:cl_hash] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"NSObject是否包含\"%@\"成员变量: %@\n\n", cl_isa, [NSObject cl_hasIvarWithKey:cl_isa] ? @"YES" : @"NO"];

    [self ex_reloadTextView];
}

@end
