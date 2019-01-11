//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLViewControllerTransitioningDelegate.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/6/26.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLViewControllerTransitioningDelegate.h"

@interface CLViewControllerTransitioningDelegate ()

@property (nonatomic, weak, readwrite) CLViewController *cl_controller;

@end

@implementation CLViewControllerTransitioningDelegate

- (instancetype)initViewControllerTransitioningDelegateWithController:(CLViewController *)controller {
    
    self = [super init];
    
    if (self) {
        
        self.cl_controller = controller;
    }
    
    return self;
}

@end
