//
//  UINavigationItem+CLNavigationItem.m
//  Example
//
//  Created by Mac on 2017/10/11.
//  Copyright © 2017年 EStrongersoft Co., LTD. All rights reserved.
//

#import "UINavigationItem+CLNavigationItem.h"
#import "NSObject+CLObject.h"

static void *cl_backButtonItemKey = &cl_backButtonItemKey;

@implementation UINavigationItem (CLNavigationItem)

+ (void)initialize {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self cl_exchangeImplementationsWithClass:[self class]
                                 originalSelector:@selector(backBarButtonItem)
                                 swizzledSelector:@selector(cl_backBarButtonItem)];
    });
}

- (UIBarButtonItem *)backBarButtonItem {
    
    return [[UIBarButtonItem alloc] initWithTitle:@""
                                            style:UIBarButtonItemStylePlain
                                           target:nil
                                           action:NULL];
}

- (void)dealloc {
    objc_removeAssociatedObjects(self);
}

- (UIBarButtonItem *)cl_backBarButtonItem {
    
    UIBarButtonItem *cl_backItem = [self cl_backBarButtonItem];
    
    if (cl_backItem) {
        
        return cl_backItem;
    }
    
    cl_backItem = objc_getAssociatedObject(self, &cl_backButtonItemKey);
    
    if (!cl_backItem) {
        
        cl_backItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                       style:UIBarButtonItemStylePlain
                                                      target:nil
                                                      action:NULL];
        
        objc_setAssociatedObject(self, &cl_backButtonItemKey, cl_backItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return cl_backItem;
}

@end
