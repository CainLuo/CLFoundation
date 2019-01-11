//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIFont+CLFont.h
//
//  Created by Cain Luo on 2017/12/18.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIFont (CLFont)

/**
 自适应UI设计师所提供的1334*750的UI设计图系统文字大小

 @param fontSize CGFloat, 文字大小
 @return UIFont
 */
+ (UIFont *)cl_fitSystemFontOfSize:(CGFloat)fontSize;

/**
 自适应UI设计师所提供的1920*1080的UI设计图系统文字大小

 @param fontSize CGFloat, 文字大小
 @return UIFont
 */
+ (UIFont *)cl_fitPlusSystemFontOfSize:(CGFloat)fontSize;

/**
 自适应UI设计师所提供的1334*750的UI设计图系统加粗文字大小

 @param fontSize CGFloat, 文字大小
 @return UIFont
 */
+ (UIFont *)cl_fitBoldSystemFontOfSize:(CGFloat)fontSize;

/**
 自适应UI设计师所提供的1920*1080的UI设计图系统加粗文字大小

 @param fontSize CGFloat, 文字大小
 @return UIFont
 */
+ (UIFont *)cl_fitPlusBoldSystemFontOfSize:(CGFloat)fontSize;

/**
 自适应UI设计师所提供的1334*750的UI设计图系统斜体文字大小

 @param fontSize CGFloat, 文字大小
 @return UIFont
 */
+ (UIFont *)cl_fitItalicSystemFontOfSize:(CGFloat)fontSize;

/**
 自适应UI设计师所提供的1920*1080的UI设计图系统斜体文字大小
 
 @param fontSize CGFloat, 文字大小
 @return UIFont
 */
+ (UIFont *)cl_fitPlusItalicSystemFontOfSize:(CGFloat)fontSize;
    
/**
 设置UIFont的Size和Weight, 自适应UI设计师所提供的1334*750的UI设计图自定义字体大小

 @param fontSize CGFloat, 文字大小
 @param weight UIFontWeight
 @return UIFont
 */
+ (UIFont *)cl_fitSystemFontOfSize:(CGFloat)fontSize
                            weight:(UIFontWeight)weight NS_AVAILABLE_IOS(8_2);
    
/**
 设置UIFont的Size和Weight, 自适应UI设计师所提供的1920*1080的UI设计图自定义字体大小
 
 @param fontSize CGFloat, 文字大小
 @param weight UIFontWeight
 @return UIFont
 */
+ (UIFont *)cl_fitPlusSystemFontOfSize:(CGFloat)fontSize
                                weight:(UIFontWeight)weight NS_AVAILABLE_IOS(8_2);
    
/**
 根据指定的Size和Weight返回UIFont, 自适应UI设计师所提供的1334*750的UI设计图自定义字体大小

 @param fontSize CGFloat, 文字大小
 @param weight UIFontWeight
 @return UIFont
 */
+ (UIFont *)cl_fitMonospacedDigitSystemFontOfSize:(CGFloat)fontSize
                                           weight:(UIFontWeight)weight NS_AVAILABLE_IOS(9_0);

/**
 根据指定的Size和Weight返回UIFont, 自适应UI设计师所提供的1920*1080的UI设计图自定义字体大小

 @param fontSize CGFloat, 文字大小
 @param weight UIFontWeight
 @return UIFont
 */
+ (UIFont *)cl_fitPlusMonospacedDigitSystemFontOfSize:(CGFloat)fontSize
                                               weight:(UIFontWeight)weight NS_AVAILABLE_IOS(9_0);
    
#pragma mark - 自定义字体
/**
 加载指定文件路径的字体, 支持: TTF, OTF格式

 @param path NSString
 @return BOOL
 */
+ (BOOL)cl_loadFontWithPath:(NSString *)path;

/**
 卸载指定文件路径的字体

 @param path NSString
 */
+ (void)cl_unloadFontWithPath:(NSString *)path;

/**
 加载指定NSData的字体, 支持: TTF, OTF格式

 @param data NSData
 @return UIFont
 */
+ (UIFont *)cl_loadFontWithData:(NSData *)data;

/**
 卸载由loadFontFromData:加载的字体

 @param font UIFont
 @return BOOL
 */
+ (BOOL)cl_unloadFontWithData:(UIFont *)font;

/**
 自适应UI设计师所提供的1334*750的UI设计图自定义字体大小

 @param name NSString, 字体名称
 @param fontSize CGFloat, 文字大小
 @return UIFont
 */
+ (UIFont *)cl_fitCustomFontWithName:(NSString *)name
                            fontSize:(CGFloat)fontSize;

/**
 自适应UI设计师所提供的1920*1080的UI设计图自定义字体大小
 
 @param name NSString, 字体名称
 @param fontSize CGFloat, 文字大小
 @return UIFont
 */
+ (UIFont *)cl_fitPlusCustomFontWithName:(NSString *)name
                                fontSize:(CGFloat)fontSize;
@end
NS_ASSUME_NONNULL_END
