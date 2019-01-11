//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLTableViewController.m
//
//  Created by Cain Luo on 28/11/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "CLTableViewController.h"
#import "MJRefresh.h"

@interface CLTableViewController ()

@property (nonatomic, assign) UITableViewStyle tableViewStyle;

@property (nonatomic, strong, readwrite) UITableView *cl_tableView;

@property (nonatomic, strong) MJRefreshNormalHeader     *cl_refreshHeader;
@property (nonatomic, strong) MJRefreshBackNormalFooter *cl_refreshFooter;

@end

@implementation CLTableViewController

- (instancetype)initTableViewControllerWithStyle:(UITableViewStyle)style {
    
    self = [super init];
    
    if (self) {
        
        [self setTableViewStyle:style];
    }
    
    return self;
}

#pragma mark - View Did Load
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.cl_tableView];
    [self cl_addRefresh];
}

#pragma mark - 设置Delegate与DataSource
- (void)cl_setTableViewDelegate:(id<UITableViewDelegate>)delegate
                     dataSource:(id<UITableViewDataSource>)dataSource {
    
    self.cl_tableView.delegate   = delegate;
    self.cl_tableView.dataSource = dataSource;
}

#pragma mark - 设置DragDelegate与DropDelegate
- (void)cl_setTableViewDragDelegate:(id<UITableViewDragDelegate>)dragDelegate
                       dropDelegate:(id<UITableViewDropDelegate>)dropDelegate {
    
    self.cl_tableView.dragDelegate = dragDelegate;
    self.cl_tableView.dropDelegate = dropDelegate;
}

#pragma mark - 隐藏UITableView的ScrollIndicator
- (void)cl_hiddenTableViewScrollIndicator {
    
    self.cl_tableView.showsVerticalScrollIndicator   = NO;
    self.cl_tableView.showsHorizontalScrollIndicator = NO;
}

#pragma mark - MJRefresh相关
- (void)cl_addRefresh {
    
    self.cl_tableView.mj_header = self.cl_refreshHeader;
    self.cl_tableView.mj_footer = self.cl_refreshFooter;
}

- (MJRefreshNormalHeader *)cl_refreshHeader {
    __weak typeof(self) weakSelf = self;
    
    if (!_cl_refreshHeader) {
    
        _cl_refreshHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf cl_dropDownRefresh];
        }];
    }
    
    return _cl_refreshHeader;
}

- (MJRefreshBackNormalFooter *)cl_refreshFooter {
    
    __weak typeof(self) weakSelf = self;

    if (!_cl_refreshFooter) {
        
        _cl_refreshFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [weakSelf cl_pullUpRefresh];
        }];
    }
    
    return _cl_refreshFooter;
}

#pragma mark - 下拉刷新相关
- (void)cl_dropDownBeginRefresh {
    [self.cl_tableView.mj_header beginRefreshing];
}

- (void)cl_dropDownRefresh {}

- (void)cl_dropDownEndRefresh {
    [self.cl_tableView.mj_header endRefreshing];
}

#pragma mark - 上拉刷新相关
- (void)cl_pullUpBeginRefresh {
    [self.cl_tableView.mj_footer beginRefreshing];
}

- (void)cl_pullUpRefresh {}

- (void)cl_pullUpEndRefresh {
    [self.cl_tableView.mj_footer endRefreshing];
}

- (void)cl_endTableViewRefreshWithType:(CLTableViewRefreshType)refreshType {
    
    if (refreshType == CLTableViewRefreshTypeDropDown) {
        
        [self cl_dropDownEndRefresh];
    } else {
        [self cl_pullUpEndRefresh];
    }
}

#pragma mark - 移除MJRefresh
- (void)cl_removeHeaderRefresh {
    self.cl_tableView.mj_header = nil;
}

- (void)cl_removeFooterRefresh {
    self.cl_tableView.mj_footer = nil;
}

- (void)cl_removeRefresh {
    
    self.cl_tableView.mj_header = nil;
    self.cl_tableView.mj_footer = nil;
}

/**
 隐藏MJRefreshHeader的StateLabel与TimeLabel
 */
- (void)cl_hiddenRefreshStateOrLastTimeLabel {
    
    [self cl_hiddenRefreshStateLabel];
    [self cl_hiddenHeaderRefreshLastTimeLabel];
}

/**
 隐藏MJRefreshHeader与MJRefreshFooter的StateLabel
 */
- (void)cl_hiddenRefreshStateLabel {
    
    [self cl_hiddenHeaderRefreshStateLabel];
    [self cl_hiddenFooterRefreshStateLabel];
}

/**
 隐藏MJRefreshHeader的StateLabel
 */
- (void)cl_hiddenHeaderRefreshStateLabel {
    
    self.cl_refreshHeader.stateLabel.hidden = YES;
}

/**
 隐藏MJRefreshFooter的StateLabel
 */
- (void)cl_hiddenFooterRefreshStateLabel {
    
    self.cl_refreshFooter.stateLabel.hidden = YES;
}

/**
 隐藏MJRefreshHeader的LastTimeLabel
 */
- (void)cl_hiddenHeaderRefreshLastTimeLabel {
    
    self.cl_refreshHeader.lastUpdatedTimeLabel.hidden = YES;
}

#pragma mark - 懒加载
- (UITableView *)cl_tableView {
    
    if (!_cl_tableView) {
        
        _cl_tableView = [[UITableView alloc] initWithFrame:self.view.frame
                                                     style:self.tableViewStyle];
        
        if (self.tableViewStyle == UITableViewStylePlain) {
            
            _cl_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        }
    }
    
    return _cl_tableView;
}

@end
