//
//  EXNotificationCenterController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/4/23.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXNotificationCenterController.h"

@interface EXNotificationCenterController ()

@property (nonatomic, strong) UIButton *ex_button;
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

- (void)ex_buttonAction {
    
    NSArray *ex_titleArray = @[@"调用NotificationCenter",
                               @"删除了NotificationCenter",
                               @"阻塞主线程调用NotificationCenter",
                               @"阻塞主线程调用NotificationCenter并推送Object",
                               @"阻塞主线程调用NotificationCenter并推送Object和UserInfo"];
    
    [self cl_showSheetViewControllerWithTitle:nil
                                      message:nil
                                 actionTitles:ex_titleArray
                                     complete:^(UIAlertAction *action, NSUInteger index) {
        
                                         self.ex_label.text = ex_titleArray[index];
                                         
                                         switch (index) {
                                             case 0:
                                             
                                             [self ex_postNotificationOnMainThread];
                                             
                                             break;
                                             
                                             case 1:
                                             
                                             [self ex_deleteButtonAction];
                                             
                                             break;
                                             case 2:
                                             
                                             [self ex_postNotificationOnMainThreadWait];
                                             
                                             break;
                                             case 3:
                                             
                                             [self ex_postNotificationOnMainThreadObject];
                                             
                                             break;
                                             case 4:
                                             
                                             [self ex_postNotificationOnMainThreadUserInfo];
                                             
                                             break;
                                             case 5:
                                             
                                             [self ex_postNotificationOnMainThreadUserInfoWait];
                                             
                                             break;
                                             default:
                                             break;
                                         }
                                     }];
}

#pragma mark - 通知的操作
- (void)ex_postNotificationOnMainThread {
    
    NSNotification *ex_notification = [[NSNotification alloc] initWithName:@"EXShowNotificationCenter"
                                                                    object:@"ABCD"
                                                                  userInfo:@{@"age":@"16"}];
    
    [[NSNotificationCenter defaultCenter] cl_postNotificationOnMainThread:ex_notification];
}

- (void)ex_postNotificationOnMainThreadWait {
    
    NSNotification *ex_notification = [[NSNotification alloc] initWithName:@"EXShowNotificationCenter"
                                                                    object:@"BCDE"
                                                                  userInfo:@{@"age":@"16"}];

    [[NSNotificationCenter defaultCenter] cl_postNotificationOnMainThread:ex_notification
                                                            waitUntilDone:YES];
}

- (void)ex_postNotificationOnMainThreadObject {
    
    [[NSNotificationCenter defaultCenter] cl_postNotificationOnMainThreadWithName:@"EXShowNotificationCenter"
                                                                           object:@"Hello Word"];
}

- (void)ex_postNotificationOnMainThreadUserInfo {
    
    [[NSNotificationCenter defaultCenter] cl_postNotificationOnMainThreadWithName:@"EXShowNotificationCenter"
                                                                           object:@"Hello Word"
                                                                         userInfo:@{@"age":@"20",
                                                                                    @"name":@"小明"}];
}

- (void)ex_postNotificationOnMainThreadUserInfoWait {
    
    [[NSNotificationCenter defaultCenter] cl_postNotificationOnMainThreadWithName:@"EXShowNotificationCenter"
                                                                           object:@"Hello Word"
                                                                         userInfo:@{@"age":@"20",
                                                                                    @"name":@"小明"}
                                                                    waitUntilDone:YES];
}

- (void)ex_showNotificationCenter:(NSNotification *)notification {
    
    NSLog(@"打印NSNotification: %@", notification);
}

- (void)ex_deleteButtonAction {
    
    NSLog(@"删除了通知");
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:@"EXShowNotificationCenter"
                                                  object:nil];
}

#pragma mark - 控件的懒加载
- (UIButton *)ex_button {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_button);
    
    _ex_button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    _ex_button.backgroundColor = [UIColor cl_colorWithHex:0x2e7ae6];
    
    [_ex_button cl_setNormalButtonWithTitle:@"调用NotificationCenter"];
    [_ex_button cl_setNormalTitleWithColor:[UIColor whiteColor]];
    [_ex_button cl_addButtonActionComplete:^(UIButton *sender) {
        
        [self ex_buttonAction];
    }];
    
    return _ex_button;
}

- (UILabel *)ex_label {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_label);
    
    _ex_label = [[UILabel alloc] init];
    
    _ex_label.text          = @"我是一个Label";
    _ex_label.font          = [UIFont systemFontOfSize:18];
    _ex_label.textColor     = [UIColor blackColor];
    _ex_label.textAlignment = NSTextAlignmentCenter;
    _ex_label.numberOfLines = 0;
    
    return _ex_label;
}

- (void)ex_addConstraintsWithSuperView {
    
    [self.view addSubview:self.ex_label];
    [self.view addSubview:self.ex_button];
    
    [self.ex_label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(50);
        make.left.offset(10);
        make.right.offset(-10);
    }];

    [self.ex_button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.offset(10);
        make.right.offset(-10);
        make.height.mas_equalTo(40);
        make.top.equalTo(self.ex_label.mas_bottom).offset(50);
    }];
}

@end
