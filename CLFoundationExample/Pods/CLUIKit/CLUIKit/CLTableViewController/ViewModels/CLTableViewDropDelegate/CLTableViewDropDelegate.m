//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLTableViewDropDelegate.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/3/30.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLTableViewDropDelegate.h"

@interface CLTableViewDropDelegate ()

@property (nonatomic, weak, readwrite) CLTableViewViewModel *cl_viewModel;

@end

@implementation CLTableViewDropDelegate

- (instancetype)initTableViewDropDelegateWithViewModel:(CLTableViewViewModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.cl_viewModel = viewModel;
    }
    
    return self;
}

- (void)tableView:(nonnull UITableView *)tableView
performDropWithCoordinator:(nonnull id<UITableViewDropCoordinator>)coordinator  API_AVAILABLE(ios(11.0)) {
    
}

@end
