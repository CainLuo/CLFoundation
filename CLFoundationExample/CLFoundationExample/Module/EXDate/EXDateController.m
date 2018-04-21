//
//  EXDateController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/14.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXDateController.h"

@interface EXDateController ()

@property (nonatomic, strong) NSDateFormatter *ex_dateFormatter;

@end

@implementation EXDateController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self ex_dateCalculation];
    [self ex_dateProperty];
    [self ex_dateProcessing];
    [self ex_dateFormat];
    [self ex_dateJudgment];
    
    [self ex_reloadTextView];
}

- (void)ex_dateCalculation {
    
    [self.ex_textViewString appendString:@"----------时间戳处理/计算日期----------\n"];
    [self.ex_textViewString appendFormat:@"获取与当前时间的时间差: %@\n", [NSDate cl_compareCureentTimeWithDate:1508617983]];
    [self.ex_textViewString appendFormat:@"当前的时间戳字符串: %@\n", [NSDate cl_getCurrentTimeStampString]];
    [self.ex_textViewString appendFormat:@"当前的时间戳: %f\n", [NSDate cl_getCurrentTimeStamp]];
    [self.ex_textViewString appendFormat:@"时间戳转日期: %@\n", [NSDate cl_displayTimeWithTimeStamp:1508617983]];
    [self.ex_textViewString appendFormat:@"计算指定的日期是今天/明天/后天: %@\n", [NSDate cl_calculateDaysWithDate:[NSDate date]]];
}

- (void)ex_dateProperty {
    
    [self.ex_textViewString appendString:@"\n----------NSDate的属性----------\n"];
    
    [self.ex_textViewString appendFormat:@"获取\"%@\"的年: %ld\n", [NSDate date], (long)[NSDate date].cl_year];
    [self.ex_textViewString appendFormat:@"获取\"%@\"的月: %ld\n", [NSDate date], (long)[NSDate date].cl_month];
    [self.ex_textViewString appendFormat:@"获取\"%@\"的日: %ld\n", [NSDate date], (long)[NSDate date].cl_day];
    [self.ex_textViewString appendFormat:@"获取\"%@\"的时: %ld\n", [NSDate date], (long)[NSDate date].cl_hour];
    [self.ex_textViewString appendFormat:@"获取\"%@\"的分: %ld\n", [NSDate date], (long)[NSDate date].cl_minute];
    [self.ex_textViewString appendFormat:@"获取\"%@\"的秒: %ld\n", [NSDate date], (long)[NSDate date].cl_second];
    [self.ex_textViewString appendFormat:@"获取\"%@\"的纳秒: %ld\n", [NSDate date], (long)[NSDate date].cl_nanosecond];
    [self.ex_textViewString appendFormat:@"获取\"%@\"在一周里的第几天: %ld\n", [NSDate date], (long)[NSDate date].cl_weekday];
    [self.ex_textViewString appendFormat:@"获取\"%@\"在本周的序号: %ld\n", [NSDate date], (long)[NSDate date].cl_weekdayOrdinal];
    [self.ex_textViewString appendFormat:@"获取\"%@\"在本月里是第几周: %ld\n", [NSDate date], (long)[NSDate date].cl_weekOfMonth];
    [self.ex_textViewString appendFormat:@"获取\"%@\"是一年里的第几周: %ld\n", [NSDate date], (long)[NSDate date].cl_weekOfYear];
    [self.ex_textViewString appendFormat:@"获取\"%@\"的归属年份: %ld\n", [NSDate date], (long)[NSDate date].cl_yearForWeekOfYear];
    [self.ex_textViewString appendFormat:@"判断\"%@\"是否是闰年的月份: %@\n", [NSDate date], [NSDate date].cl_isLeapMonth ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"判断\"%@\"是否是闰年: %@\n", [NSDate date], [NSDate date].cl_isLeapYear ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"判断\"%@\"是否是今天: %@\n", [NSDate date], [NSDate date].cl_isToday ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"判断\"%@\"是否是昨天: %@\n", [NSDate date], [NSDate date].cl_isYesterday ? @"YES" : @"NO"];
    
#warning 没搞懂的属性
    [self.ex_textViewString appendFormat:@"获取日期的Quarter: %ld(没搞懂是什么意思)\n", (long)[NSDate date].cl_quarter];
}

