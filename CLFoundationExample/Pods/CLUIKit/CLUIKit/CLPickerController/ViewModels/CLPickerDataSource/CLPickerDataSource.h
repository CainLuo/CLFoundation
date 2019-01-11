//
//  CLPickerDataSource.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/9/12.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CLPickerViewModel.h"

@interface CLPickerDataSource : NSObject <UIPickerViewDataSource>

/**
 只读的CLPickerViewModel
 */
@property (nonatomic, weak, readonly) CLPickerViewModel *cl_viewModel;

/**
 初始化方法

 @param viewModel CLPickerViewModel
 @return CLPickerDataSource
 */
- (instancetype)initPickerDataSourceWithViewModel:(CLPickerViewModel *)viewModel;

@end
