//
//  CLURLController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/15.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLURLController.h"

@interface CLURLController ()

@end

@implementation CLURLController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.cl_textViewString appendFormat:@"获取Document的URL路径: %@\n\n", [NSURL cl_getDocumentURLPath]];
    [self.cl_textViewString appendFormat:@"获取Library的URL路径: %@\n\n", [NSURL cl_getLibraryURLPath]];
    [self.cl_textViewString appendFormat:@"获取Caches的URL路径: %@\n\n", [NSURL cl_getCachesURLPath]];
    
    [self cl_reloadTextView];
}

@end
