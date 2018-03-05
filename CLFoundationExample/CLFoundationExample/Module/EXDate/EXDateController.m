//
//  EXDateController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/14.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXDateController.h"

@interface EXDateController ()

@end

@implementation EXDateController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDateFormatter *cl_dateFormatter = [[NSDateFormatter alloc] init];
    
    cl_dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm";

    [self.ex_textViewString appendString:@"----------时间戳处理/计算日期----------\n"];
    [self.ex_textViewString appendFormat:@"获取与当前时间的时间差: %@\n", [NSDate cl_compareCureentTimeWithDate:1508617983]];
    [self.ex_textViewString appendFormat:@"当前的时间戳: %@\n", [NSDate cl_getCurrentTimeStamp]];
    [self.ex_textViewString appendFormat:@"时间戳转日期: %@\n", [NSDate cl_displayTimeWithTimeStamp:1508617983]];
    [self.ex_textViewString appendFormat:@"时间戳转指定格式日期: %@\n", [NSDate cl_displayTimeWithTimeStamp:1508617983
                                                                                              formatter:@"yyyy-MM-dd HH:mm:ss"]];
    [self.ex_textViewString appendFormat:@"计算指定的日期是今天/明天/后天: %@\n", [NSDate cl_calculateDaysWithDate:[NSDate date]]];

    NSDate *cl_tomorrowDate = [NSDate cl_getTomorrowDay:[NSDate date]];
    
    NSDate *cl_nDate = [NSDate cl_getDaysDateWithDate:[NSDate date]
                                                 days:10];
    
    [self.ex_textViewString appendString:@"\n----------日期相关处理----------\n"];
    [self.ex_textViewString appendFormat:@"获取指定当前日期的纪元: %ld\n", (long)[NSDate cl_getEraWithDate:[NSDate date]]];
    [self.ex_textViewString appendFormat:@"获取指定当前日期的年: %ld\n", (long)[NSDate cl_getYearWithDate:[NSDate date]]];
    [self.ex_textViewString appendFormat:@"获取指定当前日期的月: %ld\n", (long)[NSDate cl_getMonthWithDate:[NSDate date]]];
    [self.ex_textViewString appendFormat:@"获取指定当前日期的日: %ld\n", (long)[NSDate cl_getDayWithDate:[NSDate date]]];
    [self.ex_textViewString appendFormat:@"获取指定当前日期的时: %ld\n", (long)[NSDate cl_getHourWithDate:[NSDate date]]];
    [self.ex_textViewString appendFormat:@"获取指定当前日期的分: %ld\n", (long)[NSDate cl_getMinuteWithDate:[NSDate date]]];
    [self.ex_textViewString appendFormat:@"获取指定当前日期的秒: %ld\n", (long)[NSDate cl_getSecondWithDate:[NSDate date]]];
    [self.ex_textViewString appendFormat:@"获取当前日期第二年的日期: %@\n", [NSDate cl_getYearDateWithDate:[NSDate date]
                                                                                                years:2]];
    [self.ex_textViewString appendFormat:@"获取当前日期第二月的日期: %@\n", [NSDate cl_getMonthDateWithDate:[NSDate date]
                                                                                                months:2]];
    [self.ex_textViewString appendFormat:@"获取当前日期第二天的日期: %@\n", [NSDate cl_getDaysDateWithDate:[NSDate date]
                                                                                                 days:2]];

    [self.ex_textViewString appendFormat:@"获取指定日期是这周的第%ld天(第1天是周日)\n", (long)[NSDate cl_getWeekdayStringFromDate:[NSDate date]]];
    [self.ex_textViewString appendFormat:@"获取指定NSDate的第一天日期: %@\n", [cl_dateFormatter stringFromDate:[NSDate cl_getMonthFirstDeteWithDate:[NSDate date]]]];
    [self.ex_textViewString appendFormat:@"获取指定NSDate的最后一天日期: %@\n", [cl_dateFormatter stringFromDate:[NSDate cl_getMonthLastDayWithDate:[NSDate date]]]];
    [self.ex_textViewString appendFormat:@"获取指定NSDate的在一年中是第几周: %lu\n", [NSDate cl_getWeekOfYearWithDate:[NSDate date]]];
    [self.ex_textViewString appendFormat:@"获取指定日期的第二天: %@\n", [cl_dateFormatter stringFromDate:cl_tomorrowDate]];
    [self.ex_textViewString appendFormat:@"获取指定日期的第N天: %@\n", [cl_dateFormatter stringFromDate:cl_nDate]];
    
    [self.ex_textViewString appendString:@"\n----------日期判断----------\n"];
    [self.ex_textViewString appendFormat:@"判断当前日期是否是闰年: %@\n", [NSDate cl_isLeapYear:[NSDate date]] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"判断当前日期是否是今天: %@\n", [NSDate cl_checkTodayWithDate:[NSDate date]] ? @"YES" : @"NO"];

    
    [self ex_reloadTextView];
}

@end
