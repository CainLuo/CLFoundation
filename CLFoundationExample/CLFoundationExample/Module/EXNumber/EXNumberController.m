//
//  EXNumberController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/25.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXNumberController.h"

@interface EXNumberController ()

@end

@implementation EXNumberController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat cl_float = 1.799999;
    
    NSNumber *cl_number        = [[NSNumber alloc] initWithDouble:-cl_float];
    NSNumber *cl_ceilingNumber = [[NSNumber alloc] initWithDouble:cl_float];
    NSNumber *cl_floorNumber   = [[NSNumber alloc] initWithDouble:-cl_float];

    [self.ex_textViewString appendString:@"----------NSNumber四舍五入----------\n"];
    [self.ex_textViewString appendFormat:@"将%f四舍五入并限制最长位5位: %@\n", cl_float, [NSNumber cl_roundingWithNumber:cl_number
                                                                                                                  digit:5]];
    [self.ex_textViewString appendFormat:@"将%f正无穷的四舍五入并限制最长位5位: %@\n", cl_float, [NSNumber cl_roundFloorWithNumber:cl_ceilingNumber
                                                                                                                          digit:5]];
    [self.ex_textViewString appendFormat:@"将-%f负无穷的四舍五入并限制最长位5位: %@\n", cl_float, [NSNumber cl_roundFloorWithNumber:cl_floorNumber
                                                                                                                           digit:5]];
    
    [self.ex_textViewString appendString:@"\n----------NSString四舍五入----------\n"];
    [self.ex_textViewString appendFormat:@"将%f四舍五入并限制最长位2位: %@\n", cl_float, [NSNumber cl_displayDecimalWithNumber:cl_ceilingNumber
                                                                                                                     digit:2]];
    [self.ex_textViewString appendFormat:@"将%f四舍五入添加货币符号并限制最长位2位: %@\n", cl_float, [NSNumber cl_displayCurrencyWithNumber:cl_ceilingNumber
                                                                                                                               digit:2]];
    [self.ex_textViewString appendFormat:@"将%f四舍五入添加百分号并限制最长位3位: %@\n", cl_float, [NSNumber cl_displayPercentWithNumber:cl_ceilingNumber
                                                                                                                             digit:3]];

    [self.ex_textViewString appendString:@"\n----------NSNumber转换----------\n"];
    [self.ex_textViewString appendFormat:@"将字符串转换为NSNumber: %@\n", [NSNumber cl_numberWithString:@"0x123412"]];

    
    [self ex_reloadTextView];
}

@end
