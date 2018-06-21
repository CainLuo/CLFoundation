//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UITableView+CLTableView.m
//  SimpleProject
//
//  Created by Cain Luo on 2018/1/20.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "UITableView+CLTableView.h"
#import <objc/runtime.h>

static void *CLPlaceholderView = &CLPlaceholderView;

@implementation UITableView (CLTableView)

#pragma mark - CLPlaceholderView
- (void)setCl_placeholderView:(UIView *)cl_placeholderView {
    
    objc_setAssociatedObject(self, CLPlaceholderView, cl_placeholderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)cl_placeholderView {
    
    return objc_getAssociatedObject(self, CLPlaceholderView);
}

- (void)cl_removePlaceholderViewWithSuperView {
    
    [self.cl_placeholderView removeFromSuperview];
    
    self.cl_placeholderView = nil;
}

#pragma mark - TableView Reload Data
- (void)cl_reloadData {
    
    [self reloadData];
    
    [self cl_checkEmpty];
}

#pragma mark - Check Empty
- (void)cl_checkEmpty {
    
    BOOL cl_isEmpty = YES;
    
    id<UITableViewDataSource> cl_dataSource = self.dataSource;
    
    NSInteger cl_sections = 1;
    
    if ([cl_dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        
        cl_sections = [cl_dataSource numberOfSectionsInTableView:self];
    }
    
    for (int i = 0; i < cl_sections; ++i) {
        
        NSInteger rows = [cl_dataSource tableView:self
                            numberOfRowsInSection:i];
        
        if (rows) {
            
            cl_isEmpty = NO;
        }
    }
    
    if (!cl_isEmpty != !self.cl_placeholderView) {
        
        if (cl_isEmpty) {
            
            self.scrollEnabled = [self cl_responseScrollEnabledWithShowPlaceholderView];
            
            self.cl_placeholderView = [self cl_responseTableViewPlaceholderView];
            
            self.cl_placeholderView.frame = [self cl_responsePlaceholderViewFrame];
            
            [self addSubview:self.cl_placeholderView];
        } else {
            
            [self cl_removePlaceholderViewWithSuperView];
        }
        
    } else if (cl_isEmpty){
        
        self.scrollEnabled = [self cl_responseScrollEnabledWithShowPlaceholderView];
        
        [self.cl_placeholderView removeFromSuperview];
        
        [self addSubview:self.cl_placeholderView];
    }
}

#pragma mark - Response Delegate Method
- (UIView *)cl_responseTableViewPlaceholderView {
    
    if ([self.delegate respondsToSelector:@selector(cl_placeholderView)]) {
        
        return [self.delegate performSelector:@selector(cl_placeholderView)];
        
    } else if ([self respondsToSelector:@selector(cl_placeholderView)]) {
        
        return [self performSelector:@selector(cl_placeholderView)];
    } else {
        
        return nil;
    }
}

#pragma mark - Response Delegate Method
- (BOOL)cl_responseScrollEnabledWithShowPlaceholderView {
    
    if ([self.delegate respondsToSelector:@selector(cl_scrollEnabledWithShowPlaceholderView)]) {
        
        BOOL cl_scrollEnable = [[self.delegate performSelector:@selector(cl_scrollEnabledWithShowPlaceholderView)] boolValue];
        
        return cl_scrollEnable;
        
    } else if ([self respondsToSelector:@selector(cl_scrollEnabledWithShowPlaceholderView)]) {
        
        BOOL cl_scrollEnable = [[self performSelector:@selector(cl_scrollEnabledWithShowPlaceholderView)] boolValue];
        
        return cl_scrollEnable;
        
    } else {
        
        return YES;
    }
}

#pragma mark - Response Placeholder View Frame
- (CGRect)cl_responsePlaceholderViewFrame {
    
    BOOL cl_selfHeaderViewResponse     = [self respondsToSelector:@selector(cl_calculateTableViewHeaderViewFrame)];
    BOOL cl_delegateHeaderViewResponse = [self.delegate respondsToSelector:@selector(cl_calculateTableViewHeaderViewFrame)];
    
    BOOL cl_tableHeaderViewResponse = self.tableHeaderView && (cl_selfHeaderViewResponse || cl_delegateHeaderViewResponse);
    
    if (cl_tableHeaderViewResponse) {
        
        CGFloat cl_placeholderViewY = CGRectGetHeight(self.tableHeaderView.frame);
        CGFloat cl_placeholderViewHeight = self.frame.size.height - CGRectGetHeight(self.tableHeaderView.frame);
        
        CGRect cl_placeholderViewFrame = CGRectMake(0, cl_placeholderViewY, CGRectGetWidth(self.frame), cl_placeholderViewHeight);
        
        return cl_placeholderViewFrame;
        
    } else {
        
        return CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    }
}

#pragma mark - 刷新UITableView
- (void)cl_updateTableViewWithComplete:(CLTableViewUpdateBlock)complete {
    
    [self beginUpdates];
    
    if (complete) {
        complete(self);
    }
    
    [self endUpdates];
}

#pragma mark - 操作UITableViewCell
- (void)cl_scrollToIndexPath:(NSIndexPath *)indexPath
              scrollPosition:(UITableViewScrollPosition)scrollPosition
                    animated:(BOOL)animated {
    
    [self scrollToRowAtIndexPath:indexPath
                atScrollPosition:scrollPosition
                        animated:animated];
}

- (void)cl_scrollToRow:(NSUInteger)row
               section:(NSUInteger)section
        scrollPosition:(UITableViewScrollPosition)scrollPosition
              animated:(BOOL)animated {
    
    NSIndexPath *cl_indexPath = [NSIndexPath indexPathForRow:row
                                                   inSection:section];
    
    [self cl_scrollToIndexPath:cl_indexPath
                scrollPosition:scrollPosition
                      animated:animated];
}

#pragma mark - UITableView 插入操作
- (void)cl_insertRowWithIndexPath:(NSIndexPath *)indexPath
                        animation:(UITableViewRowAnimation)animation {
    
    [self insertRowsAtIndexPaths:@[indexPath]
                withRowAnimation:animation];
}

- (void)cl_insertWithSection:(NSUInteger)section
                   animation:(UITableViewRowAnimation)animation {
    
    NSIndexSet *cl_indexSet = [NSIndexSet indexSetWithIndex:section];

    [self insertSections:cl_indexSet
        withRowAnimation:animation];
}

- (void)cl_insertWithRow:(NSUInteger)row
                 section:(NSUInteger)section
               animation:(UITableViewRowAnimation)animation {
    
    NSIndexPath *cl_indexPath = [NSIndexPath indexPathForRow:row
                                                   inSection:section];
    
    [self cl_insertRowWithIndexPath:cl_indexPath
                          animation:animation];
}

#pragma mark - UITableView 刷新操作
- (void)cl_reloadRowWithIndexPath:(NSIndexPath *)indexPath
                        animation:(UITableViewRowAnimation)animation {
    
    [self reloadRowsAtIndexPaths:@[indexPath]
                withRowAnimation:animation];
}

- (void)cl_reloadWithSection:(NSUInteger)section
                   animation:(UITableViewRowAnimation)animation {
    
    NSIndexSet *cl_indexSet = [NSIndexSet indexSetWithIndex:section];

    [self reloadSections:cl_indexSet
        withRowAnimation:animation];
}

- (void)cl_reloadWithRow:(NSUInteger)row
                 section:(NSUInteger)section
               animation:(UITableViewRowAnimation)animation {
    
    NSIndexPath *cl_indexPath = [NSIndexPath indexPathForRow:row
                                                   inSection:section];
    
    [self cl_reloadRowWithIndexPath:cl_indexPath
                          animation:animation];
}

#pragma mark - UITableView 删除相关
- (void)cl_deleteRowWithIndexPath:(NSIndexPath *)indexPath
                        animation:(UITableViewRowAnimation)animation {
    
    [self deleteRowsAtIndexPaths:@[indexPath]
                withRowAnimation:animation];
}

- (void)cl_deleteWithSection:(NSUInteger)section
                   animation:(UITableViewRowAnimation)animation {
    
    NSIndexSet *cl_indexSet = [NSIndexSet indexSetWithIndex:section];
    
    [self deleteSections:cl_indexSet
        withRowAnimation:animation];
}

- (void)cl_deleteWithRow:(NSUInteger)row
                 section:(NSUInteger)section
               animation:(UITableViewRowAnimation)animation {
    
    NSIndexPath *cl_indexPath = [NSIndexPath indexPathForRow:row
                                                   inSection:section];
    
    [self cl_deleteRowWithIndexPath:cl_indexPath
                          animation:animation];
}

- (void)cl_resetSelectedRowsAnimated:(BOOL)animated {
    
    NSArray *cl_indexArray = [self indexPathsForSelectedRows];
    
    [cl_indexArray enumerateObjectsUsingBlock:^(NSIndexPath *indxPath, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [self deselectRowAtIndexPath:indxPath
                            animated:animated];
    }];
}

@end

