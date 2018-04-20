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
#import "NSObject+CLObject.h"
#import "NSData+CLData.h"
#import <CommonCrypto/CommonDigest.h>

static char cl_base64EncodingTable[64] = {
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
    'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
    'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
    'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/'
};

@implementation NSString (CLString)

+ (NSString *)cl_getNumberWithString:(NSString *)string {
    
    NSMutableString *cl_string = [[NSMutableString alloc] init];

    for (NSInteger i = 0; i < string.length; i++) {
        
        NSString *cl_numberString = [string substringWithRange:NSMakeRange(i, 1)];
        
        if ([cl_numberString cl_isNumber]) {
            
            [cl_string appendString:cl_numberString];
        }
    }
    
    return cl_string;
}

+ (NSString *)cl_getSecrectStringWithPhoneNumber:(NSString *)phoneNumber {
    
    if (![phoneNumber cl_checkPhoneNumber]) {
        
        return nil;
    }
    
    NSMutableString *cl_phoneNumberString = [NSMutableString stringWithString:phoneNumber];
    
    NSRange cl_phoneNumberRange = NSMakeRange(3, 4);
    
    [cl_phoneNumberString replaceCharactersInRange:cl_phoneNumberRange
                                        withString:@"****"];
    
    return cl_phoneNumberString;
}

+ (NSString *)cl_getSecrectStringWithCardNumber:(NSString *)cardNumber {
    
    if (cardNumber.length < 8) {
        
        return nil;
    }
    
    NSMutableString *cl_cardNumber = [NSMutableString stringWithString:cardNumber];
    
    NSRange cl_cardRange = NSMakeRange(4, 8);
    
    [cl_cardNumber replaceCharactersInRange:cl_cardRange
                                 withString:@" **** **** "];

    return cl_cardNumber;
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
    
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)cl_removeStringCharacterWithCharacter:(NSString *)character {
    
    return [self stringByReplacingOccurrencesOfString:character
                                           withString:@""];
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


+ (CGSize)cl_measureStringSizeWithString:(NSString *)string
                                    font:(UIFont *)font {
    
    if ([self cl_checkEmptyWithString:string]) {
        
        return CGSizeZero;
    }
    
    CGSize measureSize = [string boundingRectWithSize:CGSizeMake(0, 0)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:[NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil]
                                              context:nil].size;

    return measureSize;
}

+ (CGFloat)cl_measureSingleLineStringWidthWithString:(NSString *)string
                                                font:(UIFont *)font {
 
    if ([self cl_checkEmptyWithString:string]) {
        
        return 0;
    }
    
    CGSize measureSize = [string boundingRectWithSize:CGSizeMake(0, 0)
                                              options:NSStringDrawingUsesFontLeading
                                           attributes:[NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil]
                                              context:nil].size;

    return ceil(measureSize.width);
}

+ (CGFloat)cl_measureHeightWithMutilineString:(NSString *)string
                                         font:(UIFont *)font
                                        width:(CGFloat)width {
    
    if ([self cl_checkEmptyWithString:string] || width <= 0) {
        
        return 0;
    }
    
    CGSize measureSize = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:[NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil]
                                              context:nil].size;

    return ceil(measureSize.height);
}

+ (NSString *)cl_urlQueryStringWithDictionary:(NSDictionary *)dictionary {
    
    NSMutableString *string = [NSMutableString string];
    
    for (NSString *key in [dictionary allKeys]) {
        
        if ([string length]) {
            
            [string appendString:@"&"];
        }
        CFStringRef escaped = CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)[[dictionary objectForKey:key] description],
                                                                      NULL,(CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                      kCFStringEncodingUTF8);
        [string appendFormat:@"%@=%@", key, escaped];
        CFRelease(escaped);
    }
    return string;
}

+ (NSString *)cl_jsonStringWithObject:(NSObject *)object {
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (jsonData == nil) {
#ifdef DEBUG
        NSLog(@"fail to get JSON from dictionary: %@, error: %@", self, error);
#endif
        return nil;
    }
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding];
    return jsonString;
}

