//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  NSString+CLRegular.m
//
//  Created by Cain on 2016/12/7.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import "NSString+CLRegular.h"

@implementation NSString (CLRegular)

#pragma mark - Test Numbers
// 1
- (BOOL)cl_isNumber {
    
    NSString *rules = @"^[0-9]*$";
    
    return [self cl_regularWithRule:rules];
}

// 2
- (BOOL)cl_checkMoreNumber:(NSInteger)quantity {
    
    NSString *rules = [NSString stringWithFormat:@"^\\d{%ld}$", (long)quantity];
    
    return [self cl_regularWithRule:rules];
}

// 3
- (BOOL)cl_checkAtLeastNumber:(NSInteger)quantity {
    
    NSString *rules = [NSString stringWithFormat:@"^\\d{%ld,}$", (long)quantity];
    
    return [self cl_regularWithRule:rules];
}

// 4
- (BOOL)cl_checkLimitsNumber:(NSInteger)fistNumber
                  lastNumber:(NSInteger)lastNumber {
    
    NSString *rules = [NSString stringWithFormat:@"^\\d{%ld,%ld}$", (long)fistNumber, (long)lastNumber];
    
    return [self cl_regularWithRule:rules];
}

// 5
- (BOOL)cl_isNonZeroStartNumber {
    
    NSString *rules = @"^(0|[1-9][0-9]*)$";
    
    return [self cl_regularWithRule:rules];
}

// 6
- (BOOL)cl_isNonZeroStartNumberHaveOneOrTwoDecimal {
    
    NSString *rules = @"^([1-9][0-9]*)+(.[0-9]{1,2})?$";
    
    return [self cl_regularWithRule:rules];
}

// 7
- (BOOL)cl_isHaveOneOrTwoDecimalPositiveOrNegative {
    
    NSString *rules = @"^(\\-)?\\d+(\\.\\d{1,2})?$";
    
    return [self cl_regularWithRule:rules];
}

// 8
- (BOOL)cl_realContainDecimal {
    
    NSString *rules = @"^(\\-|\\+)?\\d+(\\.\\d+)?$";
    
    return [self cl_regularWithRule:rules];
}

// 9
- (BOOL)cl_isPositiveRealHaveTwoDecimal {
    
    NSString *rules = @"^[0-9]+(.[0-9]{2})?$";
    
    return [self cl_regularWithRule:rules];
}

// 10
- (BOOL)cl_isHaveOneOrThreeDecimalPositiveOrNegative {
    
    NSString *rules = @"^[0-9]+(.[0-9]{1,3})?$";
    
    return [self cl_regularWithRule:rules];
}

// 11
- (BOOL)cl_isNonZeroPositiveInteger {
    
    NSString *rules = @"^[1-9]\\d*$";
    
    return [self cl_regularWithRule:rules];
}

// 12
- (BOOL)cl_isNonZeroNegativeInteger {
    
    NSString *rules = @"^-[1-9]\\d*$";
    
    return [self cl_regularWithRule:rules];
}

// 13
- (BOOL)cl_isNonNegativeInteger {
    
    NSString *rules = @"^\\d+$";
    
    return [self cl_regularWithRule:rules];
}

// 14
- (BOOL)cl_isNonPositiveInteger {
    
    NSString *rules = @"^-[1-9]\\d*";
    
    return [self cl_regularWithRule:rules];
}

// 15
- (BOOL)cl_isNonNegativeFloat {
    
    NSString *rules = @"^\\d(\\.\\d+)?$";
    
    return [self cl_regularWithRule:rules];
}

// 16
- (BOOL)cl_isNonPositiveFloat {
    
    NSString *rules = @"^((-\\d+(\\.\\d+)?)|(0+(\\.0+)?))$";
    
    return [self cl_regularWithRule:rules];
}

// 17
- (BOOL)cl_isPositiveFloat {
    
    NSString *rules = @"^[1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*$";
    
    return [self cl_regularWithRule:rules];
}

// 18
- (BOOL)cl_isNagativeFloat {
    
    NSString *rules = @"^-([1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*)$";
    
    return [self cl_regularWithRule:rules];
}

// 19
- (BOOL)cl_isFloat {
    
    NSString *rules = @"^(-?\\d+)(\\.\\d+)?$";
    
    return [self cl_regularWithRule:rules];
}

#pragma mark - Test String
// 1
- (BOOL)cl_isChineseCharacter {
    
    NSString *rules = @"^[\u4e00-\u9fa5]{0,}$";
    
    return [self cl_regularWithRule:rules];
}

