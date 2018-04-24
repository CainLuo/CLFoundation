//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLNavigationController.m
//
//  Created by Cain on 2017/7/12.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "CLNavigationController.h"

@interface CLNavigationController ()

@end

@implementation CLNavigationController

- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController
                     animated:animated];
}

- (void)setCl_backgroundImage:(UIImage *)cl_backgroundImage {
    
    _cl_backgroundImage = cl_backgroundImage;
    
    [self.navigationBar setBackgroundImage:cl_backgroundImage
                             forBarMetrics:UIBarMetricsDefault];
}

- (void)setCl_tintColor:(UIColor *)cl_tintColor {
    
    _cl_tintColor = cl_tintColor;
    
    [self.navigationBar setTintColor:cl_tintColor];
}

- (void)setCl_foregroundColor:(UIColor *)cl_foregroundColor {
    
    _cl_foregroundColor = cl_foregroundColor;
    
    NSDictionary *cl_dictionary = @{NSForegroundColorAttributeName : cl_foregroundColor};
    
    [self.navigationBar setTitleTextAttributes:cl_dictionary];
}

- (void)setCl_shadowImage:(UIImage *)cl_shadowImage {
    
    _cl_shadowImage = cl_shadowImage;
    
    [self.navigationBar setShadowImage:cl_shadowImage];
}

@end
