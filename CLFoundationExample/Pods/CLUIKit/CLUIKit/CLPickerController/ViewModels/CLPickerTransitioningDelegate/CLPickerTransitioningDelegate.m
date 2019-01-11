//
//  CLPickerTransitioningDelegate.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/9/12.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLPickerTransitioningDelegate.h"
#import "CLPresentationController.h"

@implementation CLPickerTransitioningDelegate

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented
                                                      presentingViewController:(UIViewController *)presenting
                                                          sourceViewController:(UIViewController *)source {
    
    CLPresentationController *cl_presentationController = [[CLPresentationController alloc] initWithPresentedViewController:presented
                                                                                                   presentingViewController:presenting];
    
    return cl_presentationController;
}

@end
