//
//  EXBaseViewController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/14.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXBaseViewController.h"

@interface EXBaseViewController ()

@property (nonatomic, strong, readwrite) UITextView *ex_textView;

@end

@implementation EXBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.ex_textView];

//    [self cl_addConstraintsWithSuperView];
}

- (UITextView *)ex_textView {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_textView);
    
    _ex_textView = [[UITextView alloc] initWithFrame:self.view.frame];
    
    _ex_textView.font = [UIFont systemFontOfSize:15];
    
    return _ex_textView;
}

- (NSMutableString *)ex_textViewString {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_textViewString);
    
    _ex_textViewString = [[NSMutableString alloc] init];
    
    return _ex_textViewString;
}

- (void)ex_reloadTextView {
    
    self.ex_textView.text = self.ex_textViewString;
}

@end
