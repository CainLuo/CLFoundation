//
//  NSMutableAttributedString+CLMutableAttributedString.h
//  SimpleProject
//
//  Created by Cain on 2017/8/26.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (CLMutableAttributedString)

/**
 添加图片在字符串之前
 
 @param subffixString 字符串
 @param subffixImage 图片
 @return NSMutableAttributedString
 */
+ (NSMutableAttributedString *)cl_attributeStringWithSubffixString:(NSString *)subffixString
                                                      subffixImage:(UIImage *)subffixImage;

/**
 添加多张图片在字符串之前

 @param subffixString 字符串
 @param subffixImages 图片数组
 @return NSMutableAttributedString
 */
+ (NSMutableAttributedString *)cl_attributeStringWithSubffixString:(NSString *)subffixString
                                                     subffixImages:(NSArray<UIImage *> *)subffixImages;
/**
 添加图片在字符串之后
 
 @param prefixString 富文本
 @param prefixImage 图片
 @return NSMutableAttributedString
 */
+ (NSMutableAttributedString *)cl_attributeStringWithPrefixString:(NSString *)prefixString
                                                      prefixImage:(UIImage *)prefixImage;

/**
 添加多张图片在字符串之前
 
 @param prefixString 字符串
 @param prefixImages 图片数组
 @return NSMutableAttributedString
 */
+ (NSMutableAttributedString *)cl_attributeStringWithPrefixString:(NSString *)prefixString
                                                     prefixImages:(NSArray<UIImage *> *)prefixImages;

/**
 给指定字符串设置行距
 
 @param string 字符串
 @param lineSpacing 行距
 @return NSMutableAttributedString
 */
+ (NSMutableAttributedString *)cl_attributedStringWithString:(NSString *)string
                                                 lineSpacing:(CGFloat)lineSpacing;

/**
 给指定富文本字符串设置行距
 
 @param attributedString NSAttributedString
 @param lineSpacing 行距
 @return NSMutableAttributedString
 */
+ (NSMutableAttributedString *)cl_attributedStringWithAttributedString:(NSAttributedString *)attributedString
                                                           lineSpacing:(CGFloat)lineSpacing;


/**
 给指定字符串添加下划线

 @param string NSString
 @param range NSRange
 @return NSMutableAttributedString
 */
+ (NSMutableAttributedString *)cl_attributedStringAddLineWithString:(NSString *)string
                                                              range:(NSRange)range;

/**
 给指定富文本字符串添加下划线

 @param attributedString NSAttributedString
 @param range NSRange
 @return NSMutableAttributedString
 */
+ (NSMutableAttributedString *)cl_attributedStringAddLineWithAttributedString:(NSAttributedString *)attributedString
                                                                        range:(NSRange)range;

@end

