//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLCollectionViewDataSource.h
//
//  Created by Cain on 2017/7/12.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLCollectionViewViewModel.h"

@interface CLCollectionViewDataSource : NSObject <UICollectionViewDataSource>

/**
 只读的CLCollectionViewViewModel
 */
@property (nonatomic, weak, readonly) CLCollectionViewViewModel *cl_viewModel;

/**
 CLCollectionViewDataSource自定义初始化

 @param viewModel CLCollectionViewViewModel
 @return self
 */
- (instancetype)initCollectionViewDataSourceWithViewModel:(CLCollectionViewViewModel *)viewModel;

@end
