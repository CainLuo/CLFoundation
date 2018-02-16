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

+ (NSString *)cl_compareCureentTimeWithDate:(NSTimeInterval)timeStamp {
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    
    NSTimeInterval  timeInterval = [confromTimesp timeIntervalSinceNow];
    
    timeInterval = -timeInterval;
    
    NSInteger temp = 0;
    
    NSString *result;
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSInteger unitFlags  = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *referenceComponents = [calendar components:unitFlags
                                                        fromDate:confromTimesp];
    
    //        NSInteger referenceYear  = referenceComponents.year;
    //        NSInteger referenceMonth = referenceComponents.month;
    //        NSInteger referenceDay   = referenceComponents.day;
    NSInteger referenceHour = referenceComponents.hour;
    //        NSInteger referemceMinute = referenceComponents.minute;
    
    if (timeInterval < 60) {
        
        result = [NSString stringWithFormat:@"刚刚"];
        
    } else if((temp= timeInterval / 60) < 60){
        
        result = [NSString stringWithFormat:@"%ld分钟前", (long)temp];
        
    } else if((temp = timeInterval / 3600) < 24){
        
        result = [NSString stringWithFormat:@"%ld小时前", (long)temp];
        
    } else if ((temp = timeInterval / 3600 / 24) == 1) {
        
        result = [NSString stringWithFormat:@"昨天%ld时", (long)referenceHour];
        
    } else if ((temp = timeInterval / 3600 / 24) == 2) {
        
        result = [NSString stringWithFormat:@"前天%ld时", (long)referenceHour];
        
    } else if((temp = timeInterval / 3600 / 24) < 31){
        
        result = [NSString stringWithFormat:@"%ld天前", (long)temp];
        
    } else if((temp = timeInterval / 3600 / 24 / 30) <12){
        
        result = [NSString stringWithFormat:@"%ld个月前",(long)temp];
        
    } else {
        
        temp = temp / 12;
        
        result = [NSString stringWithFormat:@"%ld年前", (long)temp];
    }
    
    return  result;
}

+ (NSString *)cl_changeCureentTimeToTimeStamp {
    
    NSDate *cureentDate = [NSDate date];
    
    return [NSString stringWithFormat:@"%ld", (long)[cureentDate timeIntervalSince1970]];
}

+ (NSString *)cl_displayTimeWithTimeStamp:(NSTimeInterval)timeStamp {
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *referenceComponents = [calendar components:unitFlags
                                                        fromDate:confromTimesp];
    
    NSInteger referenceYear   = referenceComponents.year;
    NSInteger referenceMonth  = referenceComponents.month;
    NSInteger referenceDay    = referenceComponents.day;
    NSInteger referenceHour   = referenceComponents.hour;
    NSInteger referenceMinute = referenceComponents.minute;

    return [NSString stringWithFormat:@"%ld年%ld月%ld日 %ld:%ld", (long)referenceYear, (long)referenceMonth, (long)referenceDay, (long)referenceHour, (long)referenceMinute];
}


+ (NSString *)cl_displayTimeWithTimeStamp:(NSTimeInterval)timeStamp
                                formatter:(NSString *)formatter {
    
    if ([NSString stringWithFormat:@"%@", @(timeStamp)].length == 13) {
        
        timeStamp /= 1000.0f;
    }
    
    NSDate *timestampDate = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:formatter];
    
    NSString *dateString = [dateFormatter stringFromDate:timestampDate];
    
    return dateString;
}

+ (NSInteger)cl_getWeekdayStringFromDate:(NSDate *)date {
    
    NSCalendar *cl_calendar = [NSCalendar currentCalendar];
        
    NSDateComponents *cl_dateComponents = [cl_calendar components:NSCalendarUnitWeekday
                                                         fromDate:date];
    
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

+ (NSString *)cl_getDays:(NSDate *)date {
    
    NSDate *cl_currentDate = [NSDate date];
    
    NSCalendar *cl_calendar = [NSCalendar currentCalendar];

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

+ (BOOL)cl_checkTodayWithDate:(NSDate *)date {
    
    NSCalendar *cl_calendar   = [NSCalendar currentCalendar];
    NSInteger cl_calendarUnit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    
    NSDateComponents *cl_nowDateComponents = [cl_calendar components:cl_calendarUnit
                                                            fromDate:date];
    NSDateComponents *cl_currentDateComponents = [cl_calendar components:cl_calendarUnit
                                                                fromDate:[NSDate date]];
    
    return (cl_currentDateComponents.year == cl_nowDateComponents.year) &&
           (cl_currentDateComponents.month == cl_nowDateComponents.month) &&
           (cl_currentDateComponents.day == cl_nowDateComponents.day);
}

+ (NSDate *)cl_getTomorrowDay:(NSDate *)date {
    
    NSCalendar *cl_calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *cl_dateComponents = [cl_calendar components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                                                         fromDate:date];
    
    cl_dateComponents.day = cl_dateComponents.day + 1;
        
    return [cl_calendar dateFromComponents:cl_dateComponents];
}

+ (NSDate *)cl_getDays:(NSDate *)date
                  days:(NSInteger)days {
    
    NSCalendar *cl_calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *cl_dateComponents = [cl_calendar components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                                                         fromDate:date];
    
    cl_dateComponents.day = cl_dateComponents.day + days;
    
    return [cl_calendar dateFromComponents:cl_dateComponents];
}

@end
