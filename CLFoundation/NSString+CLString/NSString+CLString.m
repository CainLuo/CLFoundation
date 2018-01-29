//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  NSString+CLString.m
//
//  Created by Cain on 2017/7/28.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "NSString+CLString.h"
#import "NSString+CLRegular.h"

@implementation NSString (CLString)

+ (NSInteger)cl_getNumberWithString:(NSString *)string {
    
    NSCharacterSet *characterSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    
    return [[string stringByTrimmingCharactersInSet:characterSet] intValue];
}

+ (NSString*)cl_getSecrectStringWithPhoneNumber:(NSString *)phoneNumber {
    
    NSMutableString *newStr = [NSMutableString stringWithString:phoneNumber];
    
    NSRange range = NSMakeRange(3, 4);
    
    [newStr replaceCharactersInRange:range
                          withString:@"****"];
    
    return newStr;
}

+ (NSString *)cl_getSecrectStringWithCardNumber:(NSString *)cardNumber {
    
    NSMutableString *newStr = [NSMutableString stringWithString:cardNumber];
    
    NSRange range = NSMakeRange(4, 8);
    
    if (newStr.length > 12) {
        
        [newStr replaceCharactersInRange:range withString:@" **** **** "];
    }
    
    return newStr;
}

- (CGFloat)cl_heightWithFontSize:(CGFloat)fontSize
                           width:(CGFloat)width {
    
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    
    return  [self boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                            attributes:attributes
                               context:nil].size.height;
}

- (NSString *)cl_removeUnwantedZero {
    
    if ([[self substringWithRange:NSMakeRange(self.length - 3, 3)] isEqualToString:@"000"]) {
        
        return [self substringWithRange:NSMakeRange(0, self.length - 4)]; // 多一个小数点
        
    } else if ([[self substringWithRange:NSMakeRange(self.length - 2, 2)] isEqualToString:@"00"]) {
        
        return [self substringWithRange:NSMakeRange(0, self.length - 2)];
        
    } else if ([[self substringWithRange:NSMakeRange(self.length - 1, 1)] isEqualToString:@"0"]) {
        
        return [self substringWithRange:NSMakeRange(0, self.length - 1)];
    } else {
        return self;
    }
}

- (NSString *)cl_trimmedString {
    
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
}

+ (NSString *)cl_stringMobileFormat:(NSString *)phoneNumber {
    
    return [self cl_stringMobileFormat:phoneNumber
                             separator:@" "];
}

+ (NSString *)cl_stringMobileFormat:(NSString *)phoneNumber
                          separator:(NSString *)separator {
    
    if ([phoneNumber cl_checkPhoneNumber]) {
        
        NSMutableString *value = [[NSMutableString alloc] initWithString:phoneNumber];
        
        [value insertString:separator
                    atIndex:3];
        [value insertString:separator
                    atIndex:8];
        
        return value;
    }
    
    return nil;
}

+ (NSString *)cl_stringUnitFormat:(CGFloat)value
                       unitString:(NSString *)unitString {
    
    if (value / 100000000 >= 1) {
        
        return [NSString stringWithFormat:@"%.0f%@", value / 100000000, unitString];
        
    } else if (value / 10000 >= 1 && value / 100000000 < 1) {
        
        return [NSString stringWithFormat:@"%.0f%@", value / 10000, unitString];
        
    } else {
        
        return [NSString stringWithFormat:@"%.0f", value];
    }
}


+ (CGSize)cl_measureSinglelineStringSize:(NSString *)string
                                    font:(UIFont *)font {
    
    if (string == nil) return CGSizeZero;
    
    CGSize measureSize = [string boundingRectWithSize:CGSizeMake(0, 0)
                                              options:NSStringDrawingUsesFontLeading
                                           attributes:[NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil]
                                              context:nil].size;

    return measureSize;
}

+ (CGFloat)cl_measureSinglelineStringWidth:(NSString *)string
                                      font:(UIFont *)font {
 
    if (string == nil) return 0;
    
    CGSize measureSize = [string boundingRectWithSize:CGSizeMake(0, 0)
                                              options:NSStringDrawingUsesFontLeading
                                           attributes:[NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil]
                                              context:nil].size;

    return ceil(measureSize.width);
}

+ (CGFloat)cl_measureMutilineStringHeight:(NSString *)string
                                     font:(UIFont *)font
                                    width:(CGFloat)width {
    
    if (string == nil || width <= 0) return 0;
    
    CGSize measureSize = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:[NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil]
                                              context:nil].size;

    return ceil(measureSize.height);
}

@end
