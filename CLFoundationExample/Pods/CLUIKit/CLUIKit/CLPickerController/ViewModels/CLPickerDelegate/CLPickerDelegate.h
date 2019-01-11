//
//  CLPickerDelegate.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/9/12.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CLPickerViewModel.h"

@interface CLPickerDelegate : NSObject <UIPickerViewDelegate>

/**
 只读CLPickerViewModel
 */
@property (nonatomic, weak, readonly) CLPickerViewModel *cl_viewModel;

/**
 初始化方法

 @param viewModel CLPickerViewModel
 @return CLPickerDelegate
 */
- (instancetype)initPickerDelegateWithViewModel:(CLPickerViewModel *)viewModel;

@end
