//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLTableViewDragDelegate.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/3/30.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLTableViewDragDelegate.h"

@interface CLTableViewDragDelegate ()

@property (nonatomic, weak, readwrite) CLTableViewViewModel *cl_viewModel;

@end

@implementation CLTableViewDragDelegate

- (instancetype)initTableViewDragDelegateWithViewModel:(CLTableViewViewModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.cl_viewModel = viewModel;
    }
    
    return self;
}

- (nonnull NSArray<UIDragItem *> *)tableView:(nonnull UITableView *)tableView
                itemsForBeginningDragSession:(nonnull id<UIDragSession>)session
                                 atIndexPath:(nonnull NSIndexPath *)indexPath  API_AVAILABLE(ios(11.0)) {

    return nil;
}

@end
