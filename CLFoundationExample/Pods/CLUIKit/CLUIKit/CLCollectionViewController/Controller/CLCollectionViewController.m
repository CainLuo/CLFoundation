//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLCollectionViewController.m
//
//  Created by Cain on 2016/11/30.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "CLCollectionViewController.h"

#import "MJRefresh.h"

@interface CLCollectionViewController ()

@property (nonatomic, strong, readwrite) UICollectionView *cl_collectionView;
@property (nonatomic, strong, readwrite) UICollectionViewFlowLayout *cl_collectionViewFlowLayout;

@end

@implementation CLCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.cl_collectionView];
    [self cl_addRefresh];
}

#pragma mark - 设置Delegate与DataSource
- (void)cl_setCollectionViewDelegate:(id<UICollectionViewDelegate>)delegate
                          dataSource:(id<UICollectionViewDataSource>)dataSource {
    
    self.cl_collectionView.delegate = delegate;
    self.cl_collectionView.dataSource = dataSource;
}

#pragma mark - 设置DragDelegate与DropDelegate
- (void)cl_setCollectionViewDragDelegate:(id<UICollectionViewDragDelegate>)dragDelegate
                            dropDelegate:(id<UICollectionViewDropDelegate>)dropDelegate {
    
    self.cl_collectionView.dragDelegate = dragDelegate;
    self.cl_collectionView.dropDelegate = dropDelegate;
}

#pragma mark - 隐藏UICollectionView的ScrollIndicator
- (void)cl_hiddenCollectionViewScrollIndicator {
    
    self.cl_collectionView.showsVerticalScrollIndicator   = NO;
    self.cl_collectionView.showsHorizontalScrollIndicator = NO;
}

#pragma mark - 注册Class
- (void)cl_registerClass:(nullable Class)cellClass
              identifier:(NSString *)identifier {
    
    [self.cl_collectionView registerClass:cellClass
               forCellWithReuseIdentifier:identifier];
}

#pragma mark - MJRefresh相关
- (void)cl_addRefresh {
    
    __weak typeof(self) weakSelf = self;
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf cl_dropDownRefresh];
    }];
    
    self.cl_collectionView.mj_header = header;
    
    MJRefreshBackNormalFooter *refreshFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [weakSelf cl_pullUpRefresh];
    }];

    self.cl_collectionView.mj_footer = refreshFooter;
}

#pragma mark - 下拉刷新相关
- (void)cl_dropDownBeginRefresh {
    [self.cl_collectionView.mj_header beginRefreshing];
}

- (void)cl_dropDownRefresh {}

- (void)cl_dropDownEndRefresh {
    [self.cl_collectionView.mj_header endRefreshing];
}

#pragma mark - 上拉刷新相关
- (void)cl_pullUpBeginRefresh {
    [self.cl_collectionView.mj_footer beginRefreshing];
}

- (void)cl_pullUpRefresh {}

- (void)cl_pullUpEndRefresh {
    [self.cl_collectionView.mj_footer endRefreshing];
}

- (void)cl_endCollectionViewRefreshWithType:(CLCollectionViewRefreshType)refreshType {
    
    if (refreshType == CLCollectionViewRefreshTypeDropDown) {
        
        [self cl_dropDownEndRefresh];
    } else {
        
        [self cl_pullUpEndRefresh];
    }
}

#pragma mark - 移除MJRefresh
- (void)cl_removeHeaderRefresh {
    self.cl_collectionView.mj_header = nil;
}

- (void)cl_removeFooterRefresh {
    self.cl_collectionView.mj_footer = nil;
}

- (void)cl_removeRefresh {
    
    self.cl_collectionView.mj_header = nil;
    self.cl_collectionView.mj_footer = nil;
}

#pragma mark - 懒加载
#pragma mark - Collection View
- (UICollectionView *)cl_collectionView {
    
    if (!_cl_collectionView) {

        _cl_collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame
                                                collectionViewLayout:self.cl_collectionViewFlowLayout];
        
        _cl_collectionView.backgroundColor = [UIColor whiteColor];
        
        [_cl_collectionView registerClass:[UICollectionViewCell class]
               forCellWithReuseIdentifier:@"UICollectionViewCell"];

    }

    return _cl_collectionView;
}

#pragma mark - Collection View Flow Layout
- (UICollectionViewFlowLayout *)cl_collectionViewFlowLayout {
    
    if (!_cl_collectionViewFlowLayout) {

        _cl_collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    }

    return _cl_collectionViewFlowLayout;
}

@end
