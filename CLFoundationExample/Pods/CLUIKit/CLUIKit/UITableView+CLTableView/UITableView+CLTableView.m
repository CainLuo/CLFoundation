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

@end

