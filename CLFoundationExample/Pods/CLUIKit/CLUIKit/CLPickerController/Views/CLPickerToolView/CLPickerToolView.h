//
//  CLPickerToolView.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/9/12.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLPickerToolView : UIView

@property (nonatomic, strong, readonly) UIButton *cl_cancelButton;
@property (nonatomic, strong, readonly) UIButton *cl_defineButton;

@property (nonatomic, strong, readonly) UILabel *es_titleLabel;

@property (nonatomic, copy) void(^cl_pickerToolViewDefineActionBlock)(void);
@property (nonatomic, copy) void(^cl_pickerToolViewCancelActionBlock)(void);

@end
