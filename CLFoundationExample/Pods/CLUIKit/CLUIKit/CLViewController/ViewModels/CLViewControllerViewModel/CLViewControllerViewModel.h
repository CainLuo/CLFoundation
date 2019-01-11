//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLViewControllerViewModel.h
//  SimpleProject
//
//  Created by Cain on 2017/8/29.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLViewController.h"

@interface CLViewControllerViewModel : NSObject

/**
 只读的CLViewController
 */
@property (nonatomic, weak, readonly) CLViewController *cl_viewController;

/**
 初始化CLViewControllerViewModel

 @param controller CLViewController
 @return self
 */
- (instancetype)initViewControllerViewModelWithController:(CLViewController *)controller;

@end
