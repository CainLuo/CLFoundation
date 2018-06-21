//
//  UIControl+CLControl.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/3/19.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "UIControl+CLControl.h"
#import <objc/runtime.h>

static const void *CLControlActionBlockArray = &CLControlActionBlockArray;

static const void *CLControlActionKey = &CLControlActionKey;

@implementation CLControlActionBlockObject

- (void)cl_controlInvokeBlock:(id)sender {
    
    if (self.cl_controlAction) {
        
        self.cl_controlAction(sender);
    }
}

@end

@implementation UIControl (CLControl)

- (void)cl_addControlActionWithEvents:(UIControlEvents)controlEvents
                             complete:(CLControlAction)complete {
 
    NSMutableArray *cl_controlActionBlockArray = [self cl_controlActionBlockArray];
    
    CLControlActionBlockObject *cl_controlActionBlockObject = [[CLControlActionBlockObject alloc] init];
    
    cl_controlActionBlockObject.cl_controlAction = complete;
    cl_controlActionBlockObject.cl_controlEvents = controlEvents;
    
    [cl_controlActionBlockArray addObject:complete];
    
    [self addTarget:self
             action:@selector(cl_controlInvokeBlock:)
   forControlEvents:UIControlEventTouchUpInside];
}

- (void)cl_setControlActionWithEvents:(UIControlEvents)controlEvents
                             complete:(CLControlAction)complete {
    
    [self cl_removeControlActionWithEvents:UIControlEventAllEvents];
    [self cl_addControlActionWithEvents:controlEvents
                               complete:complete];
}

- (void)cl_removeControlActionWithEvents:(UIControlEvents)controlEvents {
    
    NSMutableArray *cl_controlActionBlockArray = [self cl_controlActionBlockArray];
    NSMutableArray *cl_controlActionObjectArray = [NSMutableArray arrayWithCapacity:cl_controlActionBlockArray.count];

    [cl_controlActionBlockArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CLControlActionBlockObject *cl_controlActionBlockObject = obj;
        
        if (cl_controlActionBlockObject.cl_controlEvents == controlEvents) {
            
            [cl_controlActionObjectArray addObject:cl_controlActionBlockObject];
            
            [self removeTarget:cl_controlActionBlockObject
                        action:@selector(cl_controlInvokeBlock:)
              forControlEvents:controlEvents];
        }
    }];
    
    [cl_controlActionBlockArray removeObjectsInArray:cl_controlActionObjectArray];
}

- (void)cl_removeAllActions {
    
    [[self allTargets] enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        [self removeTarget:obj
                    action:NULL
          forControlEvents:UIControlEventAllEvents];
    }];
    
    [[self cl_controlActionBlockArray] removeAllObjects];
}

- (NSMutableArray *)cl_controlActionBlockArray {
    
    NSMutableArray *cl_controlActionBlocksArray = objc_getAssociatedObject(self, CLControlActionBlockArray);
    
    if (!cl_controlActionBlocksArray) {
    
        cl_controlActionBlocksArray = [NSMutableArray array];
        
        objc_setAssociatedObject(self, CLControlActionBlockArray, cl_controlActionBlocksArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return cl_controlActionBlocksArray;
}

@end
