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
    
    [self.ex_textViewString appendString:@"----------获取File URL----------\n"];
    [self.ex_textViewString appendFormat:@"获取Document的File URL路径: %@\n\n", [NSURL cl_getDocumentFileURL]];
    [self.ex_textViewString appendFormat:@"获取Library的FileURL路径: %@\n\n", [NSURL cl_getLibraryFileURL]];
    [self.ex_textViewString appendFormat:@"获取Caches的FileURL路径: %@\n\n", [NSURL cl_getCachesFileURL]];
    
    [self.ex_textViewString appendString:@"----------获取Path URL----------\n"];
    [self.ex_textViewString appendFormat:@"获取Document的Path URL路径: %@\n\n", [NSURL cl_getDocumentPathURL]];
    [self.ex_textViewString appendFormat:@"获取Library的Path URL路径: %@\n\n", [NSURL cl_getLibraryPathURL]];
    [self.ex_textViewString appendFormat:@"获取Caches的Path URL路径: %@\n\n", [NSURL cl_getCachesPathURL]];

    [self ex_reloadTextView];
}

@end
