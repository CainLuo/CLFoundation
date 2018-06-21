//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLScrollViewDelegate.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/4/28.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLScrollViewDelegate.h"

@interface CLScrollViewDelegate ()

@property (nonatomic, weak, readwrite) CLScrollViewViewModel *cl_scrollViewViewModel;

@end

@implementation CLScrollViewDelegate

- (instancetype)initScrollViewDelegateWithViewModel:(CLScrollViewViewModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.cl_scrollViewViewModel = viewModel;
    }
    
    return self;
}

@end
