//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  NSDate+CLDate.h
//
//  Created by Cain on 2017/7/14.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CLDate)

@property (nonatomic, readonly) NSInteger cl_year;              // 获取日期的年
@property (nonatomic, readonly) NSInteger cl_month;             // 获取日期的月
@property (nonatomic, readonly) NSInteger cl_day;               // 获取日期的日
@property (nonatomic, readonly) NSInteger cl_hour;              // 获取日期的时
@property (nonatomic, readonly) NSInteger cl_minute;            // 获取日期的分
@property (nonatomic, readonly) NSInteger cl_second;            // 获取日期的秒
@property (nonatomic, readonly) NSInteger cl_nanosecond;        // 获取日期的纳秒
@property (nonatomic, readonly) NSInteger cl_weekday;           // 获取日期的周日期
@property (nonatomic, readonly) NSInteger cl_weekdayOrdinal;    // 获取日期的周序号
@property (nonatomic, readonly) NSInteger cl_weekOfMonth;       // 获取月里的第几周
@property (nonatomic, readonly) NSInteger cl_weekOfYear;        // 获取日期是一年里的第几周
@property (nonatomic, readonly) NSInteger cl_yearForWeekOfYear; // 获取日期所属的年份
@property (nonatomic, readonly) NSInteger cl_quarter;           // 没搞懂是什么意思
@property (nonatomic, readonly) BOOL cl_isLeapMonth;            // 获取日期是否是闰年的月
@property (nonatomic, readonly) BOOL cl_isLeapYear;             // 获取日期是否是闰年
@property (nonatomic, readonly) BOOL cl_isToday;                // 获取日期是否是今天
@property (nonatomic, readonly) BOOL cl_isYesterday;            // 获取日期是否是昨天

#pragma mark - 时间戳处理/计算日期
/**
 通过时间戳计算出与当前时间差
 
 @param timeStamp 时间戳
 @return 与当前时间的差距, 比如一天前
 */
+ (NSString *)cl_compareCureentTimeWithDate:(NSTimeInterval)timeStamp;

/**
 获取当前NSDate的时间戳字符串
 
 @return NSString
 */
+ (NSString *)cl_getCurrentTimeStampString;

/**
 获取当前NSDate的时间戳

 @return NSTimeInterval
 */
+ (NSTimeInterval)cl_getCurrentTimeStamp;

/**
 通过传入的时间戳算出年月日
 
 @param timeStamp 时间戳
 @return 年月日, 默认格式xxxx年xx月xx日
 */
+ (NSString *)cl_displayTimeWithTimeStamp:(NSTimeInterval)timeStamp;

/**
 通过传入的NSDate计算出是今天/明天/后天
 
 @param date NSDate
 @return 今天/明天/后天
 */
+ (NSString *)cl_calculateDaysWithDate:(NSDate *)date;

#pragma mark - 日期处理
/**
 获取指定NSDate的纪元
 
 @param date NSDate
 @return NSUInteger
 */
+ (NSUInteger)cl_getEraWithDate:(NSDate *)date;

/**
 获取指定NSDate的年
 
 @param date NSDate
 @return NSUInteger
 */
+ (NSUInteger)cl_getYearWithDate:(NSDate *)date;

/**
 获取指定NSDate的月
 
 @param date NSDate
 @return NSUInteger
 */
+ (NSUInteger)cl_getMonthWithDate:(NSDate *)date;

/**
 获取指定NSDate的天

 @param date NSDate
 @return NSUInteger
 */
+ (NSUInteger)cl_getDayWithDate:(NSDate *)date;

/**
 获取指定NSDate的时
 
 @param date NSDate
 @return NSUInteger
 */
+ (NSUInteger)cl_getHourWithDate:(NSDate *)date;

/**
 获取指定NSDate的分
 
 @param date NSDate
 @return NSUInteger
 */
+ (NSUInteger)cl_getMinuteWithDate:(NSDate *)date;

/**
 获取指定NSDate的秒
 
 @param date NSDate
 @return NSUInteger
 */
+ (NSUInteger)cl_getSecondWithDate:(NSDate *)date;

/**
 获取指定NSDate的星期几, PS: 1代表的是周日, 2代表的是周一, 以此类推
 
 @param date NSDate
 @return NSInteger
 */
+ (NSInteger)cl_getWeekdayStringFromDate:(NSDate *)date;

/**
 通过传入两组时间, 计算出相差的天数

 @param beginDate 开始的时间
 @param endDate 结束的时间
 @return return NSInteger
 */
+ (NSInteger)cl_getDateTimeDifferenceWithBeginDate:(NSDate *)beginDate
                                           endDate:(NSDate *)endDate;

