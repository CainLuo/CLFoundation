//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLViewControllerTransitioningDelegate.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/6/26.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLViewControllerViewModel.h"

@interface CLViewControllerTransitioningDelegate : NSObject <UIViewControllerTransitioningDelegate>

/**
 只读的CLViewControllerViewModel
 */
@property (nonatomic, weak, readonly) CLViewController *cl_controller;

/**
 初始化CLViewControllerTransitioningDelegate

 @param controller CLViewController
 @return CLViewControllerTransitioningDelegate
 */
- (instancetype)initViewControllerTransitioningDelegateWithController:(CLViewController *)controller;

@end
