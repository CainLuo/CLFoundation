//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLAnimatorManager.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/5/23.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLAnimatorManager.h"

@interface CLAnimatorManager ()

@property (nonatomic, strong, readwrite) UIViewPropertyAnimator *cl_viewPropertyAnimator;

@end

@implementation CLAnimatorManager

#pragma mark - UICubicTimingParameters
- (void)cl_cubicTimingParametersWithDuration:(NSTimeInterval)duration
                                       curve:(UIViewAnimationCurve)curve
                                  animations:(CLAnimatorManagerBlock)animations {
    
    [self cl_cubicTimingParametersWithDuration:duration
                                         curve:curve
                                    animations:animations
                                    completion:^(UIViewAnimatingPosition finalPosition) {}];
}

- (void)cl_cubicTimingParametersWithDuration:(NSTimeInterval)duration
                                       curve:(UIViewAnimationCurve)curve
                                  animations:(CLAnimatorManagerBlock)animations
                                  completion:(CLAnimatorManagerCompleteBlock)completion {
    
    UICubicTimingParameters *cl_cubicTimingParameters = [[UICubicTimingParameters alloc] initWithAnimationCurve:curve];
    
    self.cl_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                   timingParameters:cl_cubicTimingParameters];
    
    [self.cl_viewPropertyAnimator addAnimations:animations];
    [self.cl_viewPropertyAnimator addCompletion:completion];
}

- (void)cl_cubicTimingParametersWithDuration:(NSTimeInterval)duration
                               controlPoint1:(CGPoint)controlPoint1
                               controlPoint2:(CGPoint)controlPoint2
                                  animations:(CLAnimatorManagerBlock)animations {
    
    [self cl_cubicTimingParametersWithDuration:duration
                                 controlPoint1:controlPoint1
                                 controlPoint2:controlPoint2
                                    animations:animations
                                    completion:^(UIViewAnimatingPosition finalPosition) {}];
}

- (void)cl_cubicTimingParametersWithDuration:(NSTimeInterval)duration
                               controlPoint1:(CGPoint)controlPoint1
                               controlPoint2:(CGPoint)controlPoint2
                                  animations:(CLAnimatorManagerBlock)animations
                                  completion:(CLAnimatorManagerCompleteBlock)completion {
    
    UICubicTimingParameters *cl_cubicTimingParameters = [[UICubicTimingParameters alloc] initWithControlPoint1:controlPoint1
                                                                                                 controlPoint2:controlPoint2];
    
    self.cl_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                   timingParameters:cl_cubicTimingParameters];
    
    [self.cl_viewPropertyAnimator addAnimations:animations];
    [self.cl_viewPropertyAnimator addCompletion:completion];
}

#pragma mark - UISpringTimingParameters
- (void)cl_springTimingParametersWithDuration:(NSTimeInterval)duration
                                 dampingRatio:(CGFloat)dampingRatio
                                   animations:(CLAnimatorManagerBlock)animations {
    
    [self cl_springTimingParametersWithDuration:duration
                                   dampingRatio:dampingRatio
                                     animations:animations
                                     completion:^(UIViewAnimatingPosition finalPosition) {}];
}

- (void)cl_springTimingParametersWithDuration:(NSTimeInterval)duration
                                 dampingRatio:(CGFloat)dampingRatio
                                   animations:(CLAnimatorManagerBlock)animations
                                   completion:(CLAnimatorManagerCompleteBlock)completion {
    
    UISpringTimingParameters *cl_springTimingParameters = [[UISpringTimingParameters alloc] initWithDampingRatio:dampingRatio];
    
    self.cl_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                   timingParameters:cl_springTimingParameters];
    
    [self.cl_viewPropertyAnimator addAnimations:animations];
    [self.cl_viewPropertyAnimator addCompletion:completion];
}

- (void)cl_springTimingParametersWithDuration:(NSTimeInterval)duration
                                 dampingRatio:(CGFloat)dampingRatio
                                     velocity:(CGVector)velocity
                                   animations:(CLAnimatorManagerBlock)animations {
    
    [self cl_springTimingParametersWithDuration:duration
                                   dampingRatio:dampingRatio
                                       velocity:velocity
                                     animations:animations
                                     completion:^(UIViewAnimatingPosition finalPosition) {}];
}

- (void)cl_springTimingParametersWithDuration:(NSTimeInterval)duration
                                 dampingRatio:(CGFloat)dampingRatio
                                     velocity:(CGVector)velocity
                                   animations:(CLAnimatorManagerBlock)animations
                                   completion:(CLAnimatorManagerCompleteBlock)completion {
    
    UISpringTimingParameters *cl_springTimingParameters = [[UISpringTimingParameters alloc] initWithDampingRatio:dampingRatio
                                                                                                 initialVelocity:velocity];
    
    self.cl_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                   timingParameters:cl_springTimingParameters];
    
    [self.cl_viewPropertyAnimator addAnimations:animations];
    [self.cl_viewPropertyAnimator addCompletion:completion];
}

- (void)cl_springTimingParametersWithDuration:(NSTimeInterval)duration
                                         mass:(CGFloat)mass
                                    stiffness:(CGFloat)stiffness
                                      damping:(CGFloat)damping
                                     velocity:(CGVector)velocity
                                   animations:(CLAnimatorManagerBlock)animations {
    
    [self cl_springTimingParametersWithDuration:duration
                                           mass:mass
                                      stiffness:stiffness
                                        damping:damping
                                       velocity:velocity
                                     animations:animations
                                     completion:^(UIViewAnimatingPosition finalPosition) {}];
}

