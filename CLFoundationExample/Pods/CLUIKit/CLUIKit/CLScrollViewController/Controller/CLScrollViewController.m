//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLScrollViewController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/4/28.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLScrollViewController.h"

@interface CLScrollViewController ()

@property (nonatomic, strong, readwrite) UIScrollView *cl_scrollView;

@end

@implementation CLScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.cl_scrollView];
}

- (void)cl_setScrollViewDelegate:(id<UIScrollViewDelegate>)delegate {
    
    self.cl_scrollView.delegate = delegate;
}

- (void)cl_hiddenScrollIndicator {
    
    self.cl_scrollView.showsVerticalScrollIndicator   = NO;
    self.cl_scrollView.showsHorizontalScrollIndicator = NO;
}

- (UIScrollView *)cl_scrollView {
    
    if (!_cl_scrollView) {
        
        _cl_scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
        
        _cl_scrollView.backgroundColor = [UIColor whiteColor];
    }
    
    return _cl_scrollView;
}

@end
