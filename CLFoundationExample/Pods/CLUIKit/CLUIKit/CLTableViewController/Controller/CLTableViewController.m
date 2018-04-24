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
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.cl_tableView];
    [self cl_addRefresh];
}

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

#pragma mark - Refresh
- (void)cl_addRefresh {
    
    __weak typeof(self) weakSelf = self;
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf cl_dropDownRefresh];
    }];
    
    self.cl_tableView.mj_header = header;
    
    MJRefreshAutoFooter *refreshFooter = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        
        [weakSelf cl_pullUpRefresh];
    }];
    
    refreshFooter.automaticallyHidden = YES;
    
    self.cl_tableView.mj_footer = refreshFooter;
}

- (void)cl_dropDownRefresh {}

- (void)cl_pullUpRefresh {}

- (void)cl_dropDownBeginRefresh {
    [self.cl_tableView.mj_header beginRefreshing];
}

- (void)cl_dropDownEndRefresh {
    [self.cl_tableView.mj_header endRefreshing];
}

- (void)cl_pullUpBeginRefresh {
    [self.cl_tableView.mj_footer beginRefreshing];
}

- (void)cl_pullUpEndRefresh {
    [self.cl_tableView.mj_footer endRefreshing];
}

- (void)cl_removeRefresh {
    
    self.cl_tableView.mj_header = nil;
    self.cl_tableView.mj_footer = nil;
}

- (void)cl_removeHeaderRefresh {
    self.cl_tableView.mj_header = nil;
}

- (void)cl_removeFooterRefresh {
    self.cl_tableView.mj_footer = nil;
}

@end
