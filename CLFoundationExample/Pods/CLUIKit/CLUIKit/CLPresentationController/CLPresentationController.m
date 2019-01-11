//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLPresentationController.m
//  UIPresentationController
//
//  Created by Cain Luo on 2018/6/24.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLPresentationController.h"

#import "UIViewController+CLViewController.h"

@interface CLPresentationController ()

@property (nonatomic, strong) UIView *cl_presentationView;

@property (nonatomic, strong) UIVisualEffectView *cl_visualEffectView;

@property (nonatomic, strong) UITapGestureRecognizer *cl_tapGestureRecognizer;

@end

@implementation CLPresentationController

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController
                       presentingViewController:(UIViewController *)presentingViewController {
    
    self = [super initWithPresentedViewController:presentedViewController
                         presentingViewController:presentingViewController];
    
    if (self) {
        
        BOOL cl_isHasPresentationViewHeight = (presentedViewController.cl_presentationViewHeight == 0);
        
        self.cl_backgroundColor            = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        self.cl_animationDuration          = 0.5f;
        self.cl_presentationViewStyle      = CLPresentationViewStyleNormal;
        self.cl_presentationViewHeight     = cl_isHasPresentationViewHeight ? [UIScreen mainScreen].bounds.size.height : presentedViewController.cl_presentationViewHeight;
        self.cl_isNeedTapGestureRecognizer = YES;
    }
    
    return self;
}

#pragma mark - Presentation Transition
- (void)presentationTransitionWillBegin {
    [super presentationTransitionWillBegin];
    
    [self cl_addPresentationView];
}

- (void)presentationTransitionDidEnd:(BOOL)completed {
    [super presentationTransitionDidEnd:completed];
}

- (void)cl_addPresentationView {
    
    if (self.cl_presentationViewStyle == CLPresentationViewStyleNormal) {
        
        [self.containerView addSubview:self.cl_presentationView];
    } else {
        
        [self.containerView addSubview:self.cl_visualEffectView];
    }

    [UIView animateWithDuration:self.cl_animationDuration
                     animations:^{

                         if (self.cl_presentationViewStyle == CLPresentationViewStyleNormal) {
                             
                             self.cl_presentationView.alpha = 1.0f;
                         } else {
                             
                             self.cl_visualEffectView.alpha = 0.9f;
                         }
                     }];
}

#pragma mark - dismissal Transition
- (void)dismissalTransitionWillBegin {
    [super dismissalTransitionWillBegin];
    
    [self cl_removePresentationViewBegin];
}

- (void)cl_removePresentationViewBegin {
    
    [UIView animateWithDuration:self.cl_animationDuration
                     animations:^{

                         if (self.cl_presentationViewStyle == CLPresentationViewStyleNormal) {
                             
                             self.cl_presentationView.alpha = 0.f;
                         } else {
                             self.cl_visualEffectView.alpha = 0.f;
                         }
                     }];
}

- (void)dismissalTransitionDidEnd:(BOOL)completed {
    [super dismissalTransitionDidEnd:completed];
    
    [self cl_removePresentationViewWithCompleted:completed];
}

- (void)cl_removePresentationViewWithCompleted:(BOOL)completed {
    
    if (completed) {
        
        if (self.cl_presentationViewStyle == CLPresentationViewStyleNormal) {
            
            [self.cl_presentationView removeFromSuperview];
        } else {
            [self.cl_visualEffectView removeFromSuperview];
        }
    }
}

#pragma mark - 设置Frame
- (CGRect)frameOfPresentedViewInContainerView {
    
    CGSize cl_screenSize =  [UIScreen mainScreen].bounds.size;
    
    return CGRectMake(0,
                      cl_screenSize.height - self.cl_presentationViewHeight,
                      cl_screenSize.width,
                      self.cl_presentationViewHeight);
}

#pragma mark - UIView
- (UIView *)cl_presentationView {
    
    if (!_cl_presentationView) {
        
        _cl_presentationView = [[UIView alloc] initWithFrame:self.containerView.bounds];
        
        _cl_presentationView.backgroundColor = self.cl_backgroundColor;
        
        if (self.cl_isNeedTapGestureRecognizer) {
            
            [_cl_presentationView addGestureRecognizer:self.cl_tapGestureRecognizer];
        }
    }
    
    return _cl_presentationView;
}

#pragma mark - UIVisualEffectView
- (UIVisualEffectView *)cl_visualEffectView {
    
    if (!_cl_visualEffectView) {
        
        UIBlurEffect *cl_blurEffect = [UIBlurEffect effectWithStyle:self.cl_blurEffectStyle];
        
        _cl_visualEffectView = [[UIVisualEffectView alloc] initWithEffect:cl_blurEffect];
        
        _cl_visualEffectView.frame = self.containerView.bounds;
        _cl_visualEffectView.alpha = 0.f;
        
        if (self.cl_isNeedTapGestureRecognizer) {
            
            [_cl_visualEffectView addGestureRecognizer:self.cl_tapGestureRecognizer];
        }
    }
    
    return _cl_visualEffectView;
}

#pragma mark - 添加单击手势
- (UITapGestureRecognizer *)cl_tapGestureRecognizer {
    
    if (!_cl_tapGestureRecognizer) {
        
        _cl_tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                           action:@selector(cl_containerViewTapActionWithTapGestureRecognizer:)];
    }
    
    return _cl_tapGestureRecognizer;
}

- (void)cl_containerViewTapActionWithTapGestureRecognizer:(UITapGestureRecognizer *)tapGestureRecognizer {
    
    CGPoint cl_presentationViewPoint = [tapGestureRecognizer locationInView:self.cl_presentationView];
    CGPoint cl_visualEffectViewPoint = [tapGestureRecognizer locationInView:self.cl_visualEffectView];

    BOOL cl_isPresentationViewRectContainsPoint = CGRectContainsPoint([self frameOfPresentedViewInContainerView],
                                                                      cl_presentationViewPoint);
    BOOL cl_isVisualEffectViewRectContainsPoint = CGRectContainsPoint([self frameOfPresentedViewInContainerView],
                                                                      cl_visualEffectViewPoint);

    if (!cl_isPresentationViewRectContainsPoint || !cl_isVisualEffectViewRectContainsPoint) {
        
        [self.presentedViewController dismissViewControllerAnimated:YES
                                                         completion:nil];
    }
}

@end
