//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLCollectionViewController.h
//
//  Created by Cain on 2016/11/30.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "CLViewController.h"

typedef NS_ENUM(NSInteger, CLCollectionViewRefreshType) {
    CLCollectionViewRefreshTypeDropDown = 0,
    CLCollectionViewRefreshTypePullUp
};

NS_ASSUME_NONNULL_BEGIN
@interface CLCollectionViewController : CLViewController

/**
 UICollectionView
 */
@property (nonatomic, strong, readonly) UICollectionView *cl_collectionView;

/**
 UICollectionViewFlowLayout, 默认不实现任何东西
 */
@property (nonatomic, strong, readonly) UICollectionViewFlowLayout *cl_collectionViewFlowLayout;

/**
 设置UICollectionView的代理与数据源
 
 @param delegate UICollectionViewDelegate
 @param dataSource UICollectionViewDataSource
 */
- (void)cl_setCollectionViewDelegate:(_Nullable id <UICollectionViewDelegate>)delegate
                          dataSource:(_Nullable id <UICollectionViewDataSource>)dataSource;

/**
 设置UICollectionView的拖拽代理与拖放代理
 
 @param dragDelegate UICollectionViewDragDelegate
 @param dropDelegate UICollectionViewDropDelegate
 */
- (void)cl_setCollectionViewDragDelegate:(_Nullable id <UICollectionViewDragDelegate>)dragDelegate
                            dropDelegate:(_Nullable id <UICollectionViewDropDelegate>)dropDelegate API_AVAILABLE(ios(11.0));

/**
 隐藏UICollectionView的ScrollIndicator
 */
- (void)cl_hiddenCollectionViewScrollIndicator;

/**
 给UICollectionView注册类
 
 @param cellClass Class
 @param identifier NSString
 */
- (void)cl_registerClass:(nullable Class)cellClass
              identifier:(NSString *)identifier;

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
 
 @param refreshType CLCollectionViewRefreshType
 */
- (void)cl_endCollectionViewRefreshWithType:(CLCollectionViewRefreshType)refreshType;

/**
 删除下拉加载控件
 */
- (void)cl_removeHeaderRefresh;

/**
 删除上拉加载控件
 */
- (void)cl_removeFooterRefresh;

/**
 删除刷新控件
 */
- (void)cl_removeRefresh;

@end
NS_ASSUME_NONNULL_END
