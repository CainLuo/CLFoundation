//
//  NSTimer+CLTimer.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/22.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "NSTimer+CLTimer.h"

@implementation NSTimer (CLTimer)

+ (NSTimer *)cl_scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval
                                       repeats:(BOOL)repeats
                                      complete:(CLTimer)complete {
    
    return [self scheduledTimerWithTimeInterval:timeInterval
                                         target:self
                                       selector:@selector(cl_timerBlock:)
                                       userInfo:complete
                                        repeats:repeats];
}

+ (NSTimer *)cl_timerWithTimeInterval:(NSTimeInterval)timeInterval
                              repeats:(BOOL)repeats
                             complete:(CLTimer)complete {
    
    return [self timerWithTimeInterval:timeInterval
                                target:self
                              selector:@selector(cl_timerBlock:)
                              userInfo:complete
                               repeats:repeats];
}

+ (void)cl_timerBlock:(NSTimer *)timer; {
    
    if([timer userInfo]) {
        
        void (^cl_block)(void) = (void (^)(void))[timer userInfo];
        
        cl_block();
    }
}

- (void)cl_resumeTimer {
    
    if (![self isValid]) {
        return ;
    }
    
    [self setFireDate:[NSDate date]];
}

- (void)cl_pauseTimer {
    
    if (![self isValid]) {
        
        return ;
    }
    
    [self setFireDate:[NSDate distantFuture]];
}

- (void)cl_resumeTimerAfterTimeInterval:(NSTimeInterval)timeInterval {
  
    if (![self isValid]) {
        
        return ;
    }
    
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:timeInterval]];
}

@end
