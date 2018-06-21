//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIButton+CLButton.h
//
//  Created by Cain on 2017/7/12.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UIButton倒计时的状态

 - CLButtonStarStyleBegin: 开始倒计时
 - CLButtonStarStyleFinish: 倒计时完成
 */
typedef NS_ENUM(NSInteger, CLButtonStarStyle) {
    CLButtonStarStyleBegin = 0,
    CLButtonStarStyleFinish
};

/**
 UIButton倒计时的回调

 @param cl_starButton UIButton
 @param cl_buttonStarStyle CLButtonStarStyle
 @param time NSInteger
 */
typedef void(^CLButtonStar)(UIButton *cl_starButton, CLButtonStarStyle cl_buttonStarStyle, NSInteger time);

/**
 UIButton的事件回调

 @param sender UIButton
 */
typedef void (^CLButtonAction)(UIButton *sender);

@interface UIButton (CLButton)

/**
 设置Button的点击区域
 */
@property (nonatomic, assign) UIEdgeInsets cl_clickAreaEdgeInsets;

/**
 按钮是否正在提交中
 */
@property (nonatomic, assign, readonly) BOOL cl_isSubmitting;

#pragma mark - 倒计时方法
/**
 倒计时方法

 @param time 倒计时时间
 @param complete 倒计时的回调
 */
- (void)cl_starButtonWithTime:(NSInteger)time
                     complete:(CLButtonStar)complete;

#pragma mark - 添加UIButton点击方法
/**
 给UIButton添加一个Action Block

 @param complete CLButtonAction
 */
- (void)cl_addButtonActionComplete:(CLButtonAction)complete;

#pragma mark - 用UIActivityIndicatorView代替文字
/**
 显示UIActivityIndicatorView
 */
- (void)cl_showActivityIndicatorViewWithStyle:(UIActivityIndicatorViewStyle)style;

/**
 隐藏UIActivityIndicatorView
 */
- (void)cl_hideActivityIndicatorView;

#pragma mark - 设置UIButton图片
/**
 设置UIButton Normal状态下的图片

 @param image UIImage
 */
- (void)cl_setNormalButtonWithImage:(UIImage *)image;

/**
 设置UIButton Normal状态下的纯色图片

 @param color UIColor
 */
- (void)cl_setNormalButtonImageWithColor:(UIColor *)color;

/**
 设置UIButton Highlighted状态下的图片
 
 @param image UIImage
 */
- (void)cl_setHighlightedButtonWithImage:(UIImage *)image;

/**
 设置UIButton Highlighted状态下的纯色图片
 
 @param color UIColor
 */
- (void)cl_setHighlightedButtonImageWithColor:(UIColor *)color;

/**
 设置UIButton Selected状态下的图片
 
 @param image UIImage
 */
- (void)cl_setSelectedButtonWithImage:(UIImage *)image;

/**
 设置UIButton Selected状态下的纯色图片
 
 @param color UIColor
 */
- (void)cl_setSelectedButtonImageWithColor:(UIColor *)color;

/**
 设置UIButton Disabled状态下的图片
 
 @param image UIImage
 */
- (void)cl_setDisabledButtonWithImage:(UIImage *)image;

/**
 设置UIButton Disabled状态下的纯色图片
 
 @param color UIColor
 */
- (void)cl_setDisabledButtonImageWithColor:(UIColor *)color;

#pragma mark - 设置UIButton背景图片
/**
 设置UIButton Normal状态下的背景图片
 
 @param image UIImage
 */
- (void)cl_setNormalButtonBackgroundImageWithImage:(UIImage *)image;

/**
 设置UIButton Normal状态下的背景纯色图片
 
 @param color UIColor
 */
- (void)cl_setNormalButtonBackgroundImageWithColor:(UIColor *)color;

/**
 设置UIButton Highlighted状态下的背景图片
 
 @param image UIImage
 */
- (void)cl_setHighlightedButtonBackgroundImageWithImage:(UIImage *)image;

/**
 设置UIButton Highlighted状态下的背景纯色图片
 
 @param color UIColor
 */
- (void)cl_setHighlightedButtonBackgroundImageWithColor:(UIColor *)color;

/**
 设置UIButton Selected状态下的背景图片
 
 @param image UIImage
 */
- (void)cl_setSelectedButtonBackgroundImageWithImage:(UIImage *)image;

/**
 设置UIButton Selected状态下的背景纯色图片
 
 @param color UIColor
 */
- (void)cl_setSelectedButtonBackgroundImageWithColor:(UIColor *)color;

/**
 设置UIButton Disabled状态下的背景图片
 
 @param image UIImage
 */
- (void)cl_setDisabledButtonBackgroundImageWithImage:(UIImage *)image;

/**
 设置UIButton Disabled状态下的背景纯色图片

 @param color UIColor
 */
- (void)cl_setDisabledButtonBackgroundImageWithColor:(UIColor *)color;

#pragma mark - 获取UIButton的图片
/**
 获取UIButton Normal状态下的图片

 @return UIImage
 */
- (UIImage *)cl_getNormalButtonImage;

/**
 获取UIButton Highlighted状态下的图片
 
 @return UIImage
 */
- (UIImage *)cl_getHighlightedButtonImage;

/**
 获取UIButton Selected状态下的图片
 
 @return UIImage
 */
- (UIImage *)cl_getSelectedButtonImage;

