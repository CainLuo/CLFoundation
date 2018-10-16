//
//  EXBundleController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/14.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXBundleController.h"

@interface EXBundleController ()

@end

@implementation EXBundleController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.ex_textViewString appendFormat:@"Building号: %@\n", [NSBundle cl_getBundleVersion]];
    [self.ex_textViewString appendFormat:@"Version 号: %@\n", [NSBundle cl_getBundleShortVersionString]];
    [self.ex_textViewString appendFormat:@"Bundle ID: %@\n", [NSBundle cl_getBundleIdentifier]];
    [self.ex_textViewString appendFormat:@"显示的名字: %@\n", [NSBundle cl_getBundleDisplayName]];
    [self.ex_textViewString appendFormat:@"Application的Scheme: %@\n", [NSBundle cl_getBundleScheme]];
    [self.ex_textViewString appendFormat:@"获取本地的Bundle名: %@\n", [NSBundle cl_getBundleFileWithName:@"CLFoundationExample"
                                                                                              type:@"bundle"]];

    [self ex_reloadTextView];
}

@end
