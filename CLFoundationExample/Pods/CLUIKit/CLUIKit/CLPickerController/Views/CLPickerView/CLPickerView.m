//
//  CLPickerView.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/9/12.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLPickerView.h"

@interface CLPickerView ()

@property (nonatomic, strong) UIView *cl_selectView;

@end

@implementation CLPickerView

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.subviews.count && self.cl_selectionColor) {
        
        [self cl_configPickerViewSelectionIndicator];
    }
}

- (void)cl_configPickerViewSelectionIndicator {
    
    UIView *cl_lineOneView = self.subviews[1];
    UIView *cl_lineTwoView = self.subviews[2];
    
    cl_lineOneView.backgroundColor = [UIColor clearColor];
    cl_lineTwoView.backgroundColor = [UIColor clearColor];

    for (UIView *cl_subViews in self.subviews) {

        if(cl_subViews.subviews.count){

            UIView *cl_contentViews = cl_subViews.subviews[0];

            for (UIView *cl_contentSubView in cl_contentViews.subviews) {

                if(cl_contentSubView.center.y == cl_contentViews.center.y) {

                    if(self.cl_selectView != cl_contentSubView) {

                        self.cl_selectView.backgroundColor = [UIColor clearColor];
                        self.cl_selectView                 = cl_contentSubView;
                        self.cl_selectView.backgroundColor = self.cl_selectionColor;
                    }
                    break;
                }
            }
            break;
        }
    }
}

@end
