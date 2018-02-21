//
//  NSObject+CLObject.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/21.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "NSObject+CLObject.h"

@implementation NSObject (CLObject)

+ (void)cl_exchangeImplementationsWithClass:(Class)class
                           originalSelector:(SEL)originalSelector
                           swizzledSelector:(SEL)swizzledSelector {
    
    Method cl_originalMethod = class_getInstanceMethod(class, originalSelector);
    Method cl_swizzledSelector = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL cl_didAddMethod = class_addMethod(class,
                                           originalSelector,
                                           method_getImplementation(cl_swizzledSelector),
                                           method_getTypeEncoding(cl_swizzledSelector));
    
    if (cl_didAddMethod) {
        
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(cl_originalMethod),
                            method_getTypeEncoding(cl_originalMethod));
        
    } else {
        
        method_exchangeImplementations(cl_originalMethod, cl_swizzledSelector);
    }
}

@end
