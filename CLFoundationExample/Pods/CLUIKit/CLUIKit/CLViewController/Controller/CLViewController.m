//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLViewController.m
//
//  Created by Cain on 2017/7/12.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "CLViewController.h"

@interface CLViewController ()

@end

@implementation CLViewController

- (instancetype)initViewControllerWithType:(CLViewControllerType)type {
    
    self = [super init];
    
    if (self) {
        
        if (type == CLViewControllerTypeChild) {
            
            self.hidesBottomBarWhenPushed = YES;
        }
    }
    
    return self;
}

- (instancetype)initViewControllerWithTransitioningDelegate:(id<UIViewControllerTransitioningDelegate>)delegate {
    
    self = [super init];
    
    if (self) {
        
        self.transitioningDelegate = delegate;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
