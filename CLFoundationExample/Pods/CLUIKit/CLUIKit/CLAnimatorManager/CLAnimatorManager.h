//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLAnimatorManager.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/5/23.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
NS_CLASS_AVAILABLE_IOS(10_0) @interface CLAnimatorManager : NSObject

typedef void(^CLAnimatorManagerBlock)(void);
typedef void(^CLAnimatorManagerCompleteBlock)(UIViewAnimatingPosition finalPosition);
typedef void(^CLAnimatorManagerStatusBlock)(UIViewAnimatingState state);

@property (nonatomic, strong, readonly) UIViewPropertyAnimator *cl_viewPropertyAnimator;

#pragma mark - UICubicTimingParameters
/**
 添加UICubicTimingParameters动画

 @param duration NSTimeInterval
 @param curve UIViewAnimationCurve
 */
- (void)cl_cubicTimingParametersWithDuration:(NSTimeInterval)duration
                                       curve:(UIViewAnimationCurve)curve
                                  animations:(CLAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

/**
 添加UICubicTimingParameters动画
 
 @param duration NSTimeInterval
 @param curve UIViewAnimationCurve
 @param completion CLAnimatorManagerCompleteBlock
 */
- (void)cl_cubicTimingParametersWithDuration:(NSTimeInterval)duration
                                       curve:(UIViewAnimationCurve)curve
                                  animations:(CLAnimatorManagerBlock)animations
                                  completion:(CLAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

/**
 添加UICubicTimingParameters动画
 
 @param duration NSTimeInterval
 @param controlPoint1 CGPoint, 取值范围为CGPointMake(0 ~ 1.0, 0 ~ 1.0)
 @param controlPoint2 CGPoint, 取值范围为CGPointMake(0 ~ 1.0, 0 ~ 1.0)
 */
- (void)cl_cubicTimingParametersWithDuration:(NSTimeInterval)duration
                               controlPoint1:(CGPoint)controlPoint1
                               controlPoint2:(CGPoint)controlPoint2
                                  animations:(CLAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

/**
 添加UICubicTimingParameters动画
 
 @param duration NSTimeInterval
 @param controlPoint1 CGPoint, 取值范围为CGPointMake(0 ~ 1.0, 0 ~ 1.0)
 @param controlPoint2 CGPoint, 取值范围为CGPointMake(0 ~ 1.0, 0 ~ 1.0)
 @param completion CLAnimatorManagerCompleteBlock
 */
- (void)cl_cubicTimingParametersWithDuration:(NSTimeInterval)duration
                               controlPoint1:(CGPoint)controlPoint1
                               controlPoint2:(CGPoint)controlPoint2
                                  animations:(CLAnimatorManagerBlock)animations
                                  completion:(CLAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

#pragma mark - UISpringTimingParameters
/**
 添加UISpringTimingParameters动画

 @param duration NSTimeInterval
 @param dampingRatio CGFloat, 取值范围为0 ~ 1.0
 */
- (void)cl_springTimingParametersWithDuration:(NSTimeInterval)duration
                                 dampingRatio:(CGFloat)dampingRatio
                                   animations:(CLAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

/**
 添加UISpringTimingParameters动画
 
 @param duration NSTimeInterval
 @param dampingRatio CGFloat, 取值范围为0 ~ 1.0
 @param completion CLAnimatorManagerCompleteBlock
 */
- (void)cl_springTimingParametersWithDuration:(NSTimeInterval)duration
                                 dampingRatio:(CGFloat)dampingRatio
                                   animations:(CLAnimatorManagerBlock)animations
                                   completion:(CLAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

/**
 添加UISpringTimingParameters动画
 
 @param duration NSTimeInterval
 @param dampingRatio CGFloat, 取值范围为0~1.0
 @param velocity CGVector, 取值范围为CGVectorMake(0 ~ 1.0, 0 ~ 1.0)
 */
- (void)cl_springTimingParametersWithDuration:(NSTimeInterval)duration
                                 dampingRatio:(CGFloat)dampingRatio
                                     velocity:(CGVector)velocity
                                   animations:(CLAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

/**
 添加UISpringTimingParameters动画
 
 @param duration NSTimeInterval
 @param dampingRatio CGFloat, 取值范围为0~1.0
 @param velocity CGVector, 取值范围为CGVectorMake(0 ~ 1.0, 0 ~ 1.0)
 @param completion CLAnimatorManagerCompleteBlock
 */
- (void)cl_springTimingParametersWithDuration:(NSTimeInterval)duration
                                 dampingRatio:(CGFloat)dampingRatio
                                     velocity:(CGVector)velocity
                                   animations:(CLAnimatorManagerBlock)animations
                                   completion:(CLAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

/**
 添加UISpringTimingParameters动画

 @param duration NSTimeInterval
 @param mass CGFloat, 必须大于0
 @param stiffness CGFloat
 @param damping CGFloat
 @param velocity CGVector, 取值范围为CGVectorMake(0 ~ 1.0, 0 ~ 1.0)
 */
- (void)cl_springTimingParametersWithDuration:(NSTimeInterval)duration
                                         mass:(CGFloat)mass
                                    stiffness:(CGFloat)stiffness
                                      damping:(CGFloat)damping
                                     velocity:(CGVector)velocity
                                   animations:(CLAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

/**
 添加UISpringTimingParameters动画
 
 @param duration NSTimeInterval
 @param mass CGFloat, 必须大于0
 @param stiffness CGFloat
 @param damping CGFloat
 @param velocity CGVector
 @param completion CLAnimatorManagerCompleteBlock
 */
- (void)cl_springTimingParametersWithDuration:(NSTimeInterval)duration
                                         mass:(CGFloat)mass
                                    stiffness:(CGFloat)stiffness
                                      damping:(CGFloat)damping
                                     velocity:(CGVector)velocity
                                   animations:(CLAnimatorManagerBlock)animations
                                   completion:(CLAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

#pragma mark - UIViewPropertyAnimator
/**
 添加UIViewPropertyAnimator动画

 @param duration NSTimeInterval
 @param parameters UITimingCurveProvider
 */
- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                           timingParameters:(id <UITimingCurveProvider>)parameters
                                 animations:(CLAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

/**
 添加UIViewPropertyAnimator动画
 
 @param duration NSTimeInterval
 @param parameters UITimingCurveProvider
 @param completion CLAnimatorManagerCompleteBlock
 */
- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                           timingParameters:(id <UITimingCurveProvider>)parameters
                                 animations:(CLAnimatorManagerBlock)animations
                                 completion:(CLAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

/**
 添加UIViewPropertyAnimator动画

 @param duration NSTimeInterval
 @param curve UIViewAnimationCurve
 @param animations CLAnimatorManagerBlock
 */
- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                                      curve:(UIViewAnimationCurve)curve
                                 animations:(CLAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

/**
 添加UIViewPropertyAnimator动画
 
 @param duration NSTimeInterval
 @param curve UIViewAnimationCurve
 @param animations CLAnimatorManagerBlock
 @param completion CLAnimatorManagerCompleteBlock
 */
- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                                      curve:(UIViewAnimationCurve)curve
                                 animations:(CLAnimatorManagerBlock)animations
                                 completion:(CLAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

/**
 添加UIViewPropertyAnimator动画

 @param duration NSTimeInterval
 @param point1 CGPoint
 @param point2 CGPoint
 @param animations CLAnimatorManagerBlock
 */
- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                              controlPoint1:(CGPoint)point1
                              controlPoint2:(CGPoint)point2
                                 animations:(CLAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

/**
 添加UIViewPropertyAnimator动画
 
 @param duration NSTimeInterval
 @param point1 CGPoint
 @param point2 CGPoint
 @param animations CLAnimatorManagerBlock
 @param completion CLAnimatorManagerCompleteBlock
 */
- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                              controlPoint1:(CGPoint)point1
                              controlPoint2:(CGPoint)point2
                                 animations:(CLAnimatorManagerBlock)animations
                                 completion:(CLAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

/**
 添加UIViewPropertyAnimator动画

 @param duration NSTimeInterval
 @param ratio CGFloat
 @param animations CLAnimatorManagerBlock
 */
- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                               dampingRatio:(CGFloat)ratio
                                 animations:(CLAnimatorManagerBlock)animations NS_AVAILABLE_IOS(10_0);

/**
 添加UIViewPropertyAnimator动画
 
 @param duration NSTimeInterval
 @param ratio CGFloat
 @param animations CLAnimatorManagerBlock
 @param completion CLAnimatorManagerCompleteBlock
 */
- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                               dampingRatio:(CGFloat)ratio
                                 animations:(CLAnimatorManagerBlock)animations
                                 completion:(CLAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

/**
 添加UIViewPropertyAnimator动画

 @param duration NSTimeInterval
 @param delay NSTimeInterval
 @param options UIViewAnimationOptions
 @param animations CLAnimatorManagerBlock
 @param completion CLAnimatorManagerCompleteBlock
 */
- (void)cl_viewPropertyAnimatorWithDuration:(NSTimeInterval)duration
                                 afterDelay:(NSTimeInterval)delay
                                    options:(UIViewAnimationOptions)options
                                 animations:(CLAnimatorManagerBlock)animations
                                 completion:(CLAnimatorManagerCompleteBlock)completion NS_AVAILABLE_IOS(10_0);

#pragma mark - UIViewPropertyAnimator控制相关
/**
 开始执行UIViewPropertyAnimator动画
 */
- (void)cl_starViewPropertyAnimator;

/**
 延迟执行UIViewPropertyAnimator动画

 @param delay NSTimeInterval
 */
- (void)cl_starViewPropertyAnimatorAfterDelay:(NSTimeInterval)delay;

/**
 暂停执行UIViewPropertyAnimator动画
 */
- (void)cl_pauseViewPropertyAnimator;

/**
 停止执行UIViewPropertyAnimator动画

 @param stop BOOL
 */
- (void)cl_stopViewPropertyAnimator:(BOOL)stop;

/**
 完成并将UIViewPropertyAnimator动画设置为指定的UIViewAnimatingPosition状态

 @param position UIViewAnimatingPosition
 */
- (void)cl_finishViewPropertyAnimatorWithPosition:(UIViewAnimatingPosition)position;

@end
NS_ASSUME_NONNULL_END
