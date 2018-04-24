//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIView+CLView.m
//  ShareHotel
//
//  Created by Mac on 2017/12/8.
//  Copyright © 2017年 EStrongersoft Co., LTD. All rights reserved.
//

#import "UIView+CLView.h"
#import "NSObject+CLObject.h"

static char CLTapGestureKey;
static char CLTapGestureBlockKey;
static char CLLongGestureKey;
static char CLLongGestureBlockKey;

@implementation UIView (CLView)

+ (void)load {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (@available(iOS 11, *)) {
            
            [self cl_exchangeImplementationsWithClass:NSClassFromString(@"_UIBackButtonContainerView")
                                     originalSelector:@selector(addSubview:)
                                     swizzledSelector:@selector(cl_backButtonTitleAddSubview:)];
        }
    });
}

- (void)cl_backButtonTitleAddSubview:(UIView *)view {
    
    view.alpha = 0;
    
    if ([view isKindOfClass:[UIButton class]]) {
        
        UIButton *button = (UIButton *)view;
        
        [button setTitle:@""
                forState:UIControlStateNormal];
    }
    
    [self cl_backButtonTitleAddSubview:view];
}

#pragma mark - 设置UIView相关的
- (void)setCl_size:(CGSize)cl_size {
    
    CGPoint cl_origin = self.frame.origin;
    
    [self setFrame:CGRectMake(cl_origin.x, cl_origin.y, cl_size.width, cl_size.height)];
}

- (CGSize)cl_size {
    
    return self.frame.size;
}

- (void)setCl_width:(CGFloat)cl_width {
    
    CGRect cl_frame = self.frame;
    
    cl_frame.size.width = cl_width;
    
    self.frame = CGRectStandardize(cl_frame);
}

- (CGFloat)cl_width {
    
    return CGRectGetWidth(self.frame);
}

- (void)setCl_height:(CGFloat)cl_height {
    
    CGRect cl_frame = self.frame;
    
    cl_frame.size.height = cl_height;
    
    self.frame = CGRectStandardize(cl_frame);
}

- (CGFloat)cl_height {
    
    return CGRectGetHeight(self.frame);
}

- (void)setCl_top:(CGFloat)cl_top {
    
    CGRect cl_frame = self.frame;
    
    cl_frame.origin.y = cl_top;
    
    self.frame = cl_frame;
}

- (CGFloat)cl_top {
    
    return CGRectGetMinY(self.frame);
}

- (void)setCl_left:(CGFloat)cl_left {
    
    CGRect cl_frame = self.frame;
    
    cl_frame.origin.x = cl_left;
    
    self.frame = cl_frame;
}

- (CGFloat)cl_left {
    
    return CGRectGetMinX(self.frame);
}

- (void)setCl_bottom:(CGFloat)cl_bottom {
    
    CGRect cl_frame = self.frame;
    
    cl_frame.origin.y = cl_bottom - cl_frame.size.height;
    
    self.frame = cl_frame;
}

- (CGFloat)cl_bottom {
    
    return CGRectGetMaxX(self.frame);
}

- (void)setCl_right:(CGFloat)cl_right {
    
    CGRect cl_frame = self.frame;
    
    cl_frame.origin.x = cl_right - cl_frame.size.width;
    
    self.frame = cl_frame;
}

- (CGFloat)cl_right {
    
    return CGRectGetMaxX(self.frame);
}

- (void)setCl_centerX:(CGFloat)cl_centerX {
    
    self.center = CGPointMake(cl_centerX, self.center.y);
}

- (CGFloat)cl_centerX {
    
    return self.center.x;
}

- (void)setCl_centerY:(CGFloat)cl_centerY {
    
    self.center = CGPointMake(self.center.x, cl_centerY);
}

- (CGFloat)cl_centerY {
    
    return self.center.y;
}

#pragma mark - 添加手势
- (void)cl_addTapGestureRecognizerWithBlock:(CLGestureActionBlock)block {
    
    UITapGestureRecognizer *cl_tapGestureRecognizer = objc_getAssociatedObject(self, &CLTapGestureKey);
    
    if (!cl_tapGestureRecognizer) {
        
        cl_tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(cl_tapGestureRecognizerAction:)];
        
        [self addGestureRecognizer:cl_tapGestureRecognizer];
        
        objc_setAssociatedObject(self, &CLTapGestureKey, block, OBJC_ASSOCIATION_RETAIN);
    }
    
    objc_setAssociatedObject(self, &CLTapGestureBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)cl_tapGestureRecognizerAction:(UITapGestureRecognizer *)tapGestureRecognizer {
    
    if (tapGestureRecognizer.state == UIGestureRecognizerStateRecognized) {
        
        CLGestureActionBlock cl_gestureActionBlock = objc_getAssociatedObject(self, &CLTapGestureBlockKey);
        
        if (cl_gestureActionBlock) {
            
            cl_gestureActionBlock(tapGestureRecognizer);
        }
    }
}

- (void)cl_addLongPressGestureRecognizerWithBlock:(CLGestureActionBlock)block {
    
    UILongPressGestureRecognizer *cl_longPressGestureRecognizer = objc_getAssociatedObject(self, &CLLongGestureKey);
    
    if (!cl_longPressGestureRecognizer) {
        
        cl_longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                                      action:@selector(cl_longPressGestureRecognizerAction:)];
        [self addGestureRecognizer:cl_longPressGestureRecognizer];
        
        objc_setAssociatedObject(self, &CLLongGestureKey, block, OBJC_ASSOCIATION_RETAIN);
    }
    
    objc_setAssociatedObject(self, &CLLongGestureBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)cl_longPressGestureRecognizerAction:(UILongPressGestureRecognizer *)longPressGestureRecognizer {
    
    if (longPressGestureRecognizer.state == UIGestureRecognizerStateRecognized) {
        
        CLGestureActionBlock cl_gestureActionBlock = objc_getAssociatedObject(self, &CLLongGestureBlockKey);
        
        if (cl_gestureActionBlock) {
            
            cl_gestureActionBlock(longPressGestureRecognizer);
        }
    }
}

#pragma mark - 获取UIView相关的
- (id)cl_getSubViewWithSubViewClass:(Class)objcClass {
    
    UIView *__block cl_subView;
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj isKindOfClass:objcClass]) {
            
            cl_subView = obj;
        }
    }];
    
    return cl_subView;
}

- (id)cl_getSuperViewWithSuperViewClass:(Class)objcClass {
    
    if (!self || !self.superview) {
        
        return nil;
    } else if ([self.superview isKindOfClass:objcClass]) {
        
        return self.superview;
    } else {
        
        return [self.superview cl_getSuperViewWithSuperViewClass:objcClass];
    }
}

#pragma mark - 响应者相关的
- (BOOL)cl_resignFirstResponder {
    
    if (self.isFirstResponder) {
        
        [self resignFirstResponder];
        
        return YES;
    }
    
    BOOL __block isResign = NO;
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj cl_resignFirstResponder]) {
            
            isResign = YES;
        }
    }];
    
    return isResign;
}

- (UIView *)cl_getFirstResponder {
    
    BOOL cl_isResponderClass = [self isKindOfClass:[UITextView class]] || [self isKindOfClass:[UITextField class]];
    
    if (cl_isResponderClass && self.isFirstResponder) {
        
        return self;
    }
    
    UIView __block *cl_responderView;
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj cl_getFirstResponder]) {
            
            cl_responderView = obj;
        }
    }];
    
    return cl_responderView;
}

@end
