//
//  CLPickerViewModel.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/9/12.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLPickerViewModel.h"

@interface CLPickerViewModel ()

@property (nonatomic, weak, readwrite) CLPickerController *cl_pickerController;

@end

@implementation CLPickerViewModel


- (instancetype)initPickerViewModelWithController:(CLPickerController *)controller {
    
    self = [super init];
    
    if (self) {
        
        self.cl_pickerController = controller;
    }
    
    return self;
}

- (NSMutableArray *)cl_dataSource {
    
    if (!_cl_dataSource) {
        
        _cl_dataSource = [NSMutableArray array];
    }
    
    return _cl_dataSource;
}

@end
