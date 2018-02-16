//
//  CLBundleController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/14.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLBundleController.h"

@interface CLBundleController ()

@end

@implementation CLBundleController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.cl_textViewString appendFormat:@"Building号: %@", [NSBundle cl_getBundleVersion]];
    [self.cl_textViewString appendFormat:@"Version 号: %@", [NSBundle cl_getBundleShortVersionString]];
    [self.cl_textViewString appendFormat:@"Bundle ID: %@", [NSBundle cl_getBundleIdentifier]];
    [self.cl_textViewString appendFormat:@"显示的名字: %@", [NSBundle cl_getBundleDisplayName]];

    [self cl_reloadTextView];
}

@end
