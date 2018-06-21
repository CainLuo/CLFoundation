//
//  UIScrollView+CLScrollView.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/3/27.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "UIScrollView+CLScrollView.h"

@implementation UIScrollView (CLScrollView)

- (void)cl_scrollViewToTopWithAnimated:(BOOL)animated {
    
    [self setContentOffset:CGPointMake(0, 0)
                  animated:animated];
}

- (void)cl_scrollViewToLeftWithAnimated:(BOOL)animated {
    
    [self setContentOffset:CGPointMake(0, self.contentInset.left)
                  animated:animated];
}

- (void)cl_scrollViewToBottomWithAnimated:(BOOL)animated {
    
    CGFloat cl_scrollViewBottom = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom;

    [self setContentOffset:CGPointMake(0, cl_scrollViewBottom)
                  animated:animated];
}

- (void)cl_scrollViewToRightWithAnimated:(BOOL)animated {
    
    CGFloat cl_scrollViewRight = self.contentSize.width - self.bounds.size.width + self.contentInset.right;
    
    [self setContentOffset:CGPointMake(0, cl_scrollViewRight)
                  animated:animated];
}

@end
