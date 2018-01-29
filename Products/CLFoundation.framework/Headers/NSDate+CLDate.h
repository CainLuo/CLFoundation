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

/**
 通过时间戳计算出与当前时间差
 
 @param timeStamp 时间戳
 @return 与当前时间的差距, 比如一天前
 */
+ (NSString *)cl_compareCureentTimeWithDate:(NSTimeInterval)timeStamp;

/**
 把当前时间转换成时间戳
 
 @return 时间戳
 */
+ (NSString *)cl_changeCureentTimeToTimeStamp;

/**
 通过传入的时间戳算出年月日
 
 @param timeStamp 时间戳
 @return 年月日, 默认格式xxxx年xx月xx日
 */
+ (NSString *)cl_displayTimeWithTimeStamp:(NSTimeInterval)timeStamp;


/**
 通过传入的时间戳和日期格式算出年月日
 
 @param timeStamp 时间戳
 @param formatter 时间显示格式
 @return 年月日
 */
+ (NSString *)cl_displayTimeWithTimeStamp:(NSTimeInterval)timeStamp
                                formatter:(NSString *)formatter;

/**
 通过传入的NSDate计算出星期几, PS: 1代表的是周日, 2代表的是周一, 以此类推

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
 通过传入的NSDate计算出是今天/明天/后天
 
 @param date NSDate
 @return 今天/明天/后天
 */
+ (NSString *)cl_getDays:(NSDate *)date;

/**
 传入指定的时间判断是否为今天

 @param date 指定时间
 @return BOOL
 */
+ (BOOL)cl_checkTodayWithDate:(NSDate *)date;

/**
 通过传入指定的时间获取第二天的日期

 @param date NSDate
 @return NSDate
 */
+ (NSDate *)cl_getTomorrowDay:(NSDate *)date;

/**
 通过传入指定的时间获取第N天的日期

 @param date NSDate
 @param days NSInteger, 多少天
 @return NSDate
 */
+ (NSDate *)cl_getDays:(NSDate *)date
                  days:(NSInteger)days;

@end
