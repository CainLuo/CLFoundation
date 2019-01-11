//
//  CALayer+CLLayer.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/9/19.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (CLLayer)

/**
 把指定的CALayer排序到所有CALayer的最后面

 @param sublayer CALayer
 */
- (void)cl_sendLayerBackWithSubLayer:(CALayer *)sublayer;

/**
 把指定的CALayer排序到所有CALayer的前面

 @param sublayer CALayer
 */
- (void)cl_bringLayerFrontWithSublayer:(CALayer *)sublayer;

@end

NS_ASSUME_NONNULL_END
