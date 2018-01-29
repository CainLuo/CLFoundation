//
//  NSAttributedString+CLAttributedString.m
//  SimpleProject
//
//  Created by Cain on 2017/8/26.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "NSAttributedString+CLAttributedString.h"
#import <CoreText/CoreText.h>

@implementation NSAttributedString (CLAttributedString)

- (CGFloat)cl_attributedStringHeightWithContainWidth:(CGFloat)width {
    
    NSInteger total_height = 0;
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)self);
    
    CGRect drawingRect = CGRectMake(0, 0, width, 100000);
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathAddRect(path, NULL, drawingRect);
    
    CTFrameRef textFrame = CTFramesetterCreateFrame(framesetter,CFRangeMake(0,0), path, NULL);
    
    CGPathRelease(path);
    
    CFRelease(framesetter);
    
    NSArray *linesArray = (NSArray *)CTFrameGetLines(textFrame);
    
    if(linesArray.count == 0) {
        return 0;
    }
    
    CGPoint origins[[linesArray count]];
    
    CTFrameGetLineOrigins(textFrame, CFRangeMake(0, 0), origins);
    
    NSInteger line_y = (NSInteger)origins[[linesArray count] -1].y;
    
    CGFloat ascent;
    CGFloat descent;
    CGFloat leading;
    
    CTLineRef line = (__bridge CTLineRef)[linesArray objectAtIndex:[linesArray count] - 1];
    
    CTLineGetTypographicBounds(line, &ascent, &descent, &leading);
    
    total_height = 100000 - line_y + (NSInteger)descent +1;
    
    CFRelease(textFrame);
    
    return total_height;
}

#pragma mark - 修改字符串颜色
+ (NSAttributedString *)cl_attributeStringWithString:(NSString *)string
                                               color:(UIColor *)color
                                               range:(NSRange)range {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    
    [attributedString addAttributes:@{NSForegroundColorAttributeName: color}
                              range:range];
    
    return attributedString;
}

+ (NSAttributedString *)cl_attributeStringWithAttributedString:(NSAttributedString *)attributedString
                                                         color:(UIColor *)color
                                                         range:(NSRange)range {
    
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:attributedString];
    
    [mutableAttributedString addAttributes:@{NSForegroundColorAttributeName: color}
                                     range:range];
    
    return mutableAttributedString;
}

#pragma mark - 修改字符串字体
+ (NSAttributedString *)cl_attributeStringWithString:(NSString *)string
                                                font:(UIFont *)font
                                               range:(NSRange)range {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    
    [attributedString addAttributes:@{NSFontAttributeName: font}
                              range:range];
    
    return attributedString;
}

+ (NSAttributedString *)cl_attributeStringWithAttributedString:(NSAttributedString *)attributedString
                                                          font:(UIFont *)font
                                                         range:(NSRange)range {
    
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:attributedString];
    
    [mutableAttributedString addAttributes:@{NSFontAttributeName: font}
                                     range:range];
    
    return mutableAttributedString;
}

+ (NSAttributedString *)cl_attributeStringWithPrefixString:(NSString *)prefixString
                                                prefixFont:(UIFont *)prefixFont
                                              suffixString:(NSString *)suffixString
                                                suffixFont:(UIFont *)suffixFont {
    
    return [NSAttributedString cl_attributeStringWithPrefixString:prefixString
                                                       prefixFont:prefixFont
                                                      prefixColor:nil
                                                     suffixString:suffixString
                                                       suffixFont:suffixFont
                                                      suffixColor:nil];
}

+ (NSAttributedString *)cl_attributeStringWithPrefixString:(NSString *)prefixString
                                                prefixFont:(UIFont *)prefixFont
                                               prefixColor:(UIColor *)prefixColor
                                              suffixString:(NSString *)suffixString
                                                suffixFont:(UIFont *)suffixFont
                                               suffixColor:(UIColor *)suffixColor {
    
    NSInteger prefixLength = prefixString.length;
    NSInteger suffixLength = suffixString.length;
    
    NSString *finalString = [NSString stringWithFormat:@"%@%@", prefixString, suffixString];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:finalString];
    
    if (prefixFont == 0 && prefixColor == 0) {
        
        [attributedString addAttributes:@{NSForegroundColorAttributeName: [self colorWithHex:0x999999],
                                          NSFontAttributeName: [UIFont systemFontOfSize:10.0f]
                                          }
                                  range:NSMakeRange(0, prefixLength)];
        
        
    } else {
        
        [attributedString addAttributes:@{NSForegroundColorAttributeName: prefixColor,
                                          NSFontAttributeName: prefixFont}
                                  range:NSMakeRange(0, prefixLength)];
    }
    
    if (suffixFont == 0 && suffixColor == 0) {
        [attributedString addAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:10.0f],
                                          NSForegroundColorAttributeName: [self colorWithHex:0xff786e]}
                                  range:NSMakeRange(prefixLength, suffixLength)];
    } else {
        
        
        [attributedString addAttributes:@{NSFontAttributeName: suffixFont,
                                          NSForegroundColorAttributeName: suffixColor}
                                  range:NSMakeRange(prefixLength, suffixLength)];
    }
    
    return attributedString;
}

+ (UIColor *)colorWithHex:(NSInteger)hexValue {
    
    return [UIColor colorWithRed:((CGFloat)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((CGFloat)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((CGFloat)(hexValue & 0xFF))/255.0
                           alpha:1.0];
}

@end

