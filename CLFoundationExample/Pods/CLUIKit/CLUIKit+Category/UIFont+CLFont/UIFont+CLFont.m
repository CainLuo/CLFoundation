//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIFont+CLFont.m
//
//  Created by Cain Luo on 2017/12/18.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "UIFont+CLFont.h"
#import "UIScreen+CLScreen.h"
#import <CoreText/CoreText.h>

@implementation UIFont (CLFont)

+ (UIFont *)cl_fitSystemFontOfSize:(CGFloat)fontSize {
    
    return [UIFont systemFontOfSize:[UIScreen cl_fitScreen:fontSize]];
}
    
+ (UIFont *)cl_fitPlusSystemFontOfSize:(CGFloat)fontSize {
    
    return [UIFont systemFontOfSize:[UIScreen cl_fitPlusScreen:fontSize]];
}

+ (UIFont *)cl_fitBoldSystemFontOfSize:(CGFloat)fontSize {
    
    return [UIFont boldSystemFontOfSize:[UIScreen cl_fitScreen:fontSize]];
}

+ (UIFont *)cl_fitPlusBoldSystemFontOfSize:(CGFloat)fontSize {
    
    return [UIFont boldSystemFontOfSize:[UIScreen cl_fitPlusScreen:fontSize]];
}

+ (UIFont *)cl_fitItalicSystemFontOfSize:(CGFloat)fontSize {
    
    return [UIFont italicSystemFontOfSize:[UIScreen cl_fitScreen:fontSize]];
}

+ (UIFont *)cl_fitPlusItalicSystemFontOfSize:(CGFloat)fontSize {
    
    return [UIFont italicSystemFontOfSize:[UIScreen cl_fitPlusScreen:fontSize]];
}

+ (UIFont *)cl_fitSystemFontOfSize:(CGFloat)fontSize
                            weight:(UIFontWeight)weight NS_AVAILABLE_IOS(8_2) {

    return [UIFont systemFontOfSize:[UIScreen cl_fitScreen:fontSize]
                             weight:[UIScreen cl_fitScreen:weight]];
}

+ (UIFont *)cl_fitPlusSystemFontOfSize:(CGFloat)fontSize
                                weight:(UIFontWeight)weight NS_AVAILABLE_IOS(8_2) {
    
    return [UIFont systemFontOfSize:[UIScreen cl_fitPlusScreen:fontSize]
                             weight:[UIScreen cl_fitPlusScreen:weight]];
}

+ (UIFont *)cl_fitMonospacedDigitSystemFontOfSize:(CGFloat)fontSize
                                           weight:(UIFontWeight)weight NS_AVAILABLE_IOS(9_0) {
    
    return [UIFont monospacedDigitSystemFontOfSize:[UIScreen cl_fitScreen:fontSize]
                                            weight:[UIScreen cl_fitScreen:weight]];
}

+ (UIFont *)cl_fitPlusMonospacedDigitSystemFontOfSize:(CGFloat)fontSize
                                               weight:(UIFontWeight)weight NS_AVAILABLE_IOS(9_0) {
    
    return [UIFont monospacedDigitSystemFontOfSize:[UIScreen cl_fitPlusScreen:fontSize]
                                            weight:[UIScreen cl_fitPlusScreen:weight]];
}

#pragma mark - 自定义字体
+ (BOOL)cl_loadFontWithPath:(NSString *)path {
    
    NSURL *cl_url = [NSURL fileURLWithPath:path];
    
    CFErrorRef cl_errorRef;
    
    BOOL cl_success = CTFontManagerRegisterFontsForURL((__bridge CFTypeRef)cl_url, kCTFontManagerScopeNone, &cl_errorRef);
    
    return cl_success;
}

+ (void)cl_unloadFontWithPath:(NSString *)path {
    
    NSURL *cl_url = [NSURL fileURLWithPath:path];
    
    CTFontManagerUnregisterFontsForURL((__bridge CFTypeRef)cl_url, kCTFontManagerScopeNone, NULL);
}

+ (UIFont *)cl_loadFontWithData:(NSData *)data {
    
    CGDataProviderRef cl_dataProviderRef = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);
    
    if (!cl_dataProviderRef) {
        return nil;
    }
    
    CGFontRef cl_fontRef = CGFontCreateWithDataProvider(cl_dataProviderRef);
    CGDataProviderRelease(cl_dataProviderRef);
    
    if (!cl_fontRef) {
        return nil;
    }
    
    CFErrorRef cl_errorRef;
    
    BOOL cl_success = CTFontManagerRegisterGraphicsFont(cl_fontRef, &cl_errorRef);
    
    if (!cl_success) {
        
        CFRelease(cl_fontRef);
        
        NSLog(@"%@", cl_errorRef);
        
        return nil;
        
    } else {
        
        CFStringRef fontName = CGFontCopyPostScriptName(cl_fontRef);
        
        UIFont *font = [UIFont fontWithName:(__bridge NSString *)(fontName)
                                       size:[UIFont systemFontSize]];
        
        if (fontName) {
            
            CFRelease(fontName);
        }
        
        CGFontRelease(cl_fontRef);
        
        return font;
    }
}

+ (BOOL)cl_unloadFontWithData:(UIFont *)font {
    
    CGFontRef cl_fontRef = CGFontCreateWithFontName((__bridge CFStringRef)font.fontName);
    
    if (!cl_fontRef) {
        
        return NO;
    }
    
    CFErrorRef cl_errorRef;
    
    BOOL cl_success = CTFontManagerUnregisterGraphicsFont(cl_fontRef, &cl_errorRef);
    
    CFRelease(cl_fontRef);
    
    if (!cl_success) {
        
        NSLog(@"%@", cl_errorRef);
    }
    
    return cl_success;
}

+ (UIFont *)cl_fitCustomFontWithName:(NSString *)name
                            fontSize:(CGFloat)fontSize {
    
    return [UIFont fontWithName:name
                           size:[UIScreen cl_fitScreen:fontSize]];
}
    
+ (UIFont *)cl_fitPlusCustomFontWithName:(NSString *)name
                                fontSize:(CGFloat)fontSize {
    
    return [UIFont fontWithName:name
                           size:[UIScreen cl_fitPlusScreen:fontSize]];
}


@end
