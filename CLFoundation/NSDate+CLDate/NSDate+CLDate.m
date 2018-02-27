//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  NSDate+CLDate.m
//
//  Created by Cain on 2017/7/14.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "NSDate+CLDate.h"

@implementation NSDate (CLDate)

#pragma mark - 时间戳处理/计算日期
+ (NSString *)cl_compareCureentTimeWithDate:(NSTimeInterval)timeStamp {
    
    NSDate *cl_timeDate = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    
    NSTimeInterval cl_timeInterval = [cl_timeDate timeIntervalSinceNow];
    
    cl_timeInterval = -cl_timeInterval;
    
    NSInteger temp = 0;
    
    NSCalendar *cl_calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSInteger cl_unitFlags  = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
                              NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *cl_dateComponents = [cl_calendar components:cl_unitFlags
                                                         fromDate:cl_timeDate];
    
    if (cl_timeInterval < 60) {
        
        return [NSString stringWithFormat:@"刚刚"];
        
    } else if((temp = cl_timeInterval / 60) < 60){
        
        return [NSString stringWithFormat:@"%ld分钟前", (long)temp];
        
    } else if((temp = cl_timeInterval / 3600) < 24){
        
        return [NSString stringWithFormat:@"%ld小时前", (long)temp];
        
    } else if ((temp = cl_timeInterval / 3600 / 24) == 1) {
        
        return [NSString stringWithFormat:@"昨天%ld时", (long)cl_dateComponents.hour];
        
    } else if ((temp = cl_timeInterval / 3600 / 24) == 2) {
        
        return [NSString stringWithFormat:@"前天%ld时", (long)cl_dateComponents.hour];
        
    } else if((temp = cl_timeInterval / 3600 / 24) < 31){
        
        return [NSString stringWithFormat:@"%ld天前", (long)temp];
        
    } else if((temp = cl_timeInterval / 3600 / 24 / 30) < 12){
        
        return [NSString stringWithFormat:@"%ld个月前",(long)temp];
        
    } else {
        
        return [NSString stringWithFormat:@"%ld年前", (long)temp / 12];
    }
}

+ (NSString *)cl_getCurrentTimeStamp {
    
    NSDate *cl_cureentDate = [NSDate date];
    
    return [NSString stringWithFormat:@"%ld", (long)[cl_cureentDate timeIntervalSince1970]];
}

+ (NSString *)cl_displayTimeWithTimeStamp:(NSTimeInterval)timeStamp {
    
    NSDate *cl_timeDate = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    
    NSCalendar *cl_calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSInteger cl_unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
                             NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *cl_dateComponents = [cl_calendar components:cl_unitFlags
                                                         fromDate:cl_timeDate];
    
    NSInteger cl_year   = cl_dateComponents.year;
    NSInteger cl_month  = cl_dateComponents.month;
    NSInteger cl_day    = cl_dateComponents.day;
    NSInteger cl_hour   = cl_dateComponents.hour;
    NSInteger cl_minute = cl_dateComponents.minute;

    return [NSString stringWithFormat:@"%ld年%ld月%ld日 %ld:%ld", (long)cl_year, (long)cl_month, (long)cl_day, (long)cl_hour, (long)cl_minute];
}

+ (NSString *)cl_displayTimeWithTimeStamp:(NSTimeInterval)timeStamp
                                formatter:(NSString *)formatter {
    
    if ([NSString stringWithFormat:@"%@", @(timeStamp)].length == 13) {
        
        timeStamp /= 1000.0f;
    }
    
    NSDate *cl_timeDate = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    
    NSDateFormatter *cl_dateFormatter = [[NSDateFormatter alloc] init];
    
    cl_dateFormatter.dateFormat = formatter;
    
    return [cl_dateFormatter stringFromDate:cl_timeDate];
}

+ (NSString *)cl_getDateStringWithDate:(NSDate *)date
                             formatter:(NSString *)formatter {
    
    NSDateFormatter *cl_dateFormatter = [[NSDateFormatter alloc] init];
    
    cl_dateFormatter.dateFormat = formatter;
    
    return [cl_dateFormatter stringFromDate:date];
}

