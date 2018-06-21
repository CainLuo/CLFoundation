//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLScrollViewViewModel.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/4/28.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLScrollViewViewModel.h"

@interface CLScrollViewViewModel ()

@property (nonatomic, weak, readwrite) CLScrollViewController *cl_scrollViewController;

@end

@implementation CLScrollViewViewModel

- (instancetype)initScrollViewDelegateWithController:(CLScrollViewController *)controller {
    
    self = [super init];
    
    if (self) {
        
        self.cl_scrollViewController = controller;
    }
    
    return self;
}

@end
