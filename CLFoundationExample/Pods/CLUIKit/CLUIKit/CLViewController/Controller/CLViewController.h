//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLViewController.h
//
//  Created by Cain on 2017/7/12.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, CLViewControllerType) {
    
    CLViewControllerTypeMain = 0, // Default
    CLViewControllerTypeChild
};

@interface CLViewController : UIViewController

/**
 初始化CLViewController, 默认为CLViewControllerTypeMain

 @param type CLViewControllerStyle
 @return self
 */
- (instancetype)initViewControllerWithType:(CLViewControllerType)type;

/**
 初始化CLViewController, 并输入指定的UIViewControllerTransitioningDelegate代理

 @param delegate id<UIViewControllerTransitioningDelegate>
 @return CLViewController
 */
- (instancetype)initViewControllerWithTransitioningDelegate:(id<UIViewControllerTransitioningDelegate>)delegate;

@end
NS_ASSUME_NONNULL_END
