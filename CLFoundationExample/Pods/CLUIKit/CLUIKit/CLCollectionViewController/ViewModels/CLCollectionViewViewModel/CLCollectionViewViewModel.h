//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLCollectionViewBaseModel.h
//
//  Created by Cain on 2016/12/1.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLCollectionViewController.h"

@interface CLCollectionViewViewModel : NSObject

/**
 数据源NSMutableArray
 */
@property (nonatomic, strong, readonly) NSMutableArray *cl_dataSource;

/**
 只读的CLCollectionViewController
 */
@property (nonatomic, weak, readonly) CLCollectionViewController *cl_collectionViewController;

/**
 CLCollectionViewViewModel自定义初始化

 @param viewController CLCollectionViewController
 @return self
 */
- (instancetype)initCollectionViewBaseModelWithController:(CLCollectionViewController *)viewController;

/**
 刷新UICollectionView的方法, 需要外部重载, 默认不实现任何东西
 */
- (void)cl_collectionViewHTTPRequest;

@end
