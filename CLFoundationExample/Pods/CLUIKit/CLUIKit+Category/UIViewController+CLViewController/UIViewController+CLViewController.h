//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIViewController+CLViewController.h
//
//  Created by Cain on 2016/12/1.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CLAlertControlAction)(UIAlertAction *action, NSUInteger index);

@protocol CLNavigationControllerBackItemProtocol <NSObject>
@optional

/**
 检测UIViewController的UINavigationController返回事件
 
 @return BOOL
 */
- (BOOL)cl_navigationShouldPopOnBackButton;

@end

@interface UIViewController (CLViewController) <CLNavigationControllerBackItemProtocol>

/**
 设置Modal转场动画时的UIViewController高度
 */
@property (assign, nonatomic) CGFloat cl_presentationViewHeight;

/**
 检测UIViewController的UINavigationController返回事件
 
 @return BOOL
 */
- (BOOL)cl_navigationShouldPopOnBackButton;

/**
 设置UINavigationBar是否透明
 
 @param bools BOOL
 */
- (void)cl_setNavigationBarTranslucentWithBOOL:(BOOL)bools;

/**
 设置UITabBar是否透明
 
 @param bools BOOL
 */
- (void)cl_setTabBarTranslucentWithBOOL:(BOOL)bools;

/**
 设置当前UIViewController的UINavigationBar是否可以右滑返回

 @param enabled BOOL
 */
- (void)cl_setNavigationBarInteractivePopGestureRecognizerWithEnabled:(BOOL)enabled;

#pragma mark - 呼叫手机
/**
 呼叫手机号
 
 @param phoneNumber NSString
 @param title NSString
 */
- (void)cl_callPhoneWithPhoneNumber:(NSString *)phoneNumber
                            message:(NSString *)message
                             titile:(NSString *)title;

#pragma mark - UIAlertController自定义
/**
 调用UIAlertController, UIAlertControllerStyleAlert样式
 
 @param title NSString
 @param message NSString
 */
- (void)cl_showAlertViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                                buttonTitle:(NSString *)buttonTitle;

/**
 调用UIAlertController, UIAlertControllerStyleActionSheet样式
 
 @param title NSString
 @param message NSString
 @param actionTitles NSArray<NSString *>
 @param complete UIAlertAction响应事件
 */
- (void)cl_showSheetViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                               actionTitles:(NSArray<NSString *> *)actionTitles
                                   complete:(CLAlertControlAction)complete;

/**
 调用UIAlertController, UIAlertControllerStyleAlert样式

 @param title NSString
 @param message NSString
 @param actionTitles NSArray<NSString *>
 @param complete UIAlertAction响应事件
 */
- (void)cl_showAlertViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                               actionTitles:(NSArray<NSString *> *)actionTitles
                                   complete:(CLAlertControlAction)complete;

/**
 自定义调用UIAlertController
 
 @param title NSString
 @param message NSString
 @param actions NSArray<NSString *>
 @param preferredStyle UIAlertControllerStyle
 */
- (void)cl_showAlertViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                                    actions:(NSArray<UIAlertAction *> *)actions
                             preferredStyle:(UIAlertControllerStyle)preferredStyle;

@end
