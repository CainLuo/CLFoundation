//
//  EXSpeechController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/4/20.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXSpeechController.h"

@interface EXSpeechController ()

@property (nonatomic, strong) UITextField *ex_textField;

@property (nonatomic, strong) UIButton *ex_button;

@end

@implementation EXSpeechController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self ex_addConstraintsWithSuperView];
}

- (UITextField *)ex_textField {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_textField);
    
    _ex_textField = [[UITextField alloc] init];
    
    _ex_textField.placeholder = @"输入你想播报的内容";
    _ex_textField.borderStyle = UITextBorderStyleRoundedRect;
    
    return _ex_textField;
}

- (UIButton *)ex_button {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_button);
    
    _ex_button = [[UIButton alloc] init];
    
    _ex_button.backgroundColor = [UIColor blueColor];
    
    [_ex_button setTitle:@"开始播报"
                forState:UIControlStateNormal];
    
    [_ex_button addTarget:self
                   action:@selector(ex_speechContent)
         forControlEvents:UIControlEventTouchUpInside];
    
    return _ex_button;
}

- (void)ex_speechContent {
    
    [[CLSpeechSunthesizer sharedSpeechSynthesizer] cl_speakString:self.ex_textField.text];
}

- (void)ex_addConstraintsWithSuperView {
    
    [self.view addSubview:self.ex_textField];
    [self.view addSubview:self.ex_button];
    
    [self.ex_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        (void)make.centerX;
        
        make.top.left.right.with.insets(UIEdgeInsetsMake(30, 10, 0, 10));
        make.height.offset(40);
    }];
    
    [self.ex_button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.height.equalTo(self.ex_textField);
        make.top.equalTo(self.ex_textField.mas_bottom).offset(30);
    }];
}

@end
