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
typedef NS_ENUM(NSInteger, CLViewControllerStyle) {
    
    CLMainViewController = 0, // Default
    CLChildViewController
};

@interface CLViewController : UIViewController

/**
 初始化CLViewController, 默认为CLMainViewController

 @param style CLViewControllerStyle
 @return self
 */
- (instancetype)initCLViewControllerWith:(CLViewControllerStyle)style;

@end
NS_ASSUME_NONNULL_END
