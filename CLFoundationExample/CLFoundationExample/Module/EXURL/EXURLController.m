//
//  EXURLController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/15.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXURLController.h"

@interface EXURLController ()

@end

@implementation EXURLController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.ex_textViewString appendFormat:@"获取Document的URL路径: %@\n\n", [NSURL cl_getDocumentURLPath]];
    [self.ex_textViewString appendFormat:@"获取Library的URL路径: %@\n\n", [NSURL cl_getLibraryURLPath]];
    [self.ex_textViewString appendFormat:@"获取Caches的URL路径: %@\n\n", [NSURL cl_getCachesURLPath]];

    [self ex_reloadTextView];
}

@end