- (void)cl_springTimingParametersWithDuration:(NSTimeInterval)duration
                                         mass:(CGFloat)mass
                                    stiffness:(CGFloat)stiffness
                                      damping:(CGFloat)damping
                                     velocity:(CGVector)velocity
                                   animations:(CLAnimatorManagerBlock)animations
                                   completion:(CLAnimatorManagerCompleteBlock)completion {
    
    UISpringTimingParameters *cl_springTimingParameters = [[UISpringTimingParameters alloc] initWithMass:mass
                                                                                               stiffness:stiffness
                                                                                                 damping:damping
                                                                                         initialVelocity:velocity];
    
    self.cl_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                   timingParameters:cl_springTimingParameters];
    
    [self.cl_viewPropertyAnimator addAnimations:animations];
    [self.cl_viewPropertyAnimator addCompletion:completion];
}

#pragma mark - UIViewPropertyAnimator
- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                           timingParameters:(id <UITimingCurveProvider>)parameters
                                 animations:(CLAnimatorManagerBlock)animations {
    
    [self cl_viewPropertyAnimatorWithDuration:duration
                             timingParameters:parameters
                                   animations:animations
                                   completion:^(UIViewAnimatingPosition finalPosition) {}];
}

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                           timingParameters:(id <UITimingCurveProvider>)parameters
                                 animations:(CLAnimatorManagerBlock)animations
                                 completion:(CLAnimatorManagerCompleteBlock)completion {
    
    self.cl_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                   timingParameters:parameters];
    
    [self.cl_viewPropertyAnimator addAnimations:animations];
    [self.cl_viewPropertyAnimator addCompletion:completion];
}

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                                      curve:(UIViewAnimationCurve)curve
                                 animations:(CLAnimatorManagerBlock)animations {
    
    [self cl_viewPropertyAnimatorWithDuration:duration
                                 dampingRatio:curve
                                   animations:animations
                                   completion:^(UIViewAnimatingPosition finalPosition) {}];
}

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                                      curve:(UIViewAnimationCurve)curve
                                 animations:(CLAnimatorManagerBlock)animations
                                 completion:(CLAnimatorManagerCompleteBlock)completion {

    self.cl_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                              curve:curve
                                                                         animations:animations];
    
    [self.cl_viewPropertyAnimator addAnimations:animations];
    [self.cl_viewPropertyAnimator addCompletion:completion];
}

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                              controlPoint1:(CGPoint)point1
                              controlPoint2:(CGPoint)point2
                                 animations:(CLAnimatorManagerBlock)animations {
 
    [self cl_viewPropertyAnimatorWithDuration:duration
                                controlPoint1:point1
                                controlPoint2:point2
                                   animations:animations
                                   completion:^(UIViewAnimatingPosition finalPosition) {}];
}

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                              controlPoint1:(CGPoint)point1
                              controlPoint2:(CGPoint)point2
                                 animations:(CLAnimatorManagerBlock)animations
                                 completion:(CLAnimatorManagerCompleteBlock)completion {

    self.cl_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                      controlPoint1:point1
                                                                      controlPoint2:point2
                                                                         animations:animations];
    
    [self.cl_viewPropertyAnimator addAnimations:animations];
    [self.cl_viewPropertyAnimator addCompletion:completion];
}

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                               dampingRatio:(CGFloat)ratio
                                 animations:(CLAnimatorManagerBlock)animations {

    [self cl_viewPropertyAnimatorWithDuration:duration
                                 dampingRatio:ratio
                                   animations:animations
                                   completion:^(UIViewAnimatingPosition finalPosition) {}];
}

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                               dampingRatio:(CGFloat)ratio
                                 animations:(CLAnimatorManagerBlock)animations
                                 completion:(CLAnimatorManagerCompleteBlock)completion {
    
    self.cl_viewPropertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration
                                                                       dampingRatio:ratio
                                                                         animations:animations];
    
    [self.cl_viewPropertyAnimator addAnimations:animations];
    [self.cl_viewPropertyAnimator addCompletion:completion];
}

- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                                 afterDelay:(NSTimeInterval)delay
                                    options:(UIViewAnimationOptions)options
                                 animations:(CLAnimatorManagerBlock)animations
                                 completion:(CLAnimatorManagerCompleteBlock)completion {
    
    self.cl_viewPropertyAnimator = [UIViewPropertyAnimator runningPropertyAnimatorWithDuration:duration
                                                                                         delay:delay
                                                                                       options:options
                                                                                    animations:animations
                                                                                    completion:completion];
}

#pragma mark - UIViewPropertyAnimator控制相关
- (void)cl_starViewPropertyAnimator {
    
    [self.cl_viewPropertyAnimator startAnimation];
}

- (void)cl_starViewPropertyAnimatorAfterDelay:(NSTimeInterval)delay {
    
    [self.cl_viewPropertyAnimator startAnimationAfterDelay:delay];
}

- (void)cl_pauseViewPropertyAnimator {
    
    [self.cl_viewPropertyAnimator pauseAnimation];
}

- (void)cl_stopViewPropertyAnimator:(BOOL)stop {
    
    [self.cl_viewPropertyAnimator stopAnimation:stop];
}

- (void)cl_finishViewPropertyAnimatorWithPosition:(UIViewAnimatingPosition)position {
    
    [self.cl_viewPropertyAnimator finishAnimationAtPosition:position];
}

@end
