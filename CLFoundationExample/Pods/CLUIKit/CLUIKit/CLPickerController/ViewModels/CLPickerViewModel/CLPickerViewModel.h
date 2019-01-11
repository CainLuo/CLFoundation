//
//  CLPickerViewModel.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/9/12.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLPickerController.h"

@interface CLPickerViewModel : NSObject

/**
 数据源
 */
@property (nonatomic, strong) NSMutableArray *cl_dataSource;

/**
 只读的CLPickerController
 */
@property (nonatomic, weak, readonly) CLPickerController *cl_pickerController;

/**
 初始化方法

 @param controller CLPickerController
 @return CLPickerViewModel
 */
- (instancetype)initPickerViewModelWithController:(CLPickerController *)controller;

@end
