//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UITableView+CLTableView.h
//  SimpleProject
//
//  Created by Cain Luo on 2018/1/20.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CLTableViewPlaceholderDelegate <NSObject>

@required

/**
 设置一个UITableView占位图
 
 @return UIView
 */
- (UIView *)cl_placeholderView;

@optional

/**
 是否要计算UITableViewHeaderView的Frame
 
 @return BOOL
 */
- (BOOL)cl_calculateTableViewHeaderViewFrame;

/**
 出现占位图的时候是否允许滑动
 
 @return BOOL
 */
- (BOOL)cl_scrollEnabledWithShowPlaceholderView;

@end

@interface UITableView (CLTableView)

/**
 刷新并加载占位图
 */
- (void)cl_reloadData;

/**
 删除占位图
 */
- (void)cl_removePlaceholderViewWithSuperView;

@end

