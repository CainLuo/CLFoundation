//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLTableViewBaseModel.m
//
//  Created by Cain on 2016/11/30.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "CLTableViewViewModel.h"

@interface CLTableViewViewModel()

@property (nonatomic, strong, readwrite) NSMutableArray *cl_dataSource;

@property (nonatomic, weak, readwrite) CLTableViewController *cl_tableViewController;

@end

@implementation CLTableViewViewModel

- (instancetype)initTableViewBaseModelWithController:(CLTableViewController *)viewController {
    
    self = [super init];
    
    if (self) {
        self.cl_tableViewController = viewController;
    }
    
    return self;
}

- (NSMutableArray *)cl_dataSource {
    
    if (!_cl_dataSource) {
        
        _cl_dataSource = [NSMutableArray array];
    }
    
    return _cl_dataSource;
}

- (void)cl_tableViewHTTPRequest {
    
}

- (void)cl_showTableViewSeparatorLine {
    
    if (self.cl_dataSource.count > 0) {
        
        self.cl_tableViewController.cl_tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
}

@end
