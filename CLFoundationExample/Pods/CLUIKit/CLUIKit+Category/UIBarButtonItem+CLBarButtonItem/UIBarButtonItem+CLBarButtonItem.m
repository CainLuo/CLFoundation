//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIBarButtonItem+CLBarButtonItem.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/4/28.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "UIBarButtonItem+CLBarButtonItem.h"
#import <objc/runtime.h>

static const void *CLBarButtonItemActionKey = &CLBarButtonItemActionKey;

@interface CLBarButtonItemActionBlock : NSObject

@property (nonatomic, copy) CLBarButtonItemAction cl_barButtonItemAction;

- (instancetype)initBarButtonItemWithActionBlock:(CLBarButtonItemAction)actionBlock;
- (void)cl_invokeWithBarButtonItem:(UIBarButtonItem *)barButtonItem;

@end

@implementation CLBarButtonItemActionBlock

- (instancetype)initBarButtonItemWithActionBlock:(CLBarButtonItemAction)actionBlock {
    
    self = [super init];
    
    if (self) {
        
        self.cl_barButtonItemAction = [actionBlock copy];
    }
    
    return self;
}

- (void)cl_invokeWithBarButtonItem:(UIBarButtonItem *)barButtonItem {
    
    if (self.cl_barButtonItemAction) {
        self.cl_barButtonItemAction(barButtonItem);
    }
}

@end

@implementation UIBarButtonItem (CLBarButtonItem)

- (void)setCl_barButtonItemAction:(CLBarButtonItemAction)cl_barButtonItemAction {
    
    CLBarButtonItemActionBlock *cl_barButtonItemActionBlock = [[CLBarButtonItemActionBlock alloc] initBarButtonItemWithActionBlock:cl_barButtonItemAction];
    
    objc_setAssociatedObject(self, &CLBarButtonItemActionKey, cl_barButtonItemActionBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setTarget:cl_barButtonItemActionBlock];
    [self setAction:@selector(cl_invokeWithBarButtonItem:)];
}

- (CLBarButtonItemAction)cl_barButtonItemAction {
    
    CLBarButtonItemActionBlock *cl_barButtonItemActionBlock = objc_getAssociatedObject(self, &CLBarButtonItemActionKey);

    return cl_barButtonItemActionBlock.cl_barButtonItemAction;
}

@end
