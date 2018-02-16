//
//  CLStringController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/15.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLStringController.h"

@interface CLStringController ()

@end

@implementation CLStringController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.cl_textViewString appendFormat:@"过滤后获得的数字为: %@\n", [NSString cl_getNumberWithString:@"a3b2c13d4e5fg98098"]];
    [self.cl_textViewString appendFormat:@"屏蔽手机号中间四位数: %@\n", [NSString cl_getSecrectStringWithPhoneNumber:@"13800138000"]];
    [self.cl_textViewString appendFormat:@"屏蔽银行卡号中间八位数: %@\n", [NSString cl_getSecrectStringWithCardNumber:@"1234567890987654321"]];

    NSString *cl_stringHeight = @"字符串高度";
    
    [self.cl_textViewString appendFormat:@"获取指定字符串字号的高度: %f\n", [cl_stringHeight cl_heightWithFontSize:20
                                                                                                         width:cl_stringHeight.length]];

    
    [self cl_reloadTextView];
}

@end
