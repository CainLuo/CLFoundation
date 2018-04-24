//
//  UIScrollView+CLScrollView.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/3/27.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (CLScrollView)

/**
 移动到UIScrollView的最顶端

 @param animated BOOL
 */
- (void)cl_scrollViewToTopWithAnimated:(BOOL)animated;

/**
 移动到UIScrollView的最左边
 
 @param animated BOOL
 */
- (void)cl_scrollViewToLeftWithAnimated:(BOOL)animated;

/**
 移动到UIScrollView的最底端
 
 @param animated BOOL
 */
- (void)cl_scrollViewToBottomWithAnimated:(BOOL)animated;

/**
 移动到UIScrollView的最右边
 
 @param animated BOOL
 */
- (void)cl_scrollViewToRightWithAnimated:(BOOL)animated;

@end
