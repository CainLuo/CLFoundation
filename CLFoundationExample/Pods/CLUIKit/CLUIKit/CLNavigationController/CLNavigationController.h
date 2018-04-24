//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLNavigationController.h
//
//  Created by Cain on 2017/7/12.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLNavigationController : UINavigationController

/**
 设置UINavigationBar的背景图
 */
@property (nonatomic, strong) UIImage *cl_backgroundImage;

/**
 设置UINavigationBar的Tint Color
 */
@property (nonatomic, strong) UIColor *cl_tintColor;

/**
 设置UINavigationBar的Foreground Color
 */
@property (nonatomic, strong) UIColor *cl_foregroundColor;

/**
 设置UINavigationBar的Shadow Image
 */
@property (nonatomic, strong) UIImage *cl_shadowImage;

@end