- (void)ex_dateProcessing {

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
    [self.ex_textViewString appendFormat:@"获取指定NSDate的第一天日期: %@\n", [self.ex_dateFormatter stringFromDate:[NSDate cl_getMonthFirstDeteWithDate:[NSDate date]]]];
    [self.ex_textViewString appendFormat:@"获取指定NSDate的最后一天日期: %@\n", [self.ex_dateFormatter stringFromDate:[NSDate cl_getMonthLastDayWithDate:[NSDate date]]]];
    [self.ex_textViewString appendFormat:@"获取指定NSDate的在一年中是第几周: %lu\n", (unsigned long)[NSDate cl_getWeekOfYearWithDate:[NSDate date]]];
    [self.ex_textViewString appendFormat:@"获取指定日期的第二天: %@\n", [self.ex_dateFormatter stringFromDate:cl_tomorrowDate]];
    [self.ex_textViewString appendFormat:@"获取指定日期的第N天: %@\n", [self.ex_dateFormatter stringFromDate:cl_nDate]];
}

- (void)ex_dateFormat {
    
    NSTimeZone *ex_timeZone = [[NSTimeZone alloc] initWithName:@"America/Chicago"];
    NSLocale *ex_locale     = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];

    NSTimeInterval ex_timeInterval = [NSDate cl_getCurrentTimeStamp];
    
    [self.ex_textViewString appendString:@"\n----------日期格式化----------\n"];
    [self.ex_textViewString appendFormat:@"获取时间戳%f\"yyyy-MM-dd HH:mm\"格式的字符串日期: %@\n", ex_timeInterval, [NSDate cl_getStringDateWithTimeStamp:ex_timeInterval
                                                                                                                                 formatter:@"yyyy-MM-dd HH:mm"]];
    [self.ex_textViewString appendFormat:@"获取\"yyyy-MM-dd HH:mm\"格式的字符串日期: %@\n", [[NSDate date] cl_getStringDateWithFormatter:@"yyyy-MM-dd HH:mm"]];
    [self.ex_textViewString appendFormat:@"获取NSDate: %@ \"yyyy-MM-dd HH:mm\"格式的字符串日期: %@\n", [NSDate date], [NSDate cl_getStringDateWithDate:[NSDate date]
                                                                                                                                       formatter:@"yyyy-MM-dd HH:mm"]];
    [self.ex_textViewString appendFormat:@"获取America/Chicago\"yyyy-MM-dd HH:mm\"格式的日期: %@\n", [NSDate cl_getStringDateWithDate:[NSDate date]
                                                                                                                         formatter:@"yyyy-MM-dd HH:mm"
                                                                                                                          timeZone:ex_timeZone
                                                                                                                            locale:ex_locale]];
    [self.ex_textViewString appendFormat:@"获取2018-4-10 10:00日期的NSDate对象: %@\n", [NSDate cl_getDateWithDateString:@"2018-4-10 10:00"
                                                                                                       formatter:@"yyyy-MM-dd HH:mm"]];
    [self.ex_textViewString appendFormat:@"获取America/Chicago 2018-4-10- 10:00日期的NSDate对象: %@\n", [NSDate cl_getDateWithDateString:@"2018-4-10 10:00"
                                                                                                                            formatter:@"yyyy-MM-dd HH:mm"
                                                                                                                            timeZone:ex_timeZone
                                                                                                                            locale:ex_locale]];
}

- (void)ex_dateJudgment {
    
    [self.ex_textViewString appendString:@"\n----------日期判断----------\n"];
    [self.ex_textViewString appendFormat:@"判断当前日期是否是闰年: %@\n", [NSDate cl_isLeapYear:[NSDate date]] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"判断当前日期是否是今天: %@\n", [NSDate cl_checkTodayWithDate:[NSDate date]] ? @"YES" : @"NO"];
}

- (NSDateFormatter *)ex_dateFormatter {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_dateFormatter);
    
    _ex_dateFormatter = [[NSDateFormatter alloc] init];
    
    _ex_dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm";

    return _ex_dateFormatter;
}

@end
