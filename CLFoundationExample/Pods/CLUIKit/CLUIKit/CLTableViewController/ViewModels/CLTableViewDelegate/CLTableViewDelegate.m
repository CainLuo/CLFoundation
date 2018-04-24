//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLTableViewDelegate.m
//
//  Created by Cain on 2016/11/30.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "CLTableViewDelegate.h"

@interface CLTableViewDelegate ()

@property (nonatomic, weak, readwrite) CLTableViewViewModel *cl_viewModel;

@end

@implementation CLTableViewDelegate

- (instancetype)initTableViewDelegateWithViewModel:(CLTableViewViewModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.cl_viewModel = viewModel;
    }
    
    return self;
}

@end