/**
 获取UIButton Disabled状态下的图片
 
 @return UIImage
 */
- (UIImage *)cl_getDisabledButtonImage;

#pragma mark - 获取UIButton的背景图片
/**
 获取UIButton Normal状态下的背景图片

 @return UIImage
 */
- (UIImage *)cl_getNormalButtonBackgroundImage;

/**
 获取UIButton Highlighted状态下的背景图片
 
 @return UIImage
 */
- (UIImage *)cl_getHighlightedButtonBackgroundImage;

/**
 获取UIButton Selected状态下的背景图片
 
 @return UIImage
 */
- (UIImage *)cl_getSelectedButtonBackgroundImage;

/**
 获取UIButton Disabled状态下的背景图片
 
 @return UIImage
 */
- (UIImage *)cl_getDisabledButtonBackgroundImage;

#pragma mark - 设置UIButton标题
/**
 设置UIButton Normal状态下的标题
 
 @param title NSString
 */
- (void)cl_setNormalButtonWithTitle:(NSString *)title;

/**
 设置UIButton Highlighted状态下的标题
 
 @param title NSString
 */
- (void)cl_setHighlightedButtonWithTitle:(NSString *)title;

/**
 设置UIButton Selected状态下的标题
 
 @param title NSString
 */
- (void)cl_setSelectedButtonWithTitle:(NSString *)title;

/**
 设置UIButton Disabled状态下的标题
 
 @param title NSString
 */
- (void)cl_setDisabledButtonWithTitle:(NSString *)title;

#pragma mark - 获取UIButton标题
/**
 获取UIButton Normal状态下的标题
 
 @return NSString
 */
- (NSString *)cl_getNormalButtonTitle;

/**
 获取UIButton Highlighted状态下的标题
 
 @return NSString
 */
- (NSString *)cl_getHighlightedButtonTitle;

/**
 获取UIButton Selected状态下的标题
 
 @return NSString
 */
- (NSString *)cl_getSelectedButtonTitle;

/**
 获取UIButton Disabled状态下的标题
 
 @return NSString
 */
- (NSString *)cl_getDisabledButtonTitle;

#pragma mark - 设置UIButton标题
/**
 设置UIButton Normal状态下的标题颜色
 
 @param color UIColor
 */
- (void)cl_setNormalTitleWithColor:(UIColor *)color;

/**
 设置UIButton Highlighted状态下的标题颜色
 
 @param color UIColor
 */
- (void)cl_setHighlightedTitleWithColor:(UIColor *)color;

/**
 设置UIButton Selected状态下的标题颜色
 
 @param color UIColor
 */
- (void)cl_setSelectedTitleWithColor:(UIColor *)color;

/**
 设置UIButton Disabled状态下的标题颜色
 
 @param color UIColor
 */
- (void)cl_setDisabledTitleWithColor:(UIColor *)color;

#pragma mark - 获取UIButton标题颜色
/**
 获取UIButton Normal状态下的标题颜色
 
 @return UIColor
 */
- (UIColor *)cl_getNormalButtonTitleColor;

/**
 获取UIButton Highlighted状态下的标题颜色
 
 @return UIColor
 */
- (UIColor *)cl_getHighlightedButtonTitleColor;

/**
 获取UIButton Selected状态下的标题颜色
 
 @return UIColor
 */
- (UIColor *)cl_getSelectedButtonTitleColor;

/**
 获取UIButton Disabled状态下的标题颜色
 
 @return UIColor
 */
- (UIColor *)cl_getDisabledButtonTitleColor;

#pragma mark - 设置UIButton的NSAttributedString标题
/**
 设置UIButton Normal状态下的NSAttributedString标题

 @param attributedString NSAttributedString
 */
- (void)cl_setNormalButtonWithAttributedStringTitle:(NSAttributedString *)attributedString;

/**
 设置UIButton Highlighted状态下的NSAttributedString标题
 
 @param attributedString NSAttributedString
 */
- (void)cl_setHighlightedButtonWithAttributedStringTitle:(NSAttributedString *)attributedString;

/**
 设置UIButton Selected状态下的NSAttributedString标题
 
 @param attributedString NSAttributedString
 */
- (void)cl_setSelectedButtonWithAttributedStringTitle:(NSAttributedString *)attributedString;

/**
 设置UIButton Disabled状态下的NSAttributedString标题
 
 @param attributedString NSAttributedString
 */
- (void)cl_setDisabledButtonWithAttributedStringTitle:(NSAttributedString *)attributedString;

#pragma mark - 获取UIButton标题
/**
 获取UIButton Normal状态下的NSAttributedString标题
 
 @return NSAttributedString
 */
- (NSAttributedString *)cl_getNormalButtonAttributedStringTitle;

/**
 获取UIButton Highlighted状态下的NSAttributedString标题
 
 @return NSAttributedString
 */
- (NSAttributedString *)cl_getHighlightedButtonAttributedStringTitle;

/**
 获取UIButton Selected状态下的NSAttributedString标题
 
 @return NSAttributedString
 */
- (NSAttributedString *)cl_getSelectedButtonAttributedStringTitle;

/**
 获取UIButton Disabled状态下的NSAttributedString标题
 
 @return NSAttributedString
 */
- (NSAttributedString *)cl_getDisabledButtonAttributedStringTitle;

@end