+ (BOOL)cl_checkEmptyWithString:(NSString *)string {
    
    if (string == nil || string == NULL || [string isKindOfClass:[NSNull class]] || [string length] == 0 || [string isEqualToString: @"(null)"]) {
        
        return YES;
    }
    return NO;
}

#pragma mark - 加密字符串方法
+ (NSString *)cl_base64StringFromData:(NSData *)data
                               length:(NSUInteger)length {
    
    unsigned long ixtext, lentext;
    long ctremaining;
    unsigned char input[3], output[4];
    short i, charsonline = 0, ctcopy;
    const unsigned char *raw;
    
    NSMutableString *result;
    
    lentext = [data length];
    
    if (lentext < 1) {
        return @"";
    }
    result = [NSMutableString stringWithCapacity: lentext];
    
    raw = [data bytes];
    
    ixtext = 0;
    
    while (true) {
        ctremaining = lentext - ixtext;
        if (ctremaining <= 0) {
            break;
        }
        for (i = 0; i < 3; i++) {
            unsigned long ix = ixtext + i;
            if (ix < lentext) {
                input[i] = raw[ix];
            }
            else {
                input[i] = 0;
            }
        }
        output[0] = (input[0] & 0xFC) >> 2;
        output[1] = ((input[0] & 0x03) << 4) | ((input[1] & 0xF0) >> 4);
        output[2] = ((input[1] & 0x0F) << 2) | ((input[2] & 0xC0) >> 6);
        output[3] = input[2] & 0x3F;
        ctcopy = 4;
        
        switch (ctremaining) {
            case 1:
                ctcopy = 2;
                break;
            case 2:
                ctcopy = 3;
                break;
        }
        
        for (i = 0; i < ctcopy; i++) {
            
            [result appendString: [NSString stringWithFormat: @"%c", cl_base64EncodingTable[output[i]]]];
        }
        
        for (i = ctcopy; i < 4; i++) {
            
            [result appendString: @"="];
        }
        
        ixtext += 3;
        charsonline += 4;
        
        if ((length > 0) && (charsonline >= length)) {
            
            charsonline = 0;
        }
    }
    return result;
}