// 2
- (BOOL)cl_isEnglishAndNumbers {
    
    NSString *rules = @"^[A-Za-z0-9]+$";
    
    return [self cl_regularWithRule:rules];
}

// 3
- (BOOL)cl_limitinglength:(NSInteger)fistRange
                lastRange:(NSInteger)lastRange {
    
    NSString *rules = [NSString stringWithFormat:@"^.{%ld,%ld}$", (long)fistRange, (long)lastRange];
    
    return [self cl_regularWithRule:rules];
}

// 4
- (BOOL)cl_checkString:(NSInteger)length {
    
    NSString *rules = @"^[A-Za-z0-9]+$";
    
    if (self.length == length) {
        
        return [self cl_regularWithRule:rules];
    }
    
    return NO;
}

// 5
- (BOOL)cl_isLettersString {
    
    NSString *rules = @"^[A-Za-z]+$";
    
    return [self cl_regularWithRule:rules];
}

// 6
- (BOOL)cl_isCapitalLetters {
    
    NSString *rules = @"^[A-Z]+$";
    
    return [self cl_regularWithRule:rules];
}

// 7
- (BOOL)cl_isLowercaseLetters {
    
    NSString *rules = @"^[a-z]+$";
    
    return [self cl_regularWithRule:rules];
}

// 8
- (BOOL)cl_isNumbersAndLettersOrUnderlineString {
    
    NSString *rules = @"^\\w+$";
    
    return [self cl_regularWithRule:rules];
}

// 9
- (BOOL)cl_isChineseCharacterAndEnglishAndNumbersAndUnderlineString {
    
    NSString *rules = @"^[\u4E00-\u9FA5A-Za-z0-9_]+$";
    
    return [self cl_regularWithRule:rules];
}

// 10
- (BOOL)cl_isDoesNotContainUnderscoresChineseCharacterAndEnglishAndNumbersString {
    
    NSString *rules = @"^[\u4E00-\u9FA5A-Za-z0-9]+$";
    
    return [self cl_regularWithRule:rules];
}

// 11
- (BOOL)cl_isContainSpecialCharacterString {
    
    NSString *rules = @"[^%&',;=?$\x22]+";
    
    return [self cl_regularWithRule:rules];
}

// 12
- (BOOL)cl_isContainCharacter:(NSString *)charater{
    
    NSString *rules = [NSString stringWithFormat:@"[^%@\x22]+", charater];
    
    return [self cl_regularWithRule:rules];
}

- (BOOL)cl_isLetterStar {
    
    NSString *rules = @"^[a-zA-Z][a-zA-Z0-9_]*$";
    
    return [self cl_regularWithRule:rules];
}

// 14
- (BOOL)cl_checkStringIsStrong {
    
    NSString *rules = @"^\\w*(?=\\w*\\d)(?=\\w*[a-zA-Z])\\w*$";
    
    return [self cl_regularWithRule:rules];
}

#pragma mark - Special Needs
// 1
- (BOOL)cl_checkEmailAddress {
    
    NSString *rules = @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
    
    return [self cl_regularWithRule:rules];
}

// 2
- (BOOL)cl_checkDomainName {
    
    NSString *rules = @"[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(/.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+/.?";
    
    return [self cl_regularWithRule:rules];
}

// 3
- (BOOL)cl_checkURL {
    
    NSString *rules = @"^(http|https|ftp)\\://([a-zA-Z0-9\\.\\-]+(\\:[a-zA-Z0-9\\.&amp;%\\$\\-]+)*@)?((25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])|([a-zA-Z0-9\\-]+\\.)*[a-zA-Z0-9\\-]+\\.[a-zA-Z]{2,4})(\\:[0-9]+)?(/[^/][a-zA-Z0-9\\.\\,\\?\'\\/\\+&amp;%\\$#\\=~_\\-@]*)*$";
    
    return [self cl_regularWithRule:rules];
}

// 4
- (BOOL)cl_checkPhoneNumber {
    
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     * 联通号段: 130,131,132,155,156,185,186,145,176,1709
     * 电信号段: 133,153,180,181,189,177,1700
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|70)\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     */
    NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
    /**
     * 中国联通：China Unicom
     * 130,131,132,155,156,185,186,145,176,1709
     */
    NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
    /**
     * 中国电信：China Telecom
     * 133,153,180,181,189,177,1700
     */
    NSString *CT = @"(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    return [self cl_regularWithRule:MOBILE] ||
           [self cl_regularWithRule:CM] ||
           [self cl_regularWithRule:CU] ||
           [self cl_regularWithRule:CT] ||
           [self cl_regularWithRule:PHS];
}

