//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIViewController+CLViewController.m
//
//  Created by Cain on 2016/12/1.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "UIViewController+CLViewController.h"
#import <objc/runtime.h>

#import "UIApplication+CLApplication.h"

static void *AlertControllerKey = &AlertControllerKey;

@implementation UIViewController (CLViewController)

- (void)cl_setNavigationBarTranslucentWithBOOL:(BOOL)bools {
    self.navigationController.navigationBar.translucent = bools;
}

- (void)cl_setTabBarTranslucentWithBOOL:(BOOL)bools {
    self.tabBarController.tabBar.translucent = bools;
}

#pragma mark - AlertController
- (void)setCl_alertController:(UIAlertController *)cl_alertController {
    
    objc_setAssociatedObject(self, AlertControllerKey, cl_alertController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIAlertController *)cl_alertController {
    
    return objc_getAssociatedObject(self, AlertControllerKey);
}

- (void)cl_callPhoneWithPhoneNumber:(NSString *)phoneNumber
                            message:(NSString *)message
                             titile:(NSString *)title {
        
    UIAlertAction *cl_cancelAction = [UIAlertAction actionWithTitle:@"取消"
                                                              style:UIAlertActionStyleCancel
                                                            handler:^(UIAlertAction *action) {}];
    
    UIAlertAction *cl_otherAction = [UIAlertAction actionWithTitle:@"呼叫"
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction *action) {
                                                               
                                                               [UIApplication cl_callPhoneWithPhoneNumber:phoneNumber];
                                                           }];
    
    [self cl_showAlertViewControllerWithTitle:title
                                      message:[NSString stringWithFormat:@"%@%@", message, phoneNumber]
                                      actions:@[cl_cancelAction, cl_otherAction]
                               preferredStyle:UIAlertControllerStyleAlert];
}

- (void)cl_showAlertViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                                buttonTitle:(NSString *)buttonTitle{
    
    UIAlertAction *cl_otherAction = [UIAlertAction actionWithTitle:buttonTitle
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction *action) {
                                                           }];
    
    [self cl_showAlertViewControllerWithTitle:title
                                      message:message
                                      actions:@[cl_otherAction]
                               preferredStyle:UIAlertControllerStyleAlert];
}

- (void)cl_showAlertViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                                    actions:(NSArray<UIAlertAction *> *) actions
                             preferredStyle:(UIAlertControllerStyle)preferredStyle {
    
    self.cl_alertController = [UIAlertController alertControllerWithTitle:title
                                                                  message:message
                                                           preferredStyle:preferredStyle];
    
    if (actions) {
        
        for (UIAlertAction *cl_alertAction in actions) {
            
            [self.cl_alertController addAction:cl_alertAction];
        }
    }
    
    [self presentViewController:self.cl_alertController
                       animated:YES
                     completion:nil];
}

- (void)cl_showSheetViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                               actionTitles:(NSArray<NSString *> *)actionTitles
                                    handler:(void (^)(UIAlertAction *action, NSUInteger index))handler {
    
    self.cl_alertController = [UIAlertController alertControllerWithTitle:title
                                                                  message:message
                                                           preferredStyle:UIAlertControllerStyleActionSheet];

    [actionTitles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIAlertAction *fs_sheetAction = [UIAlertAction actionWithTitle:obj
                                                                 style:UIAlertActionStyleDefault
                                                               handler:^(UIAlertAction * _Nonnull action) {
                                                                   
                                                                   if (handler) {
                                                                       
                                                                       handler(action, idx);
                                                                   }
                                                               }];
        
        [self.cl_alertController addAction:fs_sheetAction];
    }];
    
    UIAlertAction *fs_cancelAlertAction = [UIAlertAction actionWithTitle:@"取消"
                                                                   style:UIAlertActionStyleCancel
                                                                 handler:nil];

    [self.cl_alertController addAction:fs_cancelAlertAction];
    
    [self presentViewController:self.cl_alertController
                       animated:YES
                     completion:nil];
}

@end

@implementation UINavigationController (CLNavigaionController)

- (BOOL)navigationBar:(UINavigationBar *)navigationBar
        shouldPopItem:(UINavigationItem *)item {
    
    if([self.viewControllers count] < [navigationBar.items count]) {
        return YES;
    }
    
    BOOL cl_shouldPop = YES;
    
    UIViewController *cl_viewController = [self topViewController];
    
    if([cl_viewController respondsToSelector:@selector(cl_navigationShouldPopOnBackButton)]) {
        
        cl_shouldPop = [cl_viewController cl_navigationShouldPopOnBackButton];
    }
    
    if(cl_shouldPop) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popViewControllerAnimated:YES];
        });
        
    } else {
        
        // Workaround for iOS7.1. Thanks to @boliva - http://stackoverflow.com/posts/comments/34452906
        for(UIView *cl_subview in [navigationBar subviews]) {
            
            if(0.f < cl_subview.alpha && cl_subview.alpha < 1.0) {
                
                [UIView animateWithDuration:0.25
                                 animations:^{
                                     
                                     cl_subview.alpha = 1.0f;
                                 }];
            }
        }
    }
    
    return NO;
}

@end