+ (NSString *)cl_encodingBase64WithString:(NSString *)string {
    
    NSData *cl_stringData = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *cl_encodedString = [cl_stringData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    return cl_encodedString;
}

+ (NSString *)cl_decodedBase64WithString:(NSString *)string {
    
    NSData *cl_stringData = [[NSData alloc] initWithBase64EncodedString:string
                                                                options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    NSString *cl_decodedString = [[NSString alloc] initWithData:cl_stringData
                                                       encoding:NSUTF8StringEncoding];
    return cl_decodedString;
}

#pragma mark - MD加密字符串
+ (NSString *)cl_encodingMD2WithString:(NSString *)string {
    
    return [[string dataUsingEncoding:NSUTF8StringEncoding] cl_encryptredMD2String];
}

+ (NSString *)cl_encodingMD4WithString:(NSString *)string {
    
    return [[string dataUsingEncoding:NSUTF8StringEncoding] cl_encryptredMD4String];
}

+ (NSString *)cl_encodingMD5WithString:(NSString *)string {
    
    return [[string dataUsingEncoding:NSUTF8StringEncoding] cl_encryptredMD5String];
}

+ (NSString *)cl_hmacEncodingMD5StringWithString:(NSString *)string
                                             key:(NSString *)key {
    
    return [[string dataUsingEncoding:NSUTF8StringEncoding] cl_hmacEncryptredMD5StringWithKey:key];
}

#pragma mark - SHA加密字符串
+ (NSString *)cl_encodingSHA1WithString:(NSString *)string {
    
    return [[string dataUsingEncoding:NSUTF8StringEncoding] cl_encryptredSHA1String];
}

+ (NSString *)cl_hmacEncodingSHA1StringWithString:(NSString *)string
                                              key:(NSString *)key {
    
    return [[string dataUsingEncoding:NSUTF8StringEncoding] cl_hmacEncryptredSHA1StringWithKey:key];
}

+ (NSString *)cl_encodingSHA224WithString:(NSString *)string {
    
    return [[string dataUsingEncoding:NSUTF8StringEncoding] cl_encryptredSHA224String];
}

+ (NSString *)cl_hmacEncodingSHA224StringWithString:(NSString *)string
                                                key:(NSString *)key {
    
    return [[string dataUsingEncoding:NSUTF8StringEncoding] cl_hmacEncryptredSHA224StringWithKey:key];
}

+ (NSString *)cl_encodingSHA256WithString:(NSString *)string {
    
    return [[string dataUsingEncoding:NSUTF8StringEncoding] cl_encryptredSHA256String];
}

+ (NSString *)cl_hmacEncodingSHA256StringWithString:(NSString *)string
                                                key:(NSString *)key {
    
    return [[string dataUsingEncoding:NSUTF8StringEncoding] cl_hmacEncryptredSHA256StringWithKey:key];
}

+ (NSString *)cl_encodingSHA384WithString:(NSString *)string {
    
    return [[string dataUsingEncoding:NSUTF8StringEncoding] cl_encryptredSHA384String];
}

+ (NSString *)cl_hmacEncodingSHA384StringWithString:(NSString *)string
                                                key:(NSString *)key {
    
    return [[string dataUsingEncoding:NSUTF8StringEncoding] cl_hmacEncryptredSHA384StringWithKey:key];
}

+ (NSString *)cl_encodingSHA512WithString:(NSString *)string {
    
    return [[string dataUsingEncoding:NSUTF8StringEncoding] cl_encryptredSHA512String];
}

+ (NSString *)cl_hmacEncodingSHA512StringWithString:(NSString *)string
                                                key:(NSString *)key {
    
    return [[string dataUsingEncoding:NSUTF8StringEncoding] cl_hmacEncryptredSHA512StringWithKey:key];
}

#pragma mark - 获取字符串首字母
+ (NSString *)cl_transformPinYinWithString:(NSString *)string {
    
    NSMutableString *cl_string = [string mutableCopy];
    
    CFStringTransform((CFMutableStringRef)cl_string,
                      NULL,
                      kCFStringTransformMandarinLatin,
                      NO);

    CFStringTransform((CFMutableStringRef)cl_string,
                      NULL,
                      kCFStringTransformStripDiacritics,
                      NO);
    
    return cl_string;
}

#pragma mark - NSString获取首字母
+ (NSString *)cl_getFirstCharactorWithString:(NSString *)string {
    
    NSString *cl_pinYin = [[self cl_transformPinYinWithString:string] uppercaseString];
    
    if (!cl_pinYin || [self cl_checkEmptyWithString:string]) {
        
        return @"#";
    }
    
    return [cl_pinYin substringToIndex:1];
}

+ (NSString *)cl_getFirstPinYinWithString:(NSString *)string {
    
    NSString *cl_pinYin = [[self cl_transformPinYinWithString:string] uppercaseString];
    
    if (!cl_pinYin || [self cl_checkEmptyWithString:string]) {
        
        return @"#";
    }
    
    cl_pinYin = [cl_pinYin substringToIndex:1];
    
    if ([cl_pinYin compare:@"A"] == NSOrderedAscending || [cl_pinYin compare:@"Z"] == NSOrderedDescending) {
        
        cl_pinYin = @"#";
    }
    
    return cl_pinYin;
}

#pragma mark - 正则表达式

- (BOOL)cl_realContainDecimal {
    
    NSString *rules = @"^(\\-|\\+)?\\d+(\\.\\d+)?$";
    
    return [self cl_regularWithRule:rules];
}

#pragma mark - 整数相关
- (BOOL)cl_isNumber {
    
    NSString *rules = @"^[0-9]*$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkMostNumber:(NSInteger)quantity {
    
    NSString *rules = [NSString stringWithFormat:@"^\\d{%ld}$", (long)quantity];
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkAtLeastNumber:(NSInteger)quantity {
    
    NSString *rules = [NSString stringWithFormat:@"^\\d{%ld,}$", (long)quantity];
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkLeastNumber:(NSInteger)leastNumber
                 mostNumber:(NSInteger)mostNumber {

    NSString *rules = [NSString stringWithFormat:@"^\\d{%ld,%ld}$", (long)leastNumber, (long)mostNumber];
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_isNotZeroStartNumber {
    
    NSString *rules = @"^(0|[1-9][0-9]*)$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_isNotZeroPositiveInteger {
    
    NSString *rules = @"^[1-9]\\d*$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_isNotZeroNegativeInteger {
    
    NSString *rules = @"^-[1-9]\\d*$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_isPositiveInteger {
    
    NSString *rules = @"^\\d+$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_isNegativeInteger {
    
    NSString *rules = @"^-[1-9]\\d*";
    
    return [self cl_regularWithRule:rules];
}

#pragma mark - 浮点数相关
- (BOOL)cl_isFloat {
    
    NSString *rules = @"^(-?\\d+)(\\.\\d+)?$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_isPositiveFloat {
    
    NSString *rules = @"^[1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_isNagativeFloat {
    
    NSString *rules = @"^-([1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*)$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_isNotZeroStartNumberHaveOneOrTwoDecimal {
    
    NSString *rules = @"^([1-9][0-9]*)+(.[0-9]{1,2})?$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_isHaveOneOrTwoDecimalPositiveOrNegative {
    
    NSString *rules = @"^(\\-)?\\d+(\\.\\d{1,2})?$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_isPositiveRealHaveTwoDecimal {
    
    NSString *rules = @"^[0-9]+(.[0-9]{2})?$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_isHaveOneOrThreeDecimalPositiveOrNegative {
    
    NSString *rules = @"^[0-9]+(.[0-9]{1,3})?$";
    
    return [self cl_regularWithRule:rules];
}

#pragma mark - 字符串相关
- (BOOL)cl_isChineseCharacter {
    
    NSString *rules = @"^[\u4e00-\u9fa5]{0,}$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_isEnglishOrNumbers {
    
    NSString *rules = @"^[A-Za-z0-9]+$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_limitinglength:(NSInteger)fistRange
                lastRange:(NSInteger)lastRange {
    
    NSString *rules = [NSString stringWithFormat:@"^.{%ld,%ld}$", (long)fistRange, (long)lastRange];
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkString:(NSInteger)length {
    
    NSString *rules = @"^[A-Za-z0-9]+$";
    
    if (self.length == length) {
        
        return [self cl_regularWithRule:rules];
    }
    
    return NO;
}

- (BOOL)cl_isLettersString {
    
    NSString *rules = @"^[A-Za-z]+$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_isCapitalLetters {
    
    NSString *rules = @"^[A-Z]+$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_isLowercaseLetters {
    
    NSString *rules = @"^[a-z]+$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_isNumbersOrLettersOrLineString {
    
    NSString *rules = @"^[A-Za-z0-9_]+$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_isChineseCharacterOrEnglishOrNumbersOrLineString {
    
    NSString *rules = @"^[\u4E00-\u9FA5A-Za-z0-9_]+$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_isDoesSpecialCharactersString {
    
    NSString *rules = @"^[\u4E00-\u9FA5A-Za-z0-9]+$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_isContainSpecialCharacterString {
    
    NSString *rules = @"[^%&',;=?$\x22]+";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_isContainCharacter:(NSString *)charater{
    
    NSString *rules = [NSString stringWithFormat:@"[^%@\x22]+", charater];
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_isLetterStar {
    
    NSString *rules = @"^[a-zA-Z][a-zA-Z0-9_]*$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkStringIsStrong {
    
    NSString *rules = @"^\\w*(?=\\w*\\d)(?=\\w*[a-zA-Z])\\w*$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkChineseCharacter {
    
    NSString *rules = @"[\u4e00-\u9fa5]";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkDoubleByteCharacters {
    
    NSString *rules = @"[^\\x00-\\xff]";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkBlankLines {
    
    NSString *rules = @"\\n\\s*\\r";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkFirstAndLastSpaceCharacters {
    
    NSString *rules = @"(^\\s*)|(\\s*$)";//@"^\\s*|\\s*$";
    
    return [self cl_regularWithRule:rules];
}

#pragma mark - 号码相关
- (BOOL)cl_checkPhoneNumber {
    
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     * 联通号段: 130,131,132,155,156,185,186,145,176,1709
     * 电信号段: 133,153,180,181,189,177,1700
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|70)\\d{8}$";
    
    return [self cl_regularWithRule:MOBILE] ||
           [self cl_checkChinaMobelPhoneNumber] ||
           [self cl_checkChinaUnicomPhoneNumber] ||
           [self cl_checkChinaTelecomPhoneNumber];
}

- (BOOL)cl_checkChinaMobelPhoneNumber {
    
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     */
    NSString *rules = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkChinaUnicomPhoneNumber {
    
    /**
     * 中国联通：China Unicom
     * 130,131,132,155,156,185,186,145,176,1709
     */
    NSString *rules = @"(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkChinaTelecomPhoneNumber {
    
    /**
     * 中国电信：China Telecom
     * 133,153,180,181,189,177,1700
     */
    NSString *rules = @"(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkTelePhoneNumber {
    
    /**
     * 大陆地区固话及小灵通
     * 区号：010,020,021,022,023,024,025,027,028,029
     * 号码：七位或八位
     */
    NSString *rules = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkFormatTelePhoneNumber {
    
    NSString *rules = @"^\\d{3}-\\d{8}|\\d{3}-\\d{7}|\\d{4}-\\d{7}|\\d{4}-\\d{8}";
    
    return [self cl_regularWithRule:rules];
}

#pragma mark - 身份证相关
- (BOOL)cl_checkIdentityCard {
    
    NSString *rules = @"^\\d{15}|\\d{18}$|^([0-9]){7,18}(x|X)?$";
    
    return [self cl_regularWithRule:rules];
}

#pragma mark - 账号相关
- (BOOL)cl_checkAccount {
    
    NSString *rules = @"^[a-zA-Z][a-zA-Z0-9_]{4,15}$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkPassword {
    
    NSString *rules = @"^[a-zA-Z]\\w{5,17}$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkStrongPassword:(NSInteger)briefest
                       longest:(NSInteger)longest {
    
    NSString *rules = [NSString stringWithFormat:@"^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{%ld,%ld}$", (long)briefest, (long)longest];
    
    return [self cl_regularWithRule:rules];
}

#pragma mark - 日期相关
- (BOOL)cl_checkChinaDateFormat {
    
    NSString *rules = @"^\\d{4}-\\d{1,2}-\\d{1,2}";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkAbroadDateFormat {
    
    NSString *rules = @"^\\d{1,2}-\\d{1,2}-\\d{4}";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkMonth {
    
    NSString *rules = @"^(0?[1-9]|1[0-2])$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkDay {
    
    NSString *rules = @"^((0?[1-9])|((1|2)[0-9])|30|31)$";
    
    return [self cl_regularWithRule:rules];
}

#pragma mark - 特殊正则
- (BOOL)cl_checkEmailAddress {
    
    NSString *rules = @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkDomainName {
    
    NSString *rules = @"[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(/.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+/.?";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkURL {
    
    NSString *rules = @"[a-zA-z]+://[^\\s]*";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkXMLFile {
    
    NSString *rules = @"^([a-zA-Z]+-?)+[a-zA-Z0-9]+\\.[x|X][m|M][l|L]$";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkHTMLSign {
    
    NSString *rules = @"<(\\S*?)[^>]*>.*?</\\1>|<.*? />";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkQQNumber {
    
    NSString *rules = @"[1-9][0-9]{4}";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkPostalCode {
    
    NSString *rules = @"[1-9]\\d{5}(?!\\d)";
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_checkIPv4InternetProtocol {
    
    NSString *rules = @"((?:(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d)\\.){3}(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d))";
    
    return [self cl_regularWithRule:rules];
}

#pragma mark - Rule Method
- (BOOL)cl_regularWithRule:(NSString *)rule {
    
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rule];
    
    return [stringPredicate evaluateWithObject:self];
}

@end
