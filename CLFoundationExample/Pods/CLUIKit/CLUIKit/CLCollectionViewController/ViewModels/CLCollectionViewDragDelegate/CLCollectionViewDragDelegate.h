//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLCollectionViewDragDelegate.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/3/30.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLCollectionViewViewModel.h"

@interface CLCollectionViewDragDelegate : NSObject <UICollectionViewDragDelegate>

/**
 只读的CLCollectionViewViewModel
 */
@property (nonatomic, weak, readonly) CLCollectionViewViewModel *cl_viewModel;

/**
 CLCollectionViewDragDelegate自定义初始化
 
 @param viewModel CLCollectionViewViewModel
 @return self
 */
- (instancetype)initCollectionViewDragDelegateWithViewModel:(CLCollectionViewViewModel *)viewModel;

@end