+ (NSString *)cl_calculateDaysWithDate:(NSDate *)date {
    
    NSDate *cl_currentDate = [NSDate date];
    
    NSCalendar *cl_calendar = [NSCalendar autoupdatingCurrentCalendar];
    
    NSDateComponents *comps_today = [cl_calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                                   fromDate:cl_currentDate];
    NSDateComponents *comps_other = [cl_calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                                   fromDate:date];
    
    if (comps_today.year == comps_other.year &&
        comps_today.month == comps_other.month &&
        comps_today.day == comps_other.day) {
        
        return @"今天";
        
    } else if (comps_today.year == comps_other.year &&
               comps_today.month == comps_other.month &&
               (comps_today.day - comps_other.day) == -1 ) {
        
        return @"明天";
        
    } else if (comps_today.year == comps_other.year &&
               comps_today.month == comps_other.month &&
               (comps_today.day - comps_other.day) == -2) {
        
        return @"后天";
    }
    
    return @"";
}

#pragma mark - 获取日期
+ (NSUInteger)cl_getEraWithDate:(NSDate *)date {
    
    NSDateComponents *cl_dateComponents = [self cl_getCalendarWithUnitFlags:NSCalendarUnitEra
                                                                       date:date];
    
    return cl_dateComponents.era;
}

+ (NSUInteger)cl_getYearWithDate:(NSDate *)date {

    NSDateComponents *cl_dateComponents = [self cl_getCalendarWithUnitFlags:NSCalendarUnitYear
                                                                       date:date];
    
    return cl_dateComponents.year;
}

+ (NSUInteger)cl_getMonthWithDate:(NSDate *)date {
    
    NSDateComponents *cl_dateComponents = [self cl_getCalendarWithUnitFlags:NSCalendarUnitMonth
                                                                       date:date];
    
    return cl_dateComponents.month;
}

+ (NSUInteger)cl_getDayWithDate:(NSDate *)date {
    
    NSDateComponents *cl_dateComponents = [self cl_getCalendarWithUnitFlags:NSCalendarUnitDay
                                                                       date:date];
    
    return cl_dateComponents.day;
}

+ (NSUInteger)cl_getHourWithDate:(NSDate *)date {
    
    NSDateComponents *cl_dateComponents = [self cl_getCalendarWithUnitFlags:NSCalendarUnitHour
                                                                       date:date];
    
    return cl_dateComponents.hour;
}

+ (NSUInteger)cl_getMinuteWithDate:(NSDate *)date {
    
    NSDateComponents *cl_dateComponents = [self cl_getCalendarWithUnitFlags:NSCalendarUnitMinute
                                                                       date:date];
    
    return cl_dateComponents.minute;
}

+ (NSUInteger)cl_getSecondWithDate:(NSDate *)date {
    
    NSDateComponents *cl_dateComponents = [self cl_getCalendarWithUnitFlags:NSCalendarUnitSecond
                                                                       date:date];
    
    return cl_dateComponents.second;
}

+ (NSInteger)cl_getWeekdayStringFromDate:(NSDate *)date {
    
    NSDateComponents *cl_dateComponents = [self cl_getCalendarWithUnitFlags:NSCalendarUnitWeekday
                                                                       date:date];
    
    return cl_dateComponents.weekday;
}

+ (NSInteger)cl_getDateTimeDifferenceWithBeginDate:(NSDate *)beginDate
                                           endDate:(NSDate *)endDate {
    
    NSCalendar *cl_calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *cl_dateComponents = [cl_calendar components:NSCalendarUnitDay
                                                         fromDate:beginDate
                                                           toDate:endDate
                                                          options:0];
    
    return cl_dateComponents.day;
}

+ (NSDate *)cl_getMonthFirstDeteWithDate:(NSDate *)date {
    
    return [self cl_getDaysDateWithDate:date
                                   days:-[self cl_getDayWithDate:date] + 1];
}

+ (NSDate *)cl_getMonthLastDayWithDate:(NSDate *)date {
    
    NSDate *cl_firstDate = [self cl_getMonthFirstDeteWithDate:date];
    NSDate *cl_monthDate = [self cl_getMonthDateWithDate:cl_firstDate
                                                  months:1];
    return [self cl_getDaysDateWithDate:cl_monthDate
                                   days:-1];
}

