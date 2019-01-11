//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLViewControllerViewModel.m
//  SimpleProject
//
//  Created by Cain on 2017/8/29.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "CLViewControllerViewModel.h"

@interface CLViewControllerViewModel ()

@property (nonatomic, weak, readwrite) CLViewController *cl_viewController;

@end

@implementation CLViewControllerViewModel

- (instancetype)initViewControllerViewModelWithController:(CLViewController *)controller {
    
    self = [super init];
    
    if (self) {
        
        self.cl_viewController = controller;
    }
    
    return self;
}

@end
