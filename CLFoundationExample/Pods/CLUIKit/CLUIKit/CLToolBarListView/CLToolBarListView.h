//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLToolBarListView.h
//
//  Created by Cain on 22/7/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CLToolBarStyle) {
    CLToolBarNormalStyle = 0,
    CLToolBarSeparationStyle
};

NS_ASSUME_NONNULL_BEGIN
@interface CLToolBarListView : UIView

/**
 初始化TooBar

 @param frame 设置CLToolBarListView的Frame
 @return self
 */
- (instancetype)initToolBarWithFrame:(CGRect)frame;

/**
 设置ToolBar显示的样式, default: CLToolBarNormalStyle
 */
@property (nonatomic, assign) CLToolBarStyle cl_toolBarStyle;

#pragma mark - Common Property
/**
 是否根据按钮宽度自动缩小标题, default: NO
 */
@property (nonatomic, assign) BOOL cl_titleAdjustsFontSizeToFitWidth;

/**
 标题数组, 在调用reloadData之前不可为空
 */
@property (nonatomic, strong) NSArray  *cl_titleArray;

/**
 选中的按钮文字的颜色, default: redColor
 */
@property (nonatomic, strong) UIColor *cl_selectedColor;

/**
 非选中的按钮文字的颜色, default: blackColor
 */
@property (nonatomic, strong) UIColor *cl_deselectColor;

/**
 背景颜色, default: whiteColor
 */
@property (nonatomic, strong) UIColor *cl_barBakcgroundColor;

/**
 底部线条的颜色, default: grayColor
 */
@property (nonatomic, strong) UIColor *cl_bottomLineColor;

/**
 选中按钮提示条的颜色, default: cyanColor
 */
@property (nonatomic, strong) UIColor *cl_selectedLineColor;

/**
 按钮文字大小, default: 16
 */
@property (nonatomic, assign) NSInteger cl_textFont;

/**
 按钮之间的间距, default: 10
 */
@property (nonatomic, assign) CGFloat cl_buttonSpacing;

/**
 是否需要底部线, default: YES
 */
@property (nonatomic, assign) BOOL cl_isNeedLine;

/**
 是否需要选中提示条, default: YES
 */
@property (nonatomic, assign) BOOL cl_isNeedSelectedLine;

/**
 当前点击的cl_currentIndex, default: 0
 */
@property (nonatomic, getter=currentIndex) NSInteger cl_currentIndex;

#pragma mark - Tool Bar Separation Style Property
/**
 Separation分割线的颜色
 注意: 前提是你设置了cl_toolBarStyle为CLToolBarSeparationStyle才有效, 默认为grayColor
 */
@property (nonatomic, strong) UIColor *cl_separationColor;

/**
 Separation分割线的宽度
 注意: 前提是你设置了cl_toolBarStyle为CLToolBarSeparationStyle才有效, 默认为1
 */
@property (nonatomic, assign) CGFloat cl_separationWidth;

#pragma mark - Common Method
/**
 刷新整个列表
 */
- (void)cl_reloadData;

/**
 指定当前选中的Button Index, 注意: 使用该方法, 必须先得实现cl_reloadData的方法, 否则不生效
 @param index 指定当前选中的Button Index
 */
- (void)cl_didSelectedButton:(NSInteger)index;

/**
 点击事件Block
 */
@property (nonatomic, copy) void(^cl_toolBarSelectedBlock)(NSInteger index);

@end
NS_ASSUME_NONNULL_END
