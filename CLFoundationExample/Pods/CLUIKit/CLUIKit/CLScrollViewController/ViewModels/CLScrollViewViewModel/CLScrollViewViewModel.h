//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLScrollViewViewModel.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/4/28.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CLScrollViewController.h"

@interface CLScrollViewViewModel : NSObject

/**
 只读的CLScrollViewController
 */
@property (nonatomic, weak, readonly) CLScrollViewController *cl_scrollViewController;

/**
 初始化CLScrollViewViewModel

 @param controller CLScrollViewController
 @return self CLScrollViewViewModel
 */
- (instancetype)initScrollViewDelegateWithController:(CLScrollViewController *)controller;

@end
