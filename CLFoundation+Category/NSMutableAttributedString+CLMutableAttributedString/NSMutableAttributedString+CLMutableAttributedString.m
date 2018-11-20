//
//  NSMutableAttributedString+CLMutableAttributedString.m
//  SimpleProject
//
//  Created by Cain on 2017/8/26.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "NSMutableAttributedString+CLMutableAttributedString.h"
#import "NSString+CLString.h"

@implementation NSMutableAttributedString (CLMutableAttributedString)

+ (NSMutableAttributedString *)cl_attributeStringWithSubffixString:(NSString *)subffixString
                                                      subffixImage:(UIImage *)subffixImage {
    
    return [self cl_attributeStringWithSubffixString:subffixString
                                          imageFrame:CGRectMake(0, -2, subffixImage.size.width, subffixImage.size.height)
                                        subffixImage:subffixImage];
}

+ (NSMutableAttributedString *)cl_attributeStringWithSubffixString:(NSString *)subffixString
                                                        imageFrame:(CGRect)imageFrame
                                                      subffixImage:(UIImage *)subffixImage {
  
    NSMutableAttributedString *cl_mutableAttributedString = [[NSMutableAttributedString alloc] init];
    
    NSTextAttachment *cl_backAttachment = [[NSTextAttachment alloc] init];
    
    cl_backAttachment.image  = subffixImage;
    cl_backAttachment.bounds = imageFrame;
    
    NSAttributedString *cl_backString = [NSAttributedString attributedStringWithAttachment:cl_backAttachment];
    NSAttributedString *cl_attributedString = [[NSAttributedString alloc] initWithString:subffixString];
    
    [cl_mutableAttributedString appendAttributedString:cl_backString];
    [cl_mutableAttributedString appendAttributedString:cl_attributedString];
    
    return cl_mutableAttributedString;
}

+ (NSMutableAttributedString *)cl_attributeStringWithSubffixString:(NSString *)subffixString
                                                     subffixImages:(NSArray<UIImage *> *)subffixImages {
    
    NSMutableAttributedString *cl_mutableAttributedString = [[NSMutableAttributedString alloc] init];
    
    [subffixImages enumerateObjectsUsingBlock:^(UIImage * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSTextAttachment *cl_backAttachment = [[NSTextAttachment alloc] init];
        
        cl_backAttachment.image = obj;
        cl_backAttachment.bounds = CGRectMake(0, -2, obj.size.width, obj.size.height);
        
        NSAttributedString *cl_backString = [NSAttributedString attributedStringWithAttachment:cl_backAttachment];
        
        [cl_mutableAttributedString appendAttributedString:cl_backString];
    }];
    
    NSAttributedString *cl_attributedString = [[NSAttributedString alloc] initWithString:subffixString];
    
    [cl_mutableAttributedString appendAttributedString:cl_attributedString];
    
    return cl_mutableAttributedString;
}

+ (NSMutableAttributedString *)cl_attributeStringWithPrefixString:(NSString *)prefixString
                                                      prefixImage:(UIImage *)prefixImage {
    
    return [self cl_attributeStringWithPrefixString:prefixString
                                         imageFrame:CGRectMake(0, -2, prefixImage.size.width, prefixImage.size.height)
                                        prefixImage:prefixImage];
}

+ (NSMutableAttributedString *)cl_attributeStringWithPrefixString:(NSString *)prefixString
                                                       imageFrame:(CGRect)imageFrame
                                                      prefixImage:(UIImage *)prefixImage {
    
    NSMutableAttributedString *cl_mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:prefixString];
    
    NSTextAttachment *cl_backAttachment = [[NSTextAttachment alloc] init];
    
    cl_backAttachment.image  = prefixImage;
    cl_backAttachment.bounds = imageFrame;
    
    NSAttributedString *cl_backString = [NSAttributedString attributedStringWithAttachment:cl_backAttachment];
    
    [cl_mutableAttributedString appendAttributedString:cl_backString];
    
    return cl_mutableAttributedString;
}

+ (NSMutableAttributedString *)cl_attributeStringWithPrefixString:(NSString *)prefixString
                                                     prefixImages:(NSArray<UIImage *> *)prefixImages {
    
    NSMutableAttributedString *cl_mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:prefixString];
    
    [prefixImages enumerateObjectsUsingBlock:^(UIImage * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSTextAttachment *cl_backAttachment = [[NSTextAttachment alloc] init];
        
        cl_backAttachment.image = obj;
        cl_backAttachment.bounds = CGRectMake(0, -2, obj.size.width, obj.size.height);
        
        NSAttributedString *cl_backString = [NSAttributedString attributedStringWithAttachment:cl_backAttachment];
        
        [cl_mutableAttributedString appendAttributedString:cl_backString];
    }];
    
    return cl_mutableAttributedString;
}

+ (NSMutableAttributedString *)cl_attributedStringWithString:(NSString *)string
                                                 lineSpacing:(CGFloat)lineSpacing {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    paragraphStyle.lineSpacing = lineSpacing;
    
    return [self cl_attributedStringWithString:string
                                paragraphStyle:paragraphStyle];
}

+ (NSMutableAttributedString *)cl_attributedStringWithString:(NSString *)string
                                              paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle {
    
    if ([NSString cl_checkEmptyWithString:string]) {
        
        return nil;
    }
    
    NSMutableAttributedString *cl_attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    
    [cl_attributedString addAttribute:NSParagraphStyleAttributeName
                                value:paragraphStyle
                                range:NSMakeRange(0, [string length])];
    
    return cl_attributedString;
}

+ (NSMutableAttributedString *)cl_attributedStringWithAttributedString:(NSAttributedString *)attributedString
                                                           lineSpacing:(CGFloat)lineSpacing {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:lineSpacing];

    return [self cl_attributedStringWithAttributedString:attributedString
                                          paragraphStyle:paragraphStyle];
}

+ (NSMutableAttributedString *)cl_attributedStringWithAttributedString:(NSAttributedString *)attributedString
                                                        paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle {
    
    if (attributedString.length <= 0) {
        
        return nil;
    }
    
    NSMutableAttributedString *cl_attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:attributedString];
    
    [cl_attributedString addAttribute:NSParagraphStyleAttributeName
                                value:paragraphStyle
                                range:NSMakeRange(0, [attributedString length])];
    
    return cl_attributedString;
}

+ (NSMutableAttributedString *)cl_attributedStringAddLineWithAttributedString:(NSAttributedString *)attributedString
                                                                        range:(NSRange)range {
    
    if (attributedString.length <= 0) {
        
        return nil;
    }
    
    NSMutableAttributedString *cl_mutableAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:attributedString];
    
    [cl_mutableAttributedString addAttribute:NSUnderlineStyleAttributeName
                                       value:[NSNumber numberWithInteger:NSUnderlineStyleSingle]
                                       range:range];
    
    return cl_mutableAttributedString;
}

+ (NSMutableAttributedString *)cl_attributedStringAddLineWithString:(NSString *)string
                                                              range:(NSRange)range {
    
    if ([NSString cl_checkEmptyWithString:string]) {

        return nil;
    }
    
    NSMutableAttributedString *cl_mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:string];
    
    [cl_mutableAttributedString addAttribute:NSUnderlineStyleAttributeName
                                       value:[NSNumber numberWithInteger:NSUnderlineStyleSingle]
                                       range:range];
    
    return cl_mutableAttributedString;
}

@end

