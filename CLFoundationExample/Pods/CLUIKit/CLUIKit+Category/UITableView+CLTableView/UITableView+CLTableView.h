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

typedef void(^CLTableViewUpdateBlock)(UITableView *tableView);

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

#pragma mark - 刷新UITableView
/**
 刷新UITableView

 @param complete CLTableViewUpdateBlock
 */
- (void)cl_updateTableViewWithComplete:(CLTableViewUpdateBlock)complete;

#pragma mark - 操作UITableViewCell
/**
 滑动到屏幕显示的NSIndexPath

 @param indexPath NSIndexPath, 可为nil
 @param scrollPosition UITableViewScrollPosition
 @param animated BOOL
 */
- (void)cl_scrollToIndexPath:(NSIndexPath *)indexPath
              scrollPosition:(UITableViewScrollPosition)scrollPosition
                    animated:(BOOL)animated;

/**
 滑动到屏幕显示的Row, Section

 @param row NSUInteger
 @param section NSUInteger
 @param scrollPosition UITableViewScrollPosition
 @param animated BOOL
 */
- (void)cl_scrollToRow:(NSUInteger)row
               section:(NSUInteger)section
        scrollPosition:(UITableViewScrollPosition)scrollPosition
              animated:(BOOL)animated;

#pragma mark - UITableView 插入操作
/**
 将指定的NSIndexPath插入UITableView

 @param indexPath NSIndexPath
 @param animation UITableViewRowAnimation
 */
- (void)cl_insertRowWithIndexPath:(NSIndexPath *)indexPath
                        animation:(UITableViewRowAnimation)animation;

/**
 将指定的Section插入UITableView

 @param section NSUInteger
 @param animation UITableViewRowAnimation
 */
- (void)cl_insertWithSection:(NSUInteger)section
                   animation:(UITableViewRowAnimation)animation;

/**
 将指定的Row和Section插入到UITableView

 @param row NSUInteger
 @param section NSUInteger
 @param animation UITableViewRowAnimation
 */
- (void)cl_insertWithRow:(NSUInteger)row
                 section:(NSUInteger)section
               animation:(UITableViewRowAnimation)animation;

#pragma mark - UITableView 刷新操作
/**
 刷新指定的NSIndexPath

 @param indexPath NSIndexPath
 @param animation UITableViewRowAnimation
 */
- (void)cl_reloadRowWithIndexPath:(NSIndexPath *)indexPath
                        animation:(UITableViewRowAnimation)animation;

/**
 刷新指定的Section

 @param section NSUInteger
 @param animation UITableViewRowAnimation
 */
- (void)cl_reloadWithSection:(NSUInteger)section
                   animation:(UITableViewRowAnimation)animation;

/**
 刷新指定的Row和Section

 @param row NSUInteger
 @param section NSUInteger
 @param animation UITableViewRowAnimation
 */
- (void)cl_reloadWithRow:(NSUInteger)row
                 section:(NSUInteger)section
               animation:(UITableViewRowAnimation)animation;

#pragma mark - UITableView 删除操作
/**
 删除UITableView指定的NSIndexPath

 @param indexPath NSIndexPath
 @param animation UITableViewRowAnimation
 */
- (void)cl_deleteRowWithIndexPath:(NSIndexPath *)indexPath
                        animation:(UITableViewRowAnimation)animation;

/**
 删除指定的Section

 @param section NSUInteger
 @param animation UITableViewRowAnimation
 */
- (void)cl_deleteWithSection:(NSUInteger)section
                   animation:(UITableViewRowAnimation)animation;

/**
 删除指定的Row和Section

 @param row NSUInteger
 @param section NSUInteger
 @param animation UITableViewRowAnimation
 */
- (void)cl_deleteWithRow:(NSUInteger)row
                 section:(NSUInteger)section
               animation:(UITableViewRowAnimation)animation;

/**
 清理所有UITableViewCell被选中的状态

 @param animated BOOL
 */
- (void)cl_resetSelectedRowsAnimated:(BOOL)animated;

@end

