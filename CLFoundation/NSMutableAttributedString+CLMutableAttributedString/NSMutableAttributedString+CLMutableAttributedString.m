//
//  NSMutableAttributedString+CLMutableAttributedString.m
//  SimpleProject
//
//  Created by Cain on 2017/8/26.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "NSMutableAttributedString+CLMutableAttributedString.h"

@implementation NSMutableAttributedString (CLMutableAttributedString)

+ (NSMutableAttributedString *)cl_attributeStringWithSubffixString:(NSString *)subffixString
                                                      subffixImage:(UIImage *)subffixImage {
    
    NSMutableAttributedString *cl_mutableAttributedString = [[NSMutableAttributedString alloc] init];
    
    NSTextAttachment *cl_backAttachment = [[NSTextAttachment alloc] init];
    
    cl_backAttachment.image = subffixImage;
    cl_backAttachment.bounds = CGRectMake(0, -2, subffixImage.size.width, subffixImage.size.height);
    
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
    
    NSMutableAttributedString *cl_mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:prefixString];
    
    NSTextAttachment *cl_backAttachment = [[NSTextAttachment alloc] init];
    
    cl_backAttachment.image = prefixImage;
    cl_backAttachment.bounds = CGRectMake(0, -2, prefixImage.size.width, prefixImage.size.height);
    
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

