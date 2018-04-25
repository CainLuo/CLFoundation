//
//  NSNumber+CLNumber.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/25.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "NSNumber+CLNumber.h"
#import "NSString+CLString.h"

@implementation NSNumber (CLNumber)

#pragma mark - NSNumber显示字符串
+ (NSString *)cl_displayDecimalWithNumber:(NSNumber *)number
                                    digit:(NSUInteger)digit {
    
    NSNumberFormatter *cl_numberFormatter = [self cl_numberFormatterWithRoundingMode:NSNumberFormatterRoundHalfUp];
    
    cl_numberFormatter.numberStyle           = NSNumberFormatterDecimalStyle;
    cl_numberFormatter.maximumFractionDigits = digit;
    
    return [cl_numberFormatter stringFromNumber:number];
}

+ (NSString *)cl_displayCurrencyWithNumber:(NSNumber *)number
                                    digit:(NSUInteger)digit {
    
    NSNumberFormatter *cl_numberFormatter = [self cl_numberFormatterWithRoundingMode:NSNumberFormatterRoundHalfUp];
    
    cl_numberFormatter.numberStyle           = NSNumberFormatterCurrencyStyle;
    cl_numberFormatter.maximumFractionDigits = digit;
    
    return [cl_numberFormatter stringFromNumber:number];
}

+ (NSString *)cl_displayPercentWithNumber:(NSNumber *)number
                                    digit:(NSUInteger)digit {
    
    NSNumberFormatter *cl_numberFormatter = [self cl_numberFormatterWithRoundingMode:NSNumberFormatterRoundHalfUp];
    
    cl_numberFormatter.numberStyle           = NSNumberFormatterPercentStyle;
    cl_numberFormatter.maximumFractionDigits = digit;
    
    return [cl_numberFormatter stringFromNumber:number];
}

#pragma mark - NSNumber四舍五入
+ (NSNumber *)cl_roundingWithNumber:(NSNumber *)number
                              digit:(NSUInteger)digit {
    
    NSNumberFormatter *cl_numberFormatter = [self cl_numberFormatterWithRoundingMode:NSNumberFormatterRoundHalfUp];

    cl_numberFormatter.maximumFractionDigits = digit;
    cl_numberFormatter.minimumFractionDigits = digit;
    
    NSString *cl_numberString = [cl_numberFormatter stringFromNumber:number];
    
    return [NSNumber numberWithDouble:[cl_numberString doubleValue]];
}

+ (NSNumber *)cl_roundCeilingWithNumber:(NSNumber *)number
                                  digit:(NSUInteger)digit {
    
    NSNumberFormatter *cl_numberFormatter = [self cl_numberFormatterWithRoundingMode:NSNumberFormatterRoundCeiling];

    cl_numberFormatter.maximumFractionDigits = digit;
    
    NSString *cl_numberString = [cl_numberFormatter stringFromNumber:number];
    
    return [NSNumber numberWithDouble:[cl_numberString doubleValue]];
}

+ (NSNumber *)cl_roundFloorWithNumber:(NSNumber *)number
                                digit:(NSUInteger)digit {
    
    NSNumberFormatter *cl_numberFormatter = [self cl_numberFormatterWithRoundingMode:NSNumberFormatterRoundFloor];
    
    cl_numberFormatter.maximumFractionDigits = digit;
    
    NSString *cl_numberString = [cl_numberFormatter stringFromNumber:number];
    
    return [NSNumber numberWithDouble:[cl_numberString doubleValue]];
}

+ (NSNumberFormatter *)cl_numberFormatterWithRoundingMode:(NSNumberFormatterRoundingMode)roundingMode {
    
    NSNumberFormatter *cl_numberFormatter = [[NSNumberFormatter alloc] init];
    
    cl_numberFormatter.roundingMode = roundingMode;
    
    return cl_numberFormatter;
}

#pragma mark - NSNumber转换
+ (NSNumber *)cl_numberWithString:(NSString *)string {
    
    NSString *cl_string = [[string cl_trimmedString] lowercaseString];
    
    if ([NSString cl_checkEmptyWithString:cl_string]) {
        
        return nil;
    }
    
    static NSDictionary *cl_dictionary;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        cl_dictionary = @{@"true" :   @(YES),
                @"yes" :    @(YES),
                @"false" :  @(NO),
                @"no" :     @(NO),
                @"nil" :    [NSNull null],
                @"null" :   [NSNull null],
                @"<null>" : [NSNull null]};
    });
    
    NSNumber *cl_number = cl_dictionary[cl_string];
    
    if (cl_number != nil) {
        
        if (cl_number == (id)[NSNull null])  {
            return nil;
        }
        
        return cl_number;
    }
    
    // hex number
    NSInteger cl_sign = 0;
    
    if ([cl_string hasPrefix:@"0x"]) {
        cl_sign = 1;
        
    } else if ([cl_string hasPrefix:@"-0x"]) {
        cl_sign = -1;
        
    }
    
    if (cl_sign != 0) {
        
        NSScanner *scan = [NSScanner scannerWithString:cl_string];
        
        unsigned num = -1;
        
        BOOL cl_suc = [scan scanHexInt:&num];
        
        if (cl_suc) {
            
            return [NSNumber numberWithLong:((long)num * cl_sign)];
            
        } else {
            return nil;
        }
    }
    
    // normal number
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    return [formatter numberFromString:string];
}

@end
