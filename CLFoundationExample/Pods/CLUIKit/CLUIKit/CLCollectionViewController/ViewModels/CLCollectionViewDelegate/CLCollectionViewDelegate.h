//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLCollectionViewDelegate.h
//
//  Created by Cain on 2016/12/1.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CLCollectionViewViewModel.h"

@interface CLCollectionViewDelegate : NSObject <UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

/**
 只读的CLCollectionViewViewModel
 */
@property (nonatomic, weak, readonly) CLCollectionViewViewModel *cl_viewModel;

/**
 CLCollectionViewViewModel自定义初始化
 
 @param viewModel CLCollectionViewViewModel
 @return self
 */
- (instancetype)initCollectionViewDelegateWithViewModel:(CLCollectionViewViewModel *)viewModel;

@end
