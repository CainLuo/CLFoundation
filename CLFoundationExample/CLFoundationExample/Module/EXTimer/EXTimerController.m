//
//  EXTimerController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/22.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXTimerController.h"

@interface EXTimerController ()

@property (nonatomic, strong) NSTimer *ex_scheduledTimer;
@property (nonatomic, strong) NSTimer *ex_timer;

@property (nonatomic, strong) UIButton *ex_scheduledTimerButton;
@property (nonatomic, strong) UIButton *ex_timerButton;

@end

@implementation EXTimerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self ex_addConstraintsWithSuperView];
    
    self.ex_scheduledTimer = [NSTimer cl_scheduledTimerWithTimeInterval:3
                                                                repeats:YES
                                                               complete:^{
                                                                   
                                                                   [self.ex_textViewString appendFormat:@"ex_scheduledTimer 倒计时: %@\n", [NSDate date]];
                                                                   
                                                                   [self ex_reloadTextView];
                                                               }];
    
    [[NSRunLoop currentRunLoop] addTimer:self.ex_timer
                                 forMode:NSRunLoopCommonModes];
}

- (NSTimer *)ex_timer {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_timer);
    
    _ex_timer = [NSTimer cl_timerWithTimeInterval:3
                                          repeats:YES
                                         complete:^{
                                             
                                             [self.ex_textViewString appendFormat:@"ex_timer 倒计时: %@\n", [NSDate date]];
                                             
                                             [self ex_reloadTextView];
                                         }];
    
    return _ex_timer;
}

- (void)ex_resumeScheduledTimer {
    
    [self.ex_scheduledTimer cl_resumeTimer];
    
    [self.ex_timer cl_pauseTimer];
}

- (void)ex_resumeTimer {
    
    [self.ex_timer cl_resumeTimer];
    
    [self.ex_scheduledTimer cl_pauseTimer];
}

- (UIButton *)ex_scheduledTimerButton {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_scheduledTimerButton);
    
    _ex_scheduledTimerButton = [[UIButton alloc] init];
    
    _ex_scheduledTimerButton.tag             = 0;
    _ex_scheduledTimerButton.backgroundColor = [UIColor purpleColor];
    
    [_ex_scheduledTimerButton addTarget:self
                                 action:@selector(ex_timerButtonActions:)
                       forControlEvents:UIControlEventTouchUpInside];
    [_ex_scheduledTimerButton setTitle:@"ScheduledTimerButton"
                              forState:UIControlStateNormal];
    
    return _ex_scheduledTimerButton;
}

- (UIButton *)ex_timerButton {
    
    CL_GET_METHOD_RETURN_OBJC(_ex_timerButton);
    
    _ex_timerButton = [[UIButton alloc] init];
    
    _ex_timerButton.tag             = 1;
    _ex_timerButton.backgroundColor = [UIColor orangeColor];

    [_ex_timerButton addTarget:self
                        action:@selector(ex_timerButtonActions:)
              forControlEvents:UIControlEventTouchUpInside];
    [_ex_timerButton setTitle:@"TimerButton"
                     forState:UIControlStateNormal];

    return _ex_timerButton;
}

- (void)ex_timerButtonActions:(UIButton *)sender {
    
    if (sender.tag == 0) {
        
        [self ex_resumeScheduledTimer];
    } else {
        
        [self ex_resumeTimer];
    }
}

- (void)ex_addConstraintsWithSuperView {
    
    [self.view addSubview:self.ex_textView];
    [self.view addSubview:self.ex_scheduledTimerButton];
    [self.view addSubview:self.ex_timerButton];
    
    [self.ex_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        (void)make.left.right;
        make.bottom.equalTo(self.ex_timerButton.mas_top);
        
        if (@available(iOS 11.0, *)) {
            
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        } else {

            (void)make.top;
        }
    }];
    
    [self.ex_scheduledTimerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        (void)make.left;
        make.width.equalTo(self.view).dividedBy(2);
        make.height.mas_equalTo(50);
        
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            (void)make.bottom;
        }
    }];
    
    [self.ex_timerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        (void)make.right;
        make.width.bottom.height.equalTo(self.ex_scheduledTimerButton);
    }];
}

@end
