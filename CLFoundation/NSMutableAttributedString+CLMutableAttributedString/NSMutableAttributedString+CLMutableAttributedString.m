//
//  NSMutableAttributedString+CLMutableAttributedString.m
//  SimpleProject
//
//  Created by Cain on 2017/8/26.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "NSMutableAttributedString+CLMutableAttributedString.h"

@implementation NSMutableAttributedString (CLMutableAttributedString)

+ (NSMutableAttributedString *)cl_attributeStringWithPrefixString:(NSString *)prefixString
                                                 subffixImageName:(NSString *)subffixImageName {
    
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:prefixString];
    
    UIImage *image = [UIImage imageNamed:subffixImageName];
    
    NSTextAttachment *backAttachment = [[NSTextAttachment alloc] init];
    
    backAttachment.image = image;
    backAttachment.bounds = CGRectMake(0, -2, image.size.width, image.size.height);
    
    NSAttributedString *backString = [NSAttributedString attributedStringWithAttachment:backAttachment];
    
    [mutableAttributedString appendAttributedString:backString];
    
    return mutableAttributedString;
}

+ (NSMutableAttributedString *)cl_attributeStringWithSubffixString:(NSString *)subffixString
                                                   prefixImageName:(NSString *)prefixImageName {
    
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:subffixString];
    
    UIImage *image = [UIImage imageNamed:prefixImageName];
    NSTextAttachment *backAttachment = [[NSTextAttachment alloc] init];
    
    backAttachment.image = image;
    backAttachment.bounds = CGRectMake(0, -2, image.size.width, image.size.height);
    
    NSAttributedString *backString = [NSAttributedString attributedStringWithAttachment:backAttachment];
    
    [mutableAttributedString appendAttributedString:backString];
    [mutableAttributedString appendAttributedString:[[NSMutableAttributedString alloc] initWithString:subffixString]];
    
    return mutableAttributedString;
    
}

+ (NSMutableAttributedString *)cl_attributedStringWithString:(NSString *)string
                                                 lineSpacing:(CGFloat)lineSpacing {
    
    NSMutableAttributedString *cl_attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:lineSpacing];
    
    [cl_attributedString addAttribute:NSParagraphStyleAttributeName
                                value:paragraphStyle
                                range:NSMakeRange(0, [string length])];
    
    return cl_attributedString;
}

+ (NSMutableAttributedString *)cl_attributedStringWithAttributedString:(NSAttributedString *)attributedString
                                                           lineSpacing:(CGFloat)lineSpacing {
    
    NSMutableAttributedString *cl_attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:attributedString];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:lineSpacing];
    
    [cl_attributedString addAttribute:NSParagraphStyleAttributeName
                                value:paragraphStyle
                                range:NSMakeRange(0, [attributedString length])];
    
    return cl_attributedString;
}

@end

