//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLTextField.m
//  CLUIKit
//
//  Created by Cain on 2017/9/20.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "CLTextField.h"
#import "UIColor+CLColor.h"
#import "UIScreen+CLScreen.h"

@interface CLTextField ()

@property (nonatomic, strong) UIImageView *cl_lineImageView;

@end

@implementation CLTextField

- (void)setCl_textFieldType:(CLTextFieldType)cl_textFieldType {
    
    _cl_textFieldType = cl_textFieldType;
    
    if (cl_textFieldType == CLTextFieldBottomLineType) {
        
        [self cl_addConstraintsWithSuperView];
    }
}

- (void)setCl_lineColor:(UIColor *)cl_lineColor {
 
    self.cl_lineImageView.backgroundColor = cl_lineColor;
}

- (UIImageView *)cl_lineImageView {
    
    if (!_cl_lineImageView) {
        
        _cl_lineImageView = [[UIImageView alloc] init];
        
        _cl_lineImageView.backgroundColor = [UIColor cl_colorWithHex:0xf0f0f0];
        _cl_lineImageView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _cl_lineImageView;
}

- (void)cl_addConstraintsWithSuperView  {
    
    [self addSubview:self.cl_lineImageView];
    
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.cl_lineImageView
                                                                        attribute:NSLayoutAttributeBottom
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self
                                                                        attribute:NSLayoutAttributeBottom
                                                                       multiplier:1.0
                                                                         constant:0];
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.cl_lineImageView
                                                                      attribute:NSLayoutAttributeLeft
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self
                                                                      attribute:NSLayoutAttributeLeft
                                                                     multiplier:1.0
                                                                       constant:0];
    NSLayoutConstraint *rigthtConstraint = [NSLayoutConstraint constraintWithItem:self.cl_lineImageView
                                                                        attribute:NSLayoutAttributeRight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self
                                                                        attribute:NSLayoutAttributeRight
                                                                       multiplier:1.0
                                                                         constant:0];
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.cl_lineImageView
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self
                                                                        attribute:NSLayoutAttributeHeight
                                                                       multiplier:0
                                                                         constant:[UIScreen cl_fitScreen:1]];
    
    [self addConstraints:@[leftConstraint, bottomConstraint, rigthtConstraint, heightConstraint]];
}

@end
