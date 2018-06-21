//
//  UINavigationController+CLNavigationController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/3/27.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "UINavigationController+CLNavigationController.h"
#import "NSArray+CLArray.h"

@implementation UINavigationController (CLNavigationController)

- (UIViewController *)cl_findViewControllerWithClassName:(NSString *)className {
    
    UIViewController *__block cl_viewController;
    
    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj isKindOfClass:NSClassFromString(className)]) {
            
            cl_viewController = obj;
        }
    }];
    
    return cl_viewController;
}

- (NSUInteger)cl_getIndexWithViewController:(UIViewController *)viewController {
    
    return [self.viewControllers cl_safeIndexOfObject:viewController];
}

- (UIViewController *)cl_getFirstViewController {
    
    return [self.viewControllers cl_safeObjectAtIndex:0];
}

- (NSArray *)cl_popToViewControllerWithClassName:(NSString *)className
                                        animated:(BOOL)animated {
    
    return [self popToViewController:[self cl_findViewControllerWithClassName:className]
                            animated:animated];
}

- (NSArray *)cl_popToViewControllerWithLevel:(NSUInteger)level
                                    animated:(BOOL)animated {
    
    if (level == 0 || self.viewControllers.count < level) {
        
        return [self popToRootViewControllerAnimated:animated];
        
    } else {
        
        NSUInteger cl_index = self.viewControllers.count - level - 1;
        
        UIViewController *cl_viewController = self.viewControllers[cl_index];
        
        return [self popToViewController:cl_viewController
                                animated:animated];
    }
}

#pragma mark - 获取UINavigationBar的高度
- (CGFloat)cl_getNavigationBarHeight {
    
    return CGRectGetHeight(self.navigationBar.frame);
}

@end
