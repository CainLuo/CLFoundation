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
    
    [self.ex_textViewString appendFormat:@"Building号: %@", [NSBundle cl_getBundleVersion]];
    [self.ex_textViewString appendFormat:@"Version 号: %@", [NSBundle cl_getBundleShortVersionString]];
    [self.ex_textViewString appendFormat:@"Bundle ID: %@", [NSBundle cl_getBundleIdentifier]];
    [self.ex_textViewString appendFormat:@"显示的名字: %@", [NSBundle cl_getBundleDisplayName]];

    [self ex_reloadTextView];
}

@end
