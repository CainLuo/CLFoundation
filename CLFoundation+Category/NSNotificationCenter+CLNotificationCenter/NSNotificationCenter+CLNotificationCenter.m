//
//  NSNotificationCenter+CLNotificationCenter.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/4/23.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "NSNotificationCenter+CLNotificationCenter.h"
#import "NSDictionary+CLDictionary.h"
#include <pthread.h>

@implementation NSNotificationCenter (CLNotificationCenter)

- (void)cl_postNotificationOnMainThread:(NSNotification *)notification {

    if (pthread_main_np()) {
        
        return [self postNotification:notification];
    }
    
    [self cl_postNotificationOnMainThread:notification
                            waitUntilDone:NO];
}

- (void)cl_postNotificationOnMainThread:(NSNotification *)notification
                          waitUntilDone:(BOOL)wait {
    
    if (pthread_main_np()) {
        
        return [self postNotification:notification];
    }
    
    [[self class] performSelectorOnMainThread:@selector(cl_postNotification:)
                                   withObject:notification
                                waitUntilDone:wait];
}

- (void)cl_postNotificationOnMainThreadWithName:(NSString *)name
                                         object:(id)object {
    
    if (pthread_main_np()) {
        
        return [self postNotificationName:name
                                   object:object
                                 userInfo:nil];
    }
    
    [self cl_postNotificationOnMainThreadWithName:name
                                           object:object
                                         userInfo:[NSDictionary dictionary]
                                    waitUntilDone:NO];
}

- (void)cl_postNotificationOnMainThreadWithName:(NSString *)name
                                         object:(id)object
                                       userInfo:(NSDictionary *)userInfo {
    
    if (pthread_main_np()) {
        
        return [self postNotificationName:name
                                   object:object
                                 userInfo:userInfo];
    }
    
    [self cl_postNotificationOnMainThreadWithName:name
                                           object:object
                                         userInfo:userInfo
                                    waitUntilDone:NO];
}

- (void)cl_postNotificationOnMainThreadWithName:(NSString *)name
                                         object:(id)object
                                       userInfo:(NSDictionary *)userInfo
                                  waitUntilDone:(BOOL)wait {
    
    if (pthread_main_np()) {
        
        return [self postNotificationName:name
                                   object:object
                                 userInfo:userInfo];
    }
    
    NSMutableDictionary *info = [[NSMutableDictionary allocWithZone:nil] initWithCapacity:3];
    
    if (name) {
        [info setObject:name forKey:@"name"];
    }
    
    if (object) {
        
        [info setObject:object forKey:@"object"];
    }
    
    if (userInfo) {
        
        [info setObject:userInfo forKey:@"userInfo"];
    }
    
    [[self class] performSelectorOnMainThread:@selector(cl_postNotificationWithInfo:)
                                   withObject:info
                                waitUntilDone:wait];
}

+ (void)cl_postNotification:(NSNotification *)notification {
    
    [[self defaultCenter] postNotification:notification];
}

+ (void)cl_postNotificationWithInfo:(NSDictionary *)info {
    
    NSString *cl_name = [info objectForKey:@"name"];
    
    id cl_object = [info objectForKey:@"object"];
    
    NSDictionary *cl_userInfo = [info objectForKey:@"userInfo"];
    
    [[self defaultCenter] postNotificationName:cl_name
                                        object:cl_object
                                      userInfo:cl_userInfo];
}

@end
