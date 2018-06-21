//
//  UIControl+CLControl.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/3/19.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CLControlAction)(id sender);

@interface CLControlActionBlockObject : NSObject

/**
 CLControlAction Typedef
 */
@property (nonatomic, copy) CLControlAction cl_controlAction;

/**
 UIControlEvents枚举
 */
@property (nonatomic, assign) UIControlEvents cl_controlEvents;

/**
 CLControlActionBlockObject的Action事件

 @param sender id
 */
- (void)cl_controlInvokeBlock:(id)sender;

@end

@interface UIControl (CLControl)

/**
 给UIControl添加Action事件

 @param controlEvents UIControlEvents
 @param complete CLControlAction
 */
- (void)cl_addControlActionWithEvents:(UIControlEvents)controlEvents
                             complete:(CLControlAction)complete;

/**
 设置UIControl的Action事件

 @param controlEvents UIControlEvents
 @param complete CLControlAction
 */
- (void)cl_setControlActionWithEvents:(UIControlEvents)controlEvents
                             complete:(CLControlAction)complete;

/**
 删除UIControl的Action事件

 @param controlEvents UIControlEvents
 */
- (void)cl_removeControlActionWithEvents:(UIControlEvents)controlEvents;

/**
 删除所有的Action事件
 */
- (void)cl_removeAllActions;

@end
