//
//  UINavigationController+CLNavigationController.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/3/27.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (CLNavigationController)

/**
 获取指定类名的UIViewController

 @param className NSString
 @return UIViewController
 */
- (UIViewController *)cl_findViewControllerWithClassName:(NSString *)className;

/**
 获取UIViewController的索引

 @param viewController UIViewController
 @return NSUInteger
 */
- (NSUInteger)cl_getIndexWithViewController:(UIViewController *)viewController;

/**
 获取UINavigationController的FirstViewController

 @return UIViewController
 */
- (UIViewController *)cl_getFirstViewController;

/**
 Pop到指定类名的UIViewController

 @param className NSString
 @return NSArray
 */
- (NSArray *)cl_popToViewControllerWithClassName:(NSString *)className
                                        animated:(BOOL)animated;

/**
 Pop到指定层级的UIViewController

 @param level NSUInteger
 @param animated BOOL
 @return NSArray
 */
- (NSArray *)cl_popToViewControllerWithLevel:(NSUInteger)level
                                    animated:(BOOL)animated;

@end
