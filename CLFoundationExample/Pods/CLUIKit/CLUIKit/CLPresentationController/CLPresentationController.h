//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLPresentationController.h
//  UIPresentationController
//
//  Created by Cain Luo on 2018/6/24.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CLPresentationViewStyle) {
    
    CLPresentationViewStyleNormal = 0,
    CLPresentationViewStyleBluf
};

@interface CLPresentationController : UIPresentationController

/**
 需要展示内容的高度
 */
@property (nonatomic, assign) CGFloat cl_presentationViewHeight;

/**
 动画时间
 */
@property (nonatomic, assign) CGFloat cl_animationDuration;

/**
 是否需要UITapGestureRecognizer手势, 默认为YES
 */
@property (nonatomic, assign) BOOL cl_isNeedTapGestureRecognizer;

/**
 设置背景颜色, 只在CLPresentationViewStyleBluf样式下有效, 默认为[[UIColor blackColor] colorWithAlphaComponent:0.5]
 */
@property (nonatomic, strong) UIColor *cl_backgroundColor;

/**
 设置CLPresentationController的样式, 默认为CLPresentationViewStyleNormal
 */
@property (nonatomic, assign) CLPresentationViewStyle cl_presentationViewStyle;

/**
 设置UIBlurEffectStyle, 只在CLPresentationViewStyleBluf样式下有效
 */
@property (nonatomic, assign) UIBlurEffectStyle cl_blurEffectStyle;

@end
