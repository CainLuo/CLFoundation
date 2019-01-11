//
//  CLPickerController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/9/12.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLPickerController.h"
#import "CLPickerTransitioningDelegate.h"
#import "UIViewController+CLViewController.h"

@interface CLPickerController ()

@property (nonatomic, strong) CLPickerTransitioningDelegate *cl_pickerTransitioningDelegate;

@property (nonatomic, strong, readwrite) CLPickerView     *cl_pickerView;
@property (nonatomic, strong, readwrite) CLPickerToolView *cl_pickerToolView;

@end

@implementation CLPickerController

- (instancetype)initPickerControllerWithHeight:(CGFloat)height {
    
    self = [super init];
    
    if (self) {
        
        self.transitioningDelegate     = self.cl_pickerTransitioningDelegate;
        self.modalPresentationStyle    = UIModalPresentationCustom;
        
        if (height == 0) {
            
            height = 264;
        }
        
        self.cl_presentationViewHeight = height;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.cl_pickerView];
    [self.view addSubview:self.cl_pickerToolView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self cl_addConstraintsWithSuperView];
}

- (CLPickerView *)cl_pickerView {
    
    if (!_cl_pickerView) {
        
        CGFloat cl_pickerViewH = self.cl_presentationViewHeight - CGRectGetHeight(self.cl_pickerToolView.frame);
        
        _cl_pickerView = [[CLPickerView alloc] initWithFrame:CGRectMake(0,
                                                                        CGRectGetMaxY(self.cl_pickerToolView.frame),
                                                                        CGRectGetWidth(self.view.frame),
                                                                        cl_pickerViewH)];
        
        _cl_pickerView.showsSelectionIndicator = YES;
    }
    
    return _cl_pickerView;
}

- (CLPickerToolView *)cl_pickerToolView {
    
    if(!_cl_pickerToolView) {
        
        CGFloat cl_pickerToolViewH = self.cl_hiddenToolView ? 0 : 44;
        
        _cl_pickerToolView = [[CLPickerToolView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), cl_pickerToolViewH)];
        
        _cl_pickerToolView.hidden = self.cl_hiddenToolView;
    }
    
    return _cl_pickerToolView;
}

- (void)cl_setPickerViewDelegate:(id<UIPickerViewDelegate>)delegate
                      dataSource:(id<UIPickerViewDataSource>)dataSource {
    
    self.cl_pickerView.delegate   = delegate;
    self.cl_pickerView.dataSource = dataSource;
}

- (void)cl_configPickerToolViewActions {
    
    __weak __typeof(self) weakSelf = self;
    
    [self.cl_pickerToolView setCl_pickerToolViewCancelActionBlock:^{
        
        [weakSelf dismissViewControllerAnimated:YES
                                     completion:nil];
    }];
}

- (CLPickerTransitioningDelegate *)cl_pickerTransitioningDelegate {
    
    if (!_cl_pickerTransitioningDelegate) {
        
        _cl_pickerTransitioningDelegate = [[CLPickerTransitioningDelegate alloc] initViewControllerTransitioningDelegateWithController:self];
    }
    
    return _cl_pickerTransitioningDelegate;
}

- (void)cl_addConstraintsWithSuperView {
    
    [self cl_configPickerToolViewActions];
}

@end
