//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UICollectionView+CLCollectionView.m
//  SimpleProject
//
//  Created by Cain Luo on 2018/1/21.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "UICollectionView+CLCollectionView.h"
#import "UIColor+CLColor.h"
#import <objc/runtime.h>

static void *CLPlaceholderView = &CLPlaceholderView;

@implementation UICollectionView (CLCollectionView)

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

- (void)cl_reloadData {
    
    [self reloadData];
    
    [self cl_checkEmpty];
}

#pragma mark - Check Empty
- (void)cl_checkEmpty {
    
    BOOL cl_isEmpty = YES;
    
    id<UICollectionViewDataSource> cl_dataSource = self.dataSource;
    
    NSInteger cl_sections = 1;
    
    if ([cl_dataSource respondsToSelector:@selector(numberOfSectionsInCollectionView:)]) {
        
        cl_sections = [cl_dataSource numberOfSectionsInCollectionView:self];
    }
    
    for (int i = 0; i < cl_sections; ++i) {
        
        NSInteger rows = [cl_dataSource collectionView:self
                                numberOfItemsInSection:i];
        
        if (rows) {
            
            cl_isEmpty = NO;
        }
    }
    
    if (!cl_isEmpty != !self.cl_placeholderView) {
        
        if (cl_isEmpty) {
            
            self.scrollEnabled = [self cl_responseScrollEnabledWithShowPlaceholderView];
            
            self.cl_placeholderView = [self cl_responseCollectionViewPlaceholderView];
            
            self.cl_placeholderView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
            
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
- (UIView *)cl_responseCollectionViewPlaceholderView {
    
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
        
        BOOL cl_scrollEnable = [[self.delegate performSelector:@selector(cl_scrollEnabledWithShowPlaceholderView)] boolValue];

        return cl_scrollEnable;
        
    } else {
        
        return YES;
    }
}

@end
