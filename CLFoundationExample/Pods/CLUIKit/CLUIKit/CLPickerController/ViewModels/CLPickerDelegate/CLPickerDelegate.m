//
//  CLPickerDelegate.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/9/12.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLPickerDelegate.h"

@interface CLPickerDelegate ()

@property (nonatomic, weak) CLPickerViewModel *cl_viewModel;

@end

@implementation CLPickerDelegate

- (instancetype)initPickerDelegateWithViewModel:(CLPickerViewModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.cl_viewModel = viewModel;
    }
    
    return self;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView
rowHeightForComponent:(NSInteger)component {
    
    return self.cl_viewModel.cl_pickerController.cl_pickerRowHeight;
}

@end
