//
//  CALayer+CLLayer.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/9/19.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CALayer+CLLayer.h"

@implementation CALayer (CLLayer)

- (void)cl_sendLayerBackWithSubLayer:(CALayer *)sublayer {
    
    if (sublayer.superlayer == self) {
        
        [sublayer removeFromSuperlayer];
        
        [self insertSublayer:sublayer
                     atIndex:0];
    }
}

- (void)cl_bringLayerFrontWithSublayer:(CALayer *)sublayer {
    
    if (sublayer.superlayer == self) {
        
        [sublayer removeFromSuperlayer];
        
        [self insertSublayer:sublayer
                     atIndex:(unsigned)self.sublayers.count];
    }
}

@end
