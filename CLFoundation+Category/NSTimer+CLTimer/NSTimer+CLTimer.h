//
//  NSTimer+CLTimer.h
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/22.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CLTimer)(void);

@interface NSTimer (CLTimer)

/**
 创建一个NSTimer对象, 并添加进当前线程

 @param timeInterval NSTimeInterval
 @param repeats BOOL
 @param complete CLTimer
 @return NSTimer
 */
+ (NSTimer *)cl_scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval
                                       repeats:(BOOL)repeats
                                      complete:(CLTimer)complete;

/**
 创建一个NSTimer对象

 @param timeInterval NSTimeInterval
 @param repeats BOOL
 @param complete CLTimer
 @return NSTimer
 */
+ (NSTimer *)cl_timerWithTimeInterval:(NSTimeInterval)timeInterval
                              repeats:(BOOL)repeats
                             complete:(CLTimer)complete;

/**
 开始NSTimer
 */
- (void)cl_resumeTimer;

/**
 暂停NSTimer
 */
- (void)cl_pauseTimer;

/**
 延迟指定的时间执行NSTimer

 @param timeInterval NSTimeInterval
 */
- (void)cl_resumeTimerAfterTimeInterval:(NSTimeInterval)timeInterval;

@end
