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
 检测UIViewController的UINavigationController返回事件
 
 @return BOOL
 */
- (BOOL)cl_navigationShouldPopOnBackButton;

/**
 设置NavigationBar的Translucent, 默认为YES, 如果为NO, 那么视图的Top会紧挨UINavigationBar的底部, 但前提automaticallyAdjustsScrollViewInsets要为YES
 
 @param bools BOOL
 */
- (void)cl_setNavigationBarTranslucentWithBOOL:(BOOL)bools;

/**
 设置TabBar的Translucent, 默认为YES, 如果为NO, 那么视图的Bottom会和屏幕底部紧挨, 但前提automaticallyAdjustsScrollViewInsets要为YES
 
 @param bools BOOL
 */
- (void)cl_setTabBarTranslucentWithBOOL:(BOOL)bools;

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
