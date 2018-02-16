//
//  CLDateController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/14.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLDateController.h"

@interface CLDateController ()

@end

@implementation CLDateController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    [self.cl_textViewString appendFormat:@"获取与当前时间的时间差: %@\n", [NSDate cl_compareCureentTimeWithDate:1508617983]];
    [self.cl_textViewString appendFormat:@"当前的时间戳: %@\n", [NSDate cl_changeCureentTimeToTimeStamp]];
    [self.cl_textViewString appendFormat:@"时间戳转日期: %@\n", [NSDate cl_displayTimeWithTimeStamp:1508617983]];
    [self.cl_textViewString appendFormat:@"时间戳转指定格式日期: %@\n", [NSDate cl_displayTimeWithTimeStamp:1508617983
                                                                                                              formatter:@"yyyy-MM-dd HH:mm:ss"]];
    [self.cl_textViewString appendFormat:@"这周的第%ld天, 第一天是周日\n", (long)[NSDate cl_getWeekdayStringFromDate:[NSDate date]]];
    [self.cl_textViewString appendFormat:@"计算指定的日期是今天/明天/后天: %@\n", [NSDate cl_getDays:[NSDate date]]];
    [self.cl_textViewString appendFormat:@"是否是今天: %@\n", [NSDate cl_checkTodayWithDate:[NSDate date]] ? @"YES" : @"NO"];
    
    NSDate *cl_tomorrowDate = [NSDate cl_getTomorrowDay:[NSDate date]];
    NSDate *cl_nDate = [NSDate cl_getDays:[NSDate date]
                                     days:10];
    
    NSDateFormatter *cl_tomorrowDateFormatter = [[NSDateFormatter alloc] init];
    
    cl_tomorrowDateFormatter.dateFormat = @"yyyy-MM-dd HH:mm";
    
    [self.cl_textViewString appendFormat:@"获取指定日期的第二天: %@\n", [cl_tomorrowDateFormatter stringFromDate:cl_tomorrowDate]];
    [self.cl_textViewString appendFormat:@"获取指定日期的第N天: %@\n", [cl_tomorrowDateFormatter stringFromDate:cl_nDate]];

    [self cl_reloadTextView];
}

@end
