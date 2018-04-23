//
//  EXNotificationCenterController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/4/23.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXNotificationCenterController.h"

@interface EXNotificationCenterController ()

@property (nonatomic, strong) UIButton *ex_addButton;
@property (nonatomic, strong) UIButton *ex_deleteButton;
@property (nonatomic, strong) UILabel  *ex_label;

@end

@implementation EXNotificationCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(ex_showNotificationCenter:)
                                                 name:@"EXShowNotificationCenter"
                                               object:nil];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self ex_addConstraintsWithSuperView];
}

- (void)ex_configNotificationCenter {
    
    NSNotification *ex_notification = [[NSNotification alloc] initWithName:@"EXShowNotificationCenter"
                                                                    object:@"ABCD"
                                                                  userInfo:@{@"age":@"16"}];

    [[NSNotificationCenter defaultCenter] cl_postNotificationOnMainThread:ex_notification];
}

- (void)ex_showNotificationCenter:(NSNotification *)notification {
    
    NSLog(@"调用了: %@", notification);
    
    self.ex_label.text = @"调用了NotificationCenter";
}

- (UIButton *)ex_addButton {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_addButton);
    
    _ex_addButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    _ex_addButton.backgroundColor = [UIColor blueColor];

    [_ex_addButton setTitleColor:[UIColor whiteColor]
                        forState:UIControlStateNormal];
    [_ex_addButton setTitle:@"调用NotificationCenter"
                   forState:UIControlStateNormal];
    [_ex_addButton addTarget:self
                      action:@selector(ex_addButtonAction)
            forControlEvents:UIControlEventTouchUpInside];
    
    return _ex_addButton;
}

- (void)ex_addButtonAction {
    
    [self ex_configNotificationCenter];
}

- (UIButton *)ex_deleteButton {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_deleteButton);
    
    _ex_deleteButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    _ex_deleteButton.backgroundColor = [UIColor blueColor];
    
    [_ex_deleteButton setTitleColor:[UIColor whiteColor]
                           forState:UIControlStateNormal];
    [_ex_deleteButton setTitle:@"删除NotificationCenter"
                      forState:UIControlStateNormal];
    [_ex_deleteButton addTarget:self
                         action:@selector(ex_deleteButtonAction)
               forControlEvents:UIControlEventTouchUpInside];

    return _ex_deleteButton;
}

- (void)ex_deleteButtonAction {
        
    self.ex_label.text = @"删除了NotificationCenter";
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:@"EXShowNotificationCenter"
                                                  object:nil];
}

- (UILabel *)ex_label {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_label);
    
    _ex_label = [[UILabel alloc] init];
    
    _ex_label.text          = @"我是一个Label";
    _ex_label.font          = [UIFont systemFontOfSize:18];
    _ex_label.textColor     = [UIColor blackColor];
    _ex_label.textAlignment = NSTextAlignmentCenter;
    
    return _ex_label;
}

- (void)ex_addConstraintsWithSuperView {
    
    [self.view addSubview:self.ex_label];
    [self.view addSubview:self.ex_addButton];
    [self.view addSubview:self.ex_deleteButton];
    
    [self.ex_label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(50);
        make.left.offset(10);
        make.right.offset(-10);
        make.height.mas_equalTo(40);
    }];

    [self.ex_addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.offset(10);
        make.right.offset(-10);
        make.height.mas_equalTo(40);
        make.top.equalTo(self.ex_label.mas_bottom).offset(50);
    }];
    
    [self.ex_deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.offset(10);
        make.right.offset(-10);
        make.height.mas_equalTo(40);
        make.top.equalTo(self.ex_addButton.mas_bottom).offset(10);
    }];
}

@end
