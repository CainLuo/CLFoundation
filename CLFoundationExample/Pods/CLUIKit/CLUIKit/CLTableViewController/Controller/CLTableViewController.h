//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLTableViewController.h
//
//  Created by Cain Luo on 28/11/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "CLViewController.h"

typedef NS_ENUM(NSInteger, CLTableViewRefreshType) {
    CLTableViewRefreshTypeDropDown = 0,
    CLTableViewRefreshTypePullUp
};

NS_ASSUME_NONNULL_BEGIN
@interface CLTableViewController : CLViewController

/**
 只读的UITableView
 */
@property (nonatomic, strong, readonly) UITableView *cl_tableView;

/**
 初始化CLTableViewController

 @param style UITableViewStyle, 默认是UITableViewStylePlain
 @return CLTableViewController
 */
- (instancetype)initTableViewControllerWithStyle:(UITableViewStyle)style;

/**
 设置UITableView的代理与数据源
 
 @param delegate UITableViewDelegate
 @param dataSource UITableViewDataSource
 */
- (void)cl_setTableViewDelegate:(_Nullable id <UITableViewDelegate>)delegate
                     dataSource:(_Nullable id <UITableViewDataSource>)dataSource;


/**
 设置UITableView的拖拽代理与拖放代理
 
 @param dragDelegate UITableViewDragDelegate
 @param dropDelegate UITableViewDropDelegate
 */
- (void)cl_setTableViewDragDelegate:(_Nullable id <UITableViewDragDelegate>)dragDelegate
                       dropDelegate:(_Nullable id <UITableViewDropDelegate>)dropDelegate API_AVAILABLE(ios(11.0));

/**
 隐藏UITableView的ScrollIndicator
 */
- (void)cl_hiddenTableViewScrollIndicator;

/**
 开始下拉刷新
 */
- (void)cl_dropDownBeginRefresh;

/**
 下拉刷新时调用的方法, 需要重载, 默认不实现任何东西
 */
- (void)cl_dropDownRefresh;

/**
 结束下拉刷新
 */
- (void)cl_dropDownEndRefresh;

/**
 开始上拉加载
 */
- (void)cl_pullUpBeginRefresh;

/**
 上拉加载时调用的方法, 需要重载, 默认不实现任何东西
 */
- (void)cl_pullUpRefresh;

/**
 结束上拉加载
 */
- (void)cl_pullUpEndRefresh;

/**
 选择指定的类型结束刷新

 @param refreshType CLTableViewRefreshType
 */
- (void)cl_endTableViewRefreshWithType:(CLTableViewRefreshType)refreshType;

/**
 删除头部MJRefresh
 */
- (void)cl_removeHeaderRefresh;

/**
 删除尾部MJRefresh
 */
- (void)cl_removeFooterRefresh;

/**
 删除MJRefresh
 */
- (void)cl_removeRefresh;

@end
NS_ASSUME_NONNULL_END
