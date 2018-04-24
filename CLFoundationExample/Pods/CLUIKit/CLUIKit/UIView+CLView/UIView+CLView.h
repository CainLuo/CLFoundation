//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIView+CLView.h
//  ShareHotel
//
//  Created by Mac on 2017/12/8.
//  Copyright © 2017年 EStrongersoft Co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CLGestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (CLView)

@property (nonatomic, assign) CGSize cl_size;

@property (nonatomic, assign) CGFloat cl_width;
@property (nonatomic, assign) CGFloat cl_height;
@property (nonatomic, assign) CGFloat cl_top;
@property (nonatomic, assign) CGFloat cl_left;
@property (nonatomic, assign) CGFloat cl_bottom;
@property (nonatomic, assign) CGFloat cl_right;
@property (nonatomic, assign) CGFloat cl_centerX;
@property (nonatomic, assign) CGFloat cl_centerY;

/**
 添加UITapGestureRecognizer手势

 @param block CLGestureActionBlock
 */
- (void)cl_addTapGestureRecognizerWithBlock:(CLGestureActionBlock)block;

/**
 添加UILongPressGestureRecognizer手势

 @param block CLGestureActionBlock
 */
- (void)cl_addLongPressGestureRecognizerWithBlock:(CLGestureActionBlock)block;

/**
 获取指定类名的SubView

 @param objcClass Class
 @return id
 */
- (id)cl_getSubViewWithSubViewClass:(Class)objcClass;

/**
 获取指定类名SuperView

 @param objcClass Class
 @return id
 */
- (id)cl_getSuperViewWithSuperViewClass:(Class)objcClass;

/**
 取消第一响应者事件

 @return BOOL
 */
- (BOOL)cl_resignFirstResponder;

/**
 获取第一响应者视UIView

 @return UIView
 */
- (UIView *)cl_getFirstResponder;

@end
