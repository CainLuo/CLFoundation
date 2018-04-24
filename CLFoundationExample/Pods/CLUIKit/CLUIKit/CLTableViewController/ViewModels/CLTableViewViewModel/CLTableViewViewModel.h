//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLTableViewBaseModel.h
//
//  Created by Cain on 2016/11/30.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLTableViewController.h"

@interface CLTableViewViewModel : NSObject

/**
 数据源NSArray
 */
@property (nonatomic, strong, readonly) NSMutableArray *cl_dataSource;

/**
 只读的CLTableViewController
 */
@property (nonatomic, weak, readonly) CLTableViewController *cl_tableViewController;

/**
 初始化CLTableViewViewModel

 @param viewController CLTableViewController
 @return self
 */
- (instancetype)initTableViewBaseModelWithController:(CLTableViewController *)viewController;

/**
 通过HTTP请求数据
 */
- (void)cl_tableViewHTTPRequest;

/**
 配置TableView每一条Cell所显示的分割线
 */
- (void)cl_showTableViewSeparatorLine;

@end
