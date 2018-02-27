//
//  UIView+CLView.m
//  ShareHotel
//
//  Created by Mac on 2017/12/8.
//  Copyright © 2017年 EStrongersoft Co., LTD. All rights reserved.
//

#import "UIView+CLView.h"
#import "NSObject+CLObject.h"

@implementation UIView (CLView)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (@available(iOS 11, *)) {
            
            [self cl_exchangeImplementationsWithClass:NSClassFromString(@"_UIBackButtonContainerView")
                                     originalSelector:@selector(addSubview:)
                                     swizzledSelector:@selector(cl_backButtonAddSubView:)];
        }
    });
}

- (void)cl_backButtonAddSubView:(UIView *)view {
    
    view.alpha = 0;
    
    if ([view isKindOfClass:[UIButton class]]) {
        
        UIButton *button = (UIButton *)view;
        
        [button setTitle:@" "
                forState:UIControlStateNormal];
    }
    
    [self cl_backButtonAddSubView:view];
}

@end