/**
 获取指定NSDate的每月第一天的日期

 @param date NSDate
 @return NSDate
 */
+ (NSDate *)cl_getMonthFirstDeteWithDate:(NSDate *)date;

/**
 获取指定NSDate的每月最后一天的日期
 
 @param date NSDate
 @return NSDate
 */
+ (NSDate *)cl_getMonthLastDayWithDate:(NSDate *)date;

/**
 获取指定日期在一年中是第几周

 @param date NSDate
 @return NSUInteger
 */
+ (NSUInteger)cl_getWeekOfYearWithDate:(NSDate *)date;

/**
 通过传入指定的时间获取第二天的日期

 @param date NSDate
 @return NSDate
 */
+ (NSDate *)cl_getTomorrowDay:(NSDate *)date;

/**
 获取指定NSDate第years年后的日期
 
 @param date NSDate
 @param years NSInteger, 多少年
 @return NSDate
 */
+ (NSDate *)cl_getYearDateWithDate:(NSDate *)date
                             years:(NSInteger)years;

/**
 获取指定NSDate第months月后的日期

 @param date NSDate
 @param months NSInteger, 多少月
 @return NSDate
 */
+ (NSDate *)cl_getMonthDateWithDate:(NSDate *)date
                             months:(NSInteger)months;
/**
 获取指定NSDate第days天后的日期

 @param date NSDate
 @param days NSInteger, 多少天
 @return NSDate
 */
+ (NSDate *)cl_getDaysDateWithDate:(NSDate *)date
                              days:(NSInteger)days;

/**
 获取指定NSDate第hours时后的日期
 
 @param date NSDate
 @param hours NSInteger, 多少小时
 @return NSDate
 */
+ (NSDate *)cl_getHoursDateWithDate:(NSDate *)date
                              hours:(NSInteger)hours;

#pragma mark - 日期格式化
/**
 获取指定NSTimeInterval NSDateFormat的字符串日期

 @param timeStamp NSTimeInterval
 @param formatter NSString
 @return NSString
 */
+ (NSString *)cl_getStringDateWithTimeStamp:(NSTimeInterval)timeStamp
                                  formatter:(NSString *)formatter;

/**
 获取当前NSDate指定的NSDateFormat字符串日期

 @param formatter NSString
 @return NSString
 */
- (NSString *)cl_getStringDateWithFormatter:(NSString *)formatter;

/**
 获取指定NSDate NSDateFormat的字符串日期
 
 @param date NSDate
 @param formatter NSString
 @return NSString
 */
+ (NSString *)cl_getStringDateWithDate:(NSDate *)date
                             formatter:(NSString *)formatter;

/**
 获取指定NSDateFormat, NSTimeZone, NSLocale字符串日期

 @param date NSDate
 @param formatter NSString
 @param timeZone NSTimeZone
 @param locale NSLocale
 @return NSString
 */
+ (NSString *)cl_getStringDateWithDate:(NSDate *)date
                             formatter:(NSString *)formatter
                              timeZone:(NSTimeZone *)timeZone
                                locale:(NSLocale *)locale;

/**
 获取指定NSDateFormat字符串日期的NSDate

 @param dateString NSString
 @param formatter NSString
 @return NSDate
 */
+ (NSDate *)cl_getDateWithDateString:(NSString *)dateString
                           formatter:(NSString *)formatter;

/**
 获取指定NSDateFormat, NSTimeZone, NSLocale的NSDate

 @param dateString NSString
 @param formatter NSString
 @param timeZone NSTimeZone
 @param locale NSLocale
 @return NSDate
 */
+ (NSDate *)cl_getDateWithDateString:(NSString *)dateString
                           formatter:(NSString *)formatter
                            timeZone:(NSTimeZone *)timeZone
                              locale:(NSLocale *)locale;

#pragma mark - 日期判断
/**
 判断传入的NSDate是否是闰年
 
 @param date NSDate
 @return BOOL
 */
+ (BOOL)cl_isLeapYear:(NSDate *)date;

/**
 传入指定的时间判断是否为今天
 
 @param date 指定时间
 @return BOOL
 */
+ (BOOL)cl_checkTodayWithDate:(NSDate *)date;

#pragma mark - 获取NSDateComponents
/**
 获取指定NSCalendarUnit和指定NSDate的NSDateComponents
 
 @param unitFlags NSCalendarUnit
 @param date NSDate
 @return NSDateComponents
 */
+ (NSDateComponents *)cl_getCalendarWithUnitFlags:(NSCalendarUnit)unitFlags
                                             date:(NSDate *)date;

@end
