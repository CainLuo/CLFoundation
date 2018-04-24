//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLScanQRCodeView.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/21.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLScanQRCodeView.h"
#import "UIScreen+CLScreen.h"
#import "UIColor+CLColor.h"
#import "UIImage+CLImage.h"

@interface CLScanQRCodeView ()

@property (nonatomic, strong) CALayer *cl_topLayer;
@property (nonatomic, strong) CALayer *cl_leftLayer;
@property (nonatomic, strong) CALayer *cl_bottomLayer;
@property (nonatomic, strong) CALayer *cl_rightLayer;

@property (nonatomic, strong) CALayer *cl_scanQRCodePickLayer;

@end

@implementation CLScanQRCodeView

- (void)layoutSubviews {
    [super layoutSubviews];
        
    [self cl_addConstraintsWithSuperView];
}

- (CALayer *)cl_scanQRCodePickLayer {
    
    if (!_cl_scanQRCodePickLayer) {
    
        _cl_scanQRCodePickLayer = [CALayer layer];
        
        _cl_scanQRCodePickLayer.contents = (__bridge id _Nullable)([UIImage cl_getImageWithBundleName:@"CLResource"
                                                                                            imageName:@"scan_pick"].CGImage);
        
        _cl_scanQRCodePickLayer.position = CGPointMake(self.center.x,
                                                       self.center.y - [UIScreen cl_fitScreen:200]);
        _cl_scanQRCodePickLayer.bounds   = CGRectMake(0,
                                                      0,
                                                      [UIScreen cl_fitScreen:500],
                                                      [UIScreen cl_fitScreen:500]);
    }
    
    return _cl_scanQRCodePickLayer;
}

#pragma mark - Mask CALayers
- (CALayer *)cl_topLayer {
    
    if (!_cl_topLayer) {
    
        _cl_topLayer = [CALayer layer];
        
        _cl_topLayer.backgroundColor = [UIColor cl_colorWithHex:0x000000
                                                          alpha:0.4].CGColor;
        
        _cl_topLayer.frame = CGRectMake(0,
                                        0,
                                        [UIScreen cl_getScreenWidth],
                                        CGRectGetMinY(self.cl_scanQRCodePickLayer.frame));
    }
    
    return _cl_topLayer;
}

- (CALayer *)cl_leftLayer {
    
    if (!_cl_leftLayer) {
    
        _cl_leftLayer = [CALayer layer];
        
        _cl_leftLayer.backgroundColor = [UIColor cl_colorWithHex:0x000000
                                                           alpha:0.4].CGColor;
        
        _cl_leftLayer.frame = CGRectMake(0,
                                         CGRectGetMaxY(self.cl_topLayer.frame),
                                         CGRectGetMinX(self.cl_scanQRCodePickLayer.frame),
                                         CGRectGetHeight(self.cl_scanQRCodePickLayer.frame));
    }
    
    return _cl_leftLayer;
}

- (CALayer *)cl_bottomLayer {
    
    if (!_cl_bottomLayer) {
        
        _cl_bottomLayer = [CALayer layer];
        
        _cl_bottomLayer.backgroundColor = [UIColor cl_colorWithHex:0x000000
                                                             alpha:0.4].CGColor;
        
        _cl_bottomLayer.frame = CGRectMake(0,
                                           CGRectGetMaxY(self.cl_scanQRCodePickLayer.frame),
                                           [UIScreen cl_getScreenWidth],
                                           [UIScreen cl_getScreenHeight] - CGRectGetMinY(self.cl_scanQRCodePickLayer.frame));
    }
    
    return _cl_bottomLayer;
}

- (CALayer *)cl_rightLayer {
    
    if (!_cl_rightLayer) {

        _cl_rightLayer = [CALayer layer];
        
        _cl_rightLayer.backgroundColor = [UIColor cl_colorWithHex:0x000000
                                                            alpha:0.4].CGColor;
        _cl_rightLayer.frame = CGRectMake(CGRectGetMaxX(self.cl_scanQRCodePickLayer.frame),
                                          CGRectGetMaxY(self.cl_topLayer.frame),
                                          [UIScreen cl_getScreenWidth] - CGRectGetMaxX(self.cl_scanQRCodePickLayer.frame),
                                          CGRectGetHeight(self.cl_scanQRCodePickLayer.frame));
    }
    
    return _cl_rightLayer;
}

- (void)cl_addConstraintsWithSuperView {
    
    [self.layer addSublayer:self.cl_scanQRCodePickLayer];

    [self.layer addSublayer:self.cl_topLayer];
    [self.layer addSublayer:self.cl_leftLayer];
    [self.layer addSublayer:self.cl_bottomLayer];
    [self.layer addSublayer:self.cl_rightLayer];
}

@end