+ (NSUInteger)cl_getWeekOfYearWithDate:(NSDate *)date {

    NSUInteger cl_week = 1;
    NSUInteger cl_year = [self cl_getYearWithDate:date];

    NSDate *cl_lastDate = [self cl_getMonthLastDayWithDate:date];
    
    while ([self cl_getYearWithDate:[self cl_getDaysDateWithDate:cl_lastDate
                                                            days:-7 * cl_week]] == cl_year) {
        cl_week++;
    };

    return cl_week;
}

+ (NSDate *)cl_getTomorrowDay:(NSDate *)date {
    
    NSCalendar *cl_calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *cl_dateComponents = [cl_calendar components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                                                         fromDate:date];
    
    cl_dateComponents.day = cl_dateComponents.day + 1;
        
    return [cl_calendar dateFromComponents:cl_dateComponents];
}

+ (NSDate *)cl_getYearDateWithDate:(NSDate *)date
                             years:(NSInteger)years {
    
    NSCalendar *cl_calendar = [NSCalendar autoupdatingCurrentCalendar];

    NSDateComponents *cl_dateComponents = [[NSDateComponents alloc] init];
    
    cl_dateComponents.year = years;

    return [cl_calendar dateByAddingComponents:cl_dateComponents
                                        toDate:date
                                       options:0];
}

+ (NSDate *)cl_getMonthDateWithDate:(NSDate *)date
                             months:(NSInteger)months {
    
    
    NSDateComponents *cl_dateComponents = [[NSDateComponents alloc] init];
    
    cl_dateComponents.month = months;
    
    return [self cl_getDateWithDateComponents:cl_dateComponents
                                         date:date];
}

+ (NSDate *)cl_getDaysDateWithDate:(NSDate *)date
                              days:(NSInteger)days {
    
    NSDateComponents *cl_dateComponents = [[NSDateComponents alloc] init];
    
    cl_dateComponents.day = days;
    
    return [self cl_getDateWithDateComponents:cl_dateComponents
                                         date:date];
}

+ (NSDate *)cl_getHoursDateWithDate:(NSDate *)date
                              hours:(NSInteger)hours {
    
    NSDateComponents *cl_dateComponents = [[NSDateComponents alloc] init];
    
    cl_dateComponents.hour = hours;
    
    return [self cl_getDateWithDateComponents:cl_dateComponents
                                         date:date];
}

+ (NSDate *)cl_getDateWithDateComponents:(NSDateComponents *)dateComponents
                                    date:(NSDate *)date {
    
    NSCalendar *cl_calendar = [NSCalendar autoupdatingCurrentCalendar];
    
    return [cl_calendar dateByAddingComponents:dateComponents
                                        toDate:date
                                       options:0];
}

#pragma mark - 日期判断
+ (BOOL)cl_isLeapYear:(NSDate *)date {
    
    NSUInteger cl_year = [self cl_getYearWithDate:date];
    
    return ((cl_year % 4 == 0) && (cl_year % 100 != 0)) || (cl_year % 400 == 0);
}

+ (BOOL)cl_checkTodayWithDate:(NSDate *)date {
    
    NSInteger cl_calendarUnit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    
    NSDateComponents *cl_dateComponents = [self cl_getCalendarWithUnitFlags:cl_calendarUnit
                                                                       date:date];

    NSDateComponents *cl_currentDateComponents = [self cl_getCalendarWithUnitFlags:cl_calendarUnit
                                                                              date:[NSDate date]];
    
    return (cl_currentDateComponents.year == cl_dateComponents.year) &&
           (cl_currentDateComponents.month == cl_dateComponents.month) &&
           (cl_currentDateComponents.day == cl_dateComponents.day);
}


#pragma mark - 获取NSDateComponents
+ (NSDateComponents *)cl_getCalendarWithUnitFlags:(NSCalendarUnit)unitFlags
                                             date:(NSDate *)date {
    
    NSCalendar *cl_calendar = [NSCalendar autoupdatingCurrentCalendar];
    
    return [cl_calendar components:unitFlags
                          fromDate:date];
}

@end
