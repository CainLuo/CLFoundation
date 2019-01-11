//
//  CLPickerDataSource.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/9/12.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLPickerDataSource.h"

@interface CLPickerDataSource ()

@property (nonatomic, weak, readwrite) CLPickerViewModel *cl_viewModel;

@end

@implementation CLPickerDataSource

- (instancetype)initPickerDataSourceWithViewModel:(CLPickerViewModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.cl_viewModel = viewModel;
    }
    
    return self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
    
    return self.cl_viewModel.cl_dataSource.count;
}

@end
