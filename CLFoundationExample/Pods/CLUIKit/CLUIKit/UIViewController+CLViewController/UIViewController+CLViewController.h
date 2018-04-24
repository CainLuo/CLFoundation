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

@protocol CLNavigationControllerBackItemProtocol <NSObject>
@optional

/**
 检测UIViewController的UINavigationController返回事件
 
 @return BOOL
 */
- (BOOL)cl_navigationShouldPopOnBackButton;

@end

@interface UIViewController (CLViewController) <CLNavigationControllerBackItemProtocol>

@property (nonatomic, strong) UIAlertController *cl_alertController;

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

/**
 呼叫手机号
 
 @param phoneNumber 输入对应的手机号
 @param title 标题语
 */
- (void)cl_callPhoneWithPhoneNumber:(NSString *)phoneNumber
                            message:(NSString *)message
                             titile:(NSString *)title;

/**
 调用UIAlertController, UIAlertControllerStyleAlert样式
 
 @param title 标题语
 @param message 提示信息
 */
- (void)cl_showAlertViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                                buttonTitle:(NSString *)buttonTitle;

/**
 调用UIAlertController, UIAlertControllerStyleActionSheet样式
 
 @param title 标题语
 @param message 提示信息
 @param actionTitles NSString数组
 @param handler UIAlertActiod响应事件
 */
- (void)cl_showSheetViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                               actionTitles:(NSArray<NSString *> *)actionTitles
                                    handler:(void (^)(UIAlertAction *action, NSUInteger index))handler;

/**
 自定义调用UIAlertController
 
 @param title 标题语
 @param message 提示信息
 @param actions UIAlertAction数组
 @param preferredStyle UIAlertControllerStyle
 */
- (void)cl_showAlertViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                                    actions:(NSArray<UIAlertAction *> *) actions
                             preferredStyle:(UIAlertControllerStyle)preferredStyle;


@end
