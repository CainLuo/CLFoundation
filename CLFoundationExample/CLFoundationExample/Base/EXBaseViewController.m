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

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self ex_addConstraintsWithSuperView];
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

- (void)ex_addConstraintsWithSuperView {
    
    [self.view addSubview:self.ex_textView];
    
    [self.ex_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        if (@available(iOS 11.0, *)) {
            
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
        } else {
            
            (void)make.edges;
        }
    }];
}

@end
