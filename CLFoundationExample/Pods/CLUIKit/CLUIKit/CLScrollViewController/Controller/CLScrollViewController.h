//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLScrollViewController.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/4/28.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLViewController.h"

NS_ASSUME_NONNULL_BEGIN
@interface CLScrollViewController : CLViewController

/**
 获取UIScrollView, 只读
 */
@property (nonatomic, strong, readonly) UIScrollView *cl_scrollView;

/**
 设置UIScrollViewDelegate

 @param delegate id <UIScrollViewDelegate>
 */
- (void)cl_setScrollViewDelegate:(_Nullable id <UIScrollViewDelegate>)delegate;

/**
 隐藏ScrollView的Indicator
 */
- (void)cl_hiddenScrollIndicator;

@end
NS_ASSUME_NONNULL_END
