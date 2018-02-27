//
//  EXDataController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/14.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXDataController.h"

@interface EXDataController ()

@end

@implementation EXDataController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *cl_image = [UIImage imageNamed:@"1"];
    
    // 压缩前
    NSData *cl_imageData = UIImageJPEGRepresentation(cl_image, 1.0);

    // 压缩后
    NSData *cl_tranformImageData = [NSData cl_compressOriginalImage:cl_image
                                                 compressionQuality:0.5];
    
    [self.ex_textViewString appendFormat:@"压缩前: %lud\n", cl_imageData.length];
    [self.ex_textViewString appendFormat:@"压缩后: %lud", cl_tranformImageData.length];
    
    [self ex_reloadTextView];
}

@end
