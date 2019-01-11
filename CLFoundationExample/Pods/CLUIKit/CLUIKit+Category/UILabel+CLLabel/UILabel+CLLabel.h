//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UILabel+CLLabel.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2019/1/7.
//  Copyright © 2019 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (CLLabel)

- (CGFloat)cl_getLabelLineHeight;
- (CGFloat)cl_getLabelTextHeight;
- (CGFloat)cl_getLabelTextWidth;

- (NSInteger)cl_getLabelNumberOfLines;

- (CGSize)cl_fitLabelSizeForLimitedSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
