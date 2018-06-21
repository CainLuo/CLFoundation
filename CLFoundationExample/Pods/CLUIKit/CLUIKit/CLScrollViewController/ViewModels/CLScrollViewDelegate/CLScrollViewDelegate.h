//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLScrollViewDelegate.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/4/28.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLScrollViewViewModel.h"

@interface CLScrollViewDelegate : NSObject <UIScrollViewDelegate>

/**
 只读的CLScrollViewViewModel
 */
@property (nonatomic, weak, readonly) CLScrollViewViewModel *cl_scrollViewViewModel;

/**
 初始化CLScrollViewDelegate

 @param viewModel CLScrollViewViewModel
 @return self CLScrollViewDelegate
 */
- (instancetype)initScrollViewDelegateWithViewModel:(CLScrollViewViewModel *)viewModel;

@end
