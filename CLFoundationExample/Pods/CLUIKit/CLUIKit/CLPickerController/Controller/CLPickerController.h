//
//  CLPickerController.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/9/12.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLViewController.h"
#import "CLPickerToolView.h"
#import "CLPickerView.h"

@interface CLPickerController : CLViewController

/**
 只读的UIPickerView
 */
@property (nonatomic, strong, readonly) CLPickerView *cl_pickerView;

/**
 只读的CLPickerToolView
 */
@property (nonatomic, strong, readonly) CLPickerToolView *cl_pickerToolView;

/**
 是否展示CLPickerToolView, Default: NO
 */
@property (nonatomic, assign) BOOL cl_hiddenToolView;

/**
 UIPickerView Row Height
 */
@property (nonatomic, assign) CGFloat cl_pickerRowHeight;

/**
 初始化方法, 自带CLViewControllerTransitioningDelegate代理
 如需自定义, 可自行重写UIViewController TransitioningDelegate

 @param height Present Height
 @return CLPickerController
 */
- (instancetype)initPickerControllerWithHeight:(CGFloat)height;

/**
 设置UIPickerView的Delegate&DataSource

 @param delegate id<UIPickerViewDelegate>
 @param dataSource id<UIPickerViewDataSource>
 */
- (void)cl_setPickerViewDelegate:(id<UIPickerViewDelegate>)delegate
                      dataSource:(id<UIPickerViewDataSource>)dataSource;

@end