// 5
- (BOOL)cl_checkChinaMobelPhoneNumber {
    
    NSString *rules = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
    
    return [self cl_regularWithRule:rules];
}

// 6
- (BOOL)cl_checkChinaUnicomPhoneNumber {
    
    NSString *rules = @"(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
    
    return [self cl_regularWithRule:rules];
}

// 7
- (BOOL)cl_checkChinaTelecomPhoneNumber {
    
    NSString *rules = @"(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
    
    return [self cl_regularWithRule:rules];
}

// 8
- (BOOL)cl_checkTelePhoneNumber {
    
    NSString *rules = @"^(\\(\\d{3,4}-)|\\d{3.4}-)?\\d{7,8}$";
    
    return [self cl_regularWithRule:rules];
}

// 9
- (BOOL)cl_checkDomesticPhoneNumber {
    
    NSString *rules = @"\\d{3}-\\d{8}|\\d{4}-\\d{7}";
    
    return [self cl_regularWithRule:rules];
}

// 10
- (BOOL)cl_checkIdentityCard {
    
    NSString *rules = @"^\\d{15}|\\d{18}$";
    
    return [self cl_regularWithRule:rules];
}

// 11
- (BOOL)cl_checkShortIdentityCard {
    
    NSString *rules = @"^([0-9]){7,18}(x|X)?$";
    
    return [self cl_regularWithRule:rules];
}

// 12
- (BOOL)cl_checkAccount {
    
    NSString *rules = @"^[a-zA-Z][a-zA-Z0-9_]{4,15}$";
    
    return [self cl_regularWithRule:rules];
}

// 13
- (BOOL)cl_checkPassword {
    
    NSString *rules = @"^[a-zA-Z]\\w{5,17}$";
    
    return [self cl_regularWithRule:rules];
}

// 14
- (BOOL)cl_checkStrongPassword:(NSInteger)briefest
                       longest:(NSInteger)longest {
    
    NSString *rules = [NSString stringWithFormat:@"^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{%ld,%ld}$", (long)briefest, (long)longest];
    
    return [self cl_regularWithRule:rules];
}

// 15
- (BOOL)cl_checkChinaDateFormat {
    
    NSString *rules = @"^\\d{4}-\\d{1,2}-\\d{1,2}";
    
    return [self cl_regularWithRule:rules];
}

// 16
- (BOOL)cl_checkAbroadDateFormat {
    
    NSString *rules = @"^\\d{1,2}-\\d{1,2}-\\d{4}";
    
    return [self cl_regularWithRule:rules];
}

// 17
- (BOOL)cl_checkMonth {
    
    NSString *rules = @"^(0?[1-9]|1[0-2])$";
    
    return [self cl_regularWithRule:rules];
}

// 18
- (BOOL)cl_checkDay {
    
    NSString *rules = @"^((0?[1-9])|((1|2)[0-9])|30|31)$";
    
    return [self cl_regularWithRule:rules];
}

// 25
- (BOOL)cl_checkXMLFile {
    
    NSString *rules = @"^([a-zA-Z]+-?)+[a-zA-Z0-9]+\\.[x|X][m|M][l|L]$";
    
    return [self cl_regularWithRule:rules];
}

// 26
- (BOOL)cl_checkChineseCharacter {
    
    NSString *rules = @"[\u4e00-\u9fa5]";
    
    return [self cl_regularWithRule:rules];
}

// 27
- (BOOL)cl_checkDoubleByteCharacters {
    
    NSString *rules = @"[^\\x00-\\xff]";
    
    return [self cl_regularWithRule:rules];
}

// 28
- (BOOL)cl_checkBlankLines {
    
    NSString *rules = @"\\n\\s*\\r";
    
    return [self cl_regularWithRule:rules];
}

// 29
- (BOOL)cl_checkHTMLSign {
    
    NSString *rules = @"<(\\S*?)[^>]*>.*?</\\1>|<.*? />";
    
    return [self cl_regularWithRule:rules];
}

// 30
- (BOOL)cl_checkFirstAndLastSpaceCharacters {
    
    NSString *rules = @"^\\s*|\\s*$或(^\\s*)|(\\s*$)";
    
    return [self cl_regularWithRule:rules];
}

// 31
- (BOOL)cl_checkQQNumber {
    
    NSString *rules = @"[1-9][0-9]{4,}";
    
    return [self cl_regularWithRule:rules];
}

// 32
- (BOOL)cl_checkPostalCode {
    
    NSString *rules = @"[1-9]\\d{5}(?!\\d)";
    
    return [self cl_regularWithRule:rules];
}

// 33
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
