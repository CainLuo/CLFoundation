//
//  NSNumber+CLNumber.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/25.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "NSNumber+CLNumber.h"

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

@end
