//
//  CLPickerToolView.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/9/12.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLPickerToolView.h"
#import "UIColor+CLColor.h"
#import "UIButton+CLButton.h"
#import "UIView+CLView.h"

@interface CLPickerToolView ()

@property (nonatomic, strong, readwrite) UIButton *cl_cancelButton;
@property (nonatomic, strong, readwrite) UIButton *cl_defineButton;

@property (nonatomic, strong, readwrite) UILabel *cl_titleLabel;

@property (nonatomic, strong) CALayer *cl_lineLayer;

@end

@implementation CLPickerToolView

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self cl_addConstraintsWithSuperView];
}

- (UIButton *)cl_cancelButton {
    
    if (!_cl_cancelButton) {
    
        __weak __typeof(self) weakSelf = self;

        _cl_cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [_cl_cancelButton cl_setNormalButtonWithTitle:@"取消"];
        [_cl_cancelButton cl_setNormalTitleWithColor:[UIColor cl_colorWithHex:0x333333]];

        [_cl_cancelButton cl_addButtonActionComplete:^(UIButton *sender) {
           
            if (weakSelf.cl_pickerToolViewCancelActionBlock) {
                weakSelf.cl_pickerToolViewCancelActionBlock();
            }
        }];
    }
    
    return _cl_cancelButton;
}

- (UIButton *)cl_defineButton {
    
    if (!_cl_defineButton) {
        
        __weak __typeof(self) weakSelf = self;
        
        _cl_defineButton = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [_cl_defineButton cl_setNormalButtonWithTitle:@"确定"];
        [_cl_defineButton cl_setNormalTitleWithColor:[UIColor cl_colorWithHex:0x333333]];

        [_cl_defineButton cl_addButtonActionComplete:^(UIButton *sender) {
            
            if (weakSelf.cl_pickerToolViewDefineActionBlock) {
                weakSelf.cl_pickerToolViewDefineActionBlock();
            }
        }];
    }
    
    return _cl_defineButton;
}

- (UILabel *)cl_titleLabel {
    
    if (!_cl_titleLabel) {
        
        _cl_titleLabel = [[UILabel alloc] init];
        
        _cl_titleLabel.text          = @"标题";
        _cl_titleLabel.textColor     = [UIColor cl_colorWithHex:0x999999];
        _cl_titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _cl_titleLabel;
}

- (CALayer *)cl_lineLayer {
    
    if (!_cl_lineLayer) {
        
        _cl_lineLayer = [CALayer layer];
        
        _cl_lineLayer.backgroundColor = [UIColor cl_colorWithHex:0xFDFDFD].CGColor;
    }
    
    return _cl_lineLayer;
}

- (void)cl_addConstraintsWithSuperView  {
    
    self.backgroundColor = [UIColor cl_colorWithHex:0xFDFDFD];
        
    [self.layer addSublayer:self.cl_lineLayer];
    
    [self addSubview:self.cl_cancelButton];
    [self addSubview:self.cl_titleLabel];
    [self addSubview:self.cl_defineButton];
    
    CGFloat cl_titleLabelX   = self.cl_width / 2 - 50;
    CGFloat cl_defineButtonX = self.cl_width - 60;

    self.cl_lineLayer.frame    = CGRectMake(0, CGRectGetWidth(self.frame) - 1, CGRectGetHeight(self.frame), 1);
    self.cl_cancelButton.frame = CGRectMake(10, 0, 50, self.cl_height);
    self.cl_defineButton.frame = CGRectMake(cl_defineButtonX, 0, 50, self.cl_height);
    self.cl_titleLabel.frame   = CGRectMake(cl_titleLabelX, 0, 100, self.cl_height);
}

@end
