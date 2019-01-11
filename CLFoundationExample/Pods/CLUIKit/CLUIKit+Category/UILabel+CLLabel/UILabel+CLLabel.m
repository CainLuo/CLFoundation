//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UILabel+CLLabel.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2019/1/7.
//  Copyright © 2019 Cain Luo. All rights reserved.
//

#import "UILabel+CLLabel.h"
#import "UIView+CLView.h"

@implementation UILabel (CLLabel)

- (CGFloat)cl_getLabelLineHeight {
    
    if (!self.text.length) {
    
        return 0;
    }
    
    NSString *cl_rangeString = [self.text substringWithRange:NSMakeRange(0, 1)];
    
    CGSize cl_rowSize = [cl_rangeString sizeWithAttributes:@{NSFontAttributeName:self.font}];
    
    return cl_rowSize.height;
}

- (CGFloat)cl_getLabelTextHeight {
    
    CGSize cl_textSize = [self textRectForBounds:CGRectMake(0, 0, self.cl_width, 10000)
                          limitedToNumberOfLines:self.numberOfLines].size;
    
    return cl_textSize.height;
}

- (CGFloat)cl_getLabelTextWidth {
    
    CGSize cl_textSize = [self textRectForBounds:CGRectMake(0, 0, self.cl_width, 10000)
                          limitedToNumberOfLines:self.numberOfLines].size;
    
    return cl_textSize.width;
}

- (NSInteger)cl_getLabelNumberOfLines {
    
    CGSize cl_contentSize = [self.text boundingRectWithSize:CGSizeMake(self.cl_width, 10000)
                                                    options:NSStringDrawingUsesLineFragmentOrigin
                                                 attributes:@{NSFontAttributeName:self.font}
                                                    context:nil].size;
    
    return cl_contentSize.height / [self cl_getLabelLineHeight];
}

- (CGSize)cl_fitLabelSizeForLimitedSize:(CGSize)size {
    
    CGRect cl_labelFrame = CGRectMake(self.frame.origin.x,
                                      self.frame.origin.y,
                                      size.width,
                                      size.height);
    
    self.frame = cl_labelFrame;
    
    CGFloat cl_labelHeight = ([self cl_getLabelTextHeight] > size.height) ? size.height : [self cl_getLabelTextHeight];
    
    return CGSizeMake([self cl_getLabelTextWidth], cl_labelHeight);
}

@end
