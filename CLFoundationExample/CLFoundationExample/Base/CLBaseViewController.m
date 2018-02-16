//
//  CLBaseViewController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/14.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLBaseViewController.h"

@interface CLBaseViewController ()

@property (nonatomic, strong, readwrite) UITextView *cl_textView;

@end

@implementation CLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.cl_textView];
}

- (UITextView *)cl_textView {
    
    CL_GET_METHOD_RETURN_OBJC(_cl_textView);
    
    _cl_textView = [[UITextView alloc] initWithFrame:self.view.frame];
    
    _cl_textView.font = [UIFont systemFontOfSize:15];
    
    return _cl_textView;
}

- (NSMutableString *)cl_textViewString {
    
    CL_GET_METHOD_RETURN_OBJC(_cl_textViewString);
    
    _cl_textViewString = [[NSMutableString alloc] init];
    
    return _cl_textViewString;
}

- (void)cl_reloadTextView {
    
    self.cl_textView.text = self.cl_textViewString;
}

@end
