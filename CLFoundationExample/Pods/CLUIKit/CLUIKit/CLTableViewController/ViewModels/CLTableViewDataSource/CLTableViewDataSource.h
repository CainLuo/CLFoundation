//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLTableViewDataSource.h
//
//  Created by Cain on 2017/7/12.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLTableViewViewModel.h"

@interface CLTableViewDataSource : NSObject <UITableViewDataSource>

/**
 只读的CLTableViewViewModel
 */
@property (nonatomic, weak, readonly) CLTableViewViewModel *cl_viewModel;

/**
 初始化CLTableViewDataSource

 @param viewModel CLTableViewViewModel
 @return self
 */
- (instancetype)initTableViewDataSourceWithViewModel:(CLTableViewViewModel *)viewModel;

@end
