//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLButton.m
//
//  Created by Cain on 2017/8/31.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "CLButton.h"

@implementation CLButton

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _cl_imageSize    = CGSizeZero;
        _cl_imageSpacing = 10;
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (CGSizeEqualToSize(CGSizeZero, self.cl_imageSize)) {
        
        [self.imageView sizeToFit];
    } else {
        
        self.imageView.frame = CGRectMake(self.imageView.frame.origin.x,
                                          self.imageView.frame.origin.y,
                                          self.cl_imageSize.width,
                                          self.cl_imageSize.height);
    }
    
    [self.titleLabel sizeToFit];
    
    [self cl_configButtonImageAndLabel];
}

- (void)cl_configButtonImageAndLabel {
    
    switch (self.cl_buttomImageStyle) {
        case CLButtonImageTopStyle:
            
            [self cl_layoutVerticalWithTopView:self.imageView
                                    bottomView:self.titleLabel];

            break;
        case CLButtonImageLeftStyle:
            
            [self cl_layoutHorizontalWithLeftView:self.imageView
                                        rightView:self.titleLabel];

            break;
        case CLButtonImageBottomStyle:
            
            [self cl_layoutVerticalWithTopView:self.titleLabel
                                     bottomView:self.imageView];

            break;
        case CLButtonImageRightStyle:
            
            [self cl_layoutHorizontalWithLeftView:self.titleLabel
                                        rightView:self.imageView];
            break;
        default:
            break;
    }
}

- (void)cl_layoutHorizontalWithLeftView:(UIView *)leftView
                              rightView:(UIView *)rightView {
    
    CGRect leftViewFrame = leftView.frame;
    CGRect rightViewFrame = rightView.frame;
    
    CGFloat totalWidth = CGRectGetWidth(leftViewFrame) + self.cl_imageSpacing + CGRectGetWidth(rightViewFrame);
    
    leftViewFrame.origin.x = (CGRectGetWidth(self.frame) - totalWidth) / 2.0;
    leftViewFrame.origin.y = (CGRectGetHeight(self.frame) - CGRectGetHeight(leftViewFrame)) / 2.0;
    
    leftView.frame = leftViewFrame;
    
    rightViewFrame.origin.x = CGRectGetMaxX(leftViewFrame) + self.cl_imageSpacing;
    rightViewFrame.origin.y = (CGRectGetHeight(self.frame) - CGRectGetHeight(rightViewFrame)) / 2.0;
    
    rightView.frame = rightViewFrame;
}

- (void)cl_layoutVerticalWithTopView:(UIView *)upView
                          bottomView:(UIView *)downView {
    
    CGRect upViewFrame = upView.frame;
    CGRect downViewFrame = downView.frame;
    
    CGFloat totalHeight = CGRectGetHeight(upViewFrame) + self.cl_imageSpacing + CGRectGetHeight(downViewFrame);
    
    upViewFrame.origin.y = (CGRectGetHeight(self.frame) - totalHeight) / 2.0;
    upViewFrame.origin.x = (CGRectGetWidth(self.frame) - CGRectGetWidth(upViewFrame)) / 2.0;
    
    upView.frame = upViewFrame;
    
    downViewFrame.origin.y = CGRectGetMaxY(upViewFrame) + self.cl_imageSpacing;
    downViewFrame.origin.x = (CGRectGetWidth(self.frame) - CGRectGetWidth(downViewFrame)) / 2.0;
    
    downView.frame = downViewFrame;
}

- (void)setImage:(UIImage *)image
        forState:(UIControlState)state {
    
    [super setImage:image
           forState:state];
    
    [self setNeedsLayout];
}

- (void)setTitle:(NSString *)title
        forState:(UIControlState)state {
    
    [super setTitle:title
           forState:state];
    
    [self setNeedsLayout];
}

- (void)setCl_imageSize:(CGSize)cl_imageSize {
    
    _cl_imageSize = cl_imageSize;
    
    [self setNeedsLayout];
}

- (void)setCl_imageSpacing:(CGFloat)cl_imageSpacing {
    
    _cl_imageSpacing = cl_imageSpacing;
    
    [self setNeedsLayout];
}

@end
