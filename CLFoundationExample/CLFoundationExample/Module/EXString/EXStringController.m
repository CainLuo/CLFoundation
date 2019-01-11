//
//  EXStringController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/15.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXStringController.h"

@interface EXStringController ()

@end

@implementation EXStringController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_async(dispatch_get_global_queue(0, DISPATCH_QUEUE_PRIORITY_DEFAULT), ^{
        
        [self ex_filterString];
        [self ex_formatString];
        [self ex_calculateString];
        [self ex_transformString];
        [self ex_encryptionString];
        [self ex_getStringCharactorOrPinYin];
        [self ex_checkString];

        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self ex_reloadTextView];
        });
    });
}

#pragma mark - 过滤字符串
- (void)ex_filterString {
    
    NSString *ex_baseString = @"a3b2c13d4e5fg98098";
    NSString *ex_specialString = @" abcddcba ";

    [self.ex_textViewString appendString:@"\n----------字符串过滤----------\n"];
    [self.ex_textViewString appendFormat:@"获取\"%@\"过滤后获得的数字为: %@\n\n", ex_baseString, [NSString cl_getNumberWithString:ex_baseString]];
    [self.ex_textViewString appendFormat:@"获取\"%@\"过滤后获得的字符串为: \"%@\"\n\n", ex_specialString, [ex_specialString cl_trimmedString]];
}

#pragma mark - 格式化字符串
- (void)ex_formatString {
    
    NSString *ex_cradNumber = @"1234567890987654321";
    
    [self.ex_textViewString appendString:@"\n----------字符串格式化----------\n"];
    [self.ex_textViewString appendFormat:@"屏蔽银行卡号\"%@\"中间八位数: %@\n", ex_cradNumber, [NSString cl_getSecrectStringWithCardNumber:ex_cradNumber]];

    NSString *ex_unwantedZero = @"10.000000";
    
    [self.ex_textViewString appendFormat:@"删除\"%@\"运费结尾的小数0: %@\n", ex_unwantedZero, [ex_unwantedZero cl_removeUnwantedZero]];
    
    NSString *ex_empty = @" abcde ";
    
    [self.ex_textViewString appendFormat:@"删除\"%@\"前后空字符串: |%@|\n", ex_empty, [ex_empty cl_trimmedString]];
    
    NSString *ex_phoneNumber = @"13800138000";
    
    [self.ex_textViewString appendFormat:@"屏蔽\"%@\"号码中间四位数: %@\n", ex_phoneNumber, [NSString cl_getSecrectStringWithPhoneNumber:ex_phoneNumber]];
    [self.ex_textViewString appendFormat:@"格式化\"%@\"号码: %@\n", ex_phoneNumber, [NSString cl_stringMobileFormat:ex_phoneNumber]];
    [self.ex_textViewString appendFormat:@"用指定的字符格式化\"%@\"号码: %@\n", ex_phoneNumber, [NSString cl_stringMobileFormat:ex_phoneNumber
                                                                                                                  separator:@"-"]];
    [self.ex_textViewString appendFormat:@"格式化数值: %@\n\n", [NSString cl_stringUnitFormat:100000.0
                                                                                 unitString:@"万"]];
    
    [self.ex_textViewString appendFormat:@"将十六进制0xFFFFFF转换成二进制为: %@\n\n", [NSString cl_formatBinaryWithHexadecimal:@"0xFFFFFF"]];
    [self.ex_textViewString appendFormat:@"将十进制100转换成二进制为: %@\n\n", [NSString cl_formatBinaryWithDecimal:3]];
    [self.ex_textViewString appendFormat:@"将二进制100转换成十进制为: %@\n\n", [NSString cl_formatDecimalWithBinary:@"100"]];
    [self.ex_textViewString appendFormat:@"将二进制01111转换成十六进制为: %@\n\n", [NSString cl_formatHexadecimalWithBinary:@"01111"]];
    [self.ex_textViewString appendFormat:@"将NSData转换成十六进制为: %@\n\n", [NSString cl_formatHexadecimalWithData:[NSData data]]];
    [self.ex_textViewString appendFormat:@"将十进制100转换成十六进制为: %@\n\n", [NSString cl_formatHexadecimalWithDecimal:100]];
}

#pragma mark - 计算字符串
- (void)ex_calculateString {
    
    NSString *ex_baseString = @"Hello Word";
    
    [self.ex_textViewString appendString:@"\n----------字体相关----------\n"];
    [self.ex_textViewString appendFormat:@"获取指定\"%@\"字号的高度: %f\n", ex_baseString, [ex_baseString cl_heightWithFont:[UIFont cl_fitSystemFontOfSize:20]
                                                                                                                width:ex_baseString.length]];
    
    [self.ex_textViewString appendFormat:@"计算30字号的字符串\"%@\"的Size: %@\n", ex_baseString, NSStringFromCGSize([NSString cl_measureStringSizeWithString:ex_baseString
                                                                                                                                                     font:[UIFont systemFontOfSize:30]])];
    [self.ex_textViewString appendFormat:@"计算30字号的字符串\"%@\"的宽度: %f\n", ex_baseString, [NSString cl_measureSingleLineStringWidthWithString:ex_baseString
                                                                                                                                            font:[UIFont systemFontOfSize:30]]];
    
    [self.ex_textViewString appendFormat:@"计算30字号的字符串\"%@\"的高度: %f\n\n", ex_baseString, [NSString cl_measureHeightWithMutilineString:ex_baseString
                                                                                                                                       font:[UIFont systemFontOfSize:30]
                                                                                                                                      width:142]];
    CGSize ex_stringSize = [NSString cl_measureStringWithString:ex_baseString
                                                           font:[UIFont systemFontOfSize:30]
                                                           size:CGSizeMake([UIScreen cl_getScreenWidth], 100)
                                                           mode:NSLineBreakByWordWrapping];
    
    [self.ex_textViewString appendFormat:@"根据指定的Size计算30字号的字符串\"%@\"的Size: %@\n\n", ex_baseString, NSStringFromCGSize(ex_stringSize)];
}

#pragma mark - 转换字符串
- (void)ex_transformString {
    
    NSDictionary *ex_dictionary = @{@"account":@"13800138000",
                                    @"password":@"123456"};
    
    [self.ex_textViewString appendString:@"\n----------字符串转换----------\n"];
    [self.ex_textViewString appendFormat:@"将\"%@\"转成URL字符串: %@\n", ex_dictionary, [NSString cl_urlQueryStringWithDictionary:ex_dictionary]];
    [self.ex_textViewString appendFormat:@"将\"%@\"转成JSON字符串: %@\n\n", ex_dictionary, [NSString cl_jsonStringWithObject:ex_dictionary]];
    
    NSString *ex_baseString   = @"Abcd 中文, 转义 a>b";
    NSString *ex_encodeString = [NSString cl_urlEncodeWithString:ex_baseString];
    
    [self.ex_textViewString appendFormat:@"将\"%@\"URL Encode字符串为: \"%@\"\n\n", ex_baseString, ex_encodeString];
    [self.ex_textViewString appendFormat:@"将\"%@\"URL Decode字符串为: \"%@\"\n\n", ex_encodeString, [NSString cl_urlDecodeWithString:ex_encodeString]];
    [self.ex_textViewString appendFormat:@"将\"%@\"转义HTML字符串为: \"%@\"\n\n", ex_baseString, [NSString cl_escapingHTMLWithString:ex_baseString]];
}

#pragma mark - 字符串加密
- (void)ex_encryptionString {
    
    NSString *ex_baseString   = @"Hello Word";
    NSString *ex_base64String = [NSString cl_encodingBase64WithString:ex_baseString];
    NSString *ex_encodingKey  = @"123";

    [self.ex_textViewString appendString:@"\n----------字符串加密----------\n"];
    [self.ex_textViewString appendFormat:@"将\"%@\"加密成Base 64: %@\n", ex_baseString, ex_base64String];
    [self.ex_textViewString appendFormat:@"解密\"%@\"为: %@\n", ex_base64String, [NSString cl_decodedBase64WithString:ex_base64String]];
    [self.ex_textViewString appendFormat:@"将\"%@\"加密成MD2: %@\n\n", ex_baseString, [NSString cl_encodingMD2WithString:ex_baseString]];
    [self.ex_textViewString appendFormat:@"将\"%@\"加密成MD4: %@\n\n", ex_baseString, [NSString cl_encodingMD4WithString:ex_baseString]];
    [self.ex_textViewString appendFormat:@"将\"%@\"加密成MD5: %@\n\n", ex_baseString, [NSString cl_encodingMD5WithString:ex_baseString]];
    [self.ex_textViewString appendFormat:@"使用HASH Key:%@ 将\"%@\"HASH加密成MD5: %@\n\n", ex_encodingKey, ex_baseString, [NSString cl_hmacEncodingMD5StringWithString:ex_baseString
                                                                                                                               key:ex_encodingKey]];

    [self.ex_textViewString appendFormat:@"将\"%@\"加密成SHA1: %@\n\n", ex_baseString, [NSString cl_encodingSHA1WithString:ex_baseString]];
    [self.ex_textViewString appendFormat:@"使用HASH Key:%@ 将\"%@\"HASH加密成SHA1: %@\n\n", ex_encodingKey, ex_baseString, [NSString cl_hmacEncodingSHA1StringWithString:ex_baseString
                                                                                                                                                                  key:ex_encodingKey]];

    [self.ex_textViewString appendFormat:@"将\"%@\"加密成SHA224: %@\n\n", ex_baseString, [NSString cl_encodingSHA224WithString:ex_baseString]];
    [self.ex_textViewString appendFormat:@"使用HASH Key:%@ 将\"%@\"HASH加密成SHA224: %@\n\n", ex_encodingKey, ex_baseString, [NSString cl_hmacEncodingSHA224StringWithString:ex_baseString
                                                                                                                                                                       key:ex_encodingKey]];

    [self.ex_textViewString appendFormat:@"将\"%@\"加密成SHA256: %@\n\n", ex_baseString, [NSString cl_encodingSHA256WithString:ex_baseString]];
    [self.ex_textViewString appendFormat:@"使用HASH Key:%@ 将\"%@\"HASH加密成SHA256: %@\n\n", ex_encodingKey, ex_baseString, [NSString cl_hmacEncodingSHA256StringWithString:ex_baseString
                                                                                                                                                                       key:ex_encodingKey]];

    [self.ex_textViewString appendFormat:@"将\"%@\"加密成SHA384: %@\n\n", ex_baseString, [NSString cl_encodingSHA384WithString:ex_baseString]];
    [self.ex_textViewString appendFormat:@"使用HASH Key:%@ 将\"%@\"HASH加密成SHA384: %@\n\n", ex_encodingKey, ex_baseString, [NSString cl_hmacEncodingSHA384StringWithString:ex_baseString
                                                                                                                                                                       key:ex_encodingKey]];

    [self.ex_textViewString appendFormat:@"将\"%@\"加密成SHA512: %@\n\n", ex_baseString, [NSString cl_encodingSHA512WithString:ex_baseString]];
    [self.ex_textViewString appendFormat:@"使用HASH Key:%@ 将\"%@\"HASH加密成SHA512: %@\n\n", ex_encodingKey, ex_baseString, [NSString cl_hmacEncodingSHA512StringWithString:ex_baseString
                                                                                                                                                                      key:ex_encodingKey]];
    
}

#pragma mark - 获取字符串/中文字符的首字母
- (void)ex_getStringCharactorOrPinYin {
    
    NSString *ex_baseString    = @"Hello Word";
    NSString *ex_chineseString = @"你好 世界";

    [self.ex_textViewString appendString:@"\n----------获取首字母----------\n"];
    [self.ex_textViewString appendFormat:@"获取\"%@\"的首字母: %@\n", ex_baseString, [NSString cl_getFirstCharactorWithString:ex_baseString]];
    [self.ex_textViewString appendFormat:@"获取中文字符\"%@\"的首字母: %@\n\n", ex_chineseString, [NSString cl_getFirstPinYinWithString:ex_chineseString]];
}

#pragma mark - 正则表达式
- (void)ex_checkString {
    
#pragma mark - 检测字符串
    NSString *ex_baseString             = @"Hello Word";
    NSString *ex_numberString           = @"12345";
    NSString *ex_floatString            = @"12345.0";
    NSString *ex_chineseString          = @"您好";
    NSString *ex_blankString            = @"您\n \r好";
    NSString *ex_spaceString            = @" 您好";
    NSString *ex_doubleByteString       = @"嗨";
    NSString *ex_englishOrNumbersString = @"123abcd";
    NSString *ex_lineString             = @"a_";
    NSString *ex_chineseLineString      = @"你好_a_1";

    [self.ex_textViewString appendString:@"\n----------数字的正则----------\n"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否为空: %@\n", ex_baseString, [NSString cl_checkEmptyWithString:ex_baseString] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否数字: %@\n", ex_baseString, [ex_baseString cl_isNumber] ? @"YES" : @"NO"];

    [self.ex_textViewString appendFormat:@"检测\"%@\"是否最多为5位数数字: %@\n", ex_numberString, [ex_numberString cl_checkMostNumber:5] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否至少为5位数数字: %@\n", ex_numberString, [ex_numberString cl_checkAtLeastNumber:5] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否至少为1位, 最多为6位的数字: %@\n", ex_numberString, [ex_numberString cl_checkLeastNumber:1 mostNumber:6] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是非0开头的数字: %@\n", ex_numberString, [ex_numberString cl_isNotZeroStartNumber] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是中文字符: %@\n", ex_chineseString, [ex_chineseString cl_checkChineseCharacter] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是双字节字符: %@\n", ex_doubleByteString, [ex_doubleByteString cl_checkDoubleByteCharacters] ? @"YES" : @"NO"];
    
#pragma mark - 整数
    [self.ex_textViewString appendString:@"\n----------整数相关的正则----------\n"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是非零的正整数数字: %@\n", ex_numberString, [ex_numberString cl_isNotZeroPositiveInteger] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是非零的负整数数字: %@\n", ex_numberString, [ex_numberString cl_isNotZeroNegativeInteger] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是正整数数字: %@\n", ex_numberString, [ex_numberString cl_isPositiveInteger] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是负整数数字: %@\n", ex_numberString, [ex_numberString cl_isNegativeInteger] ? @"YES" : @"NO"];
    
#pragma mark - 浮点数
    [self.ex_textViewString appendString:@"\n----------浮点数相关的正则----------\n"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是正浮点数字: %@\n", ex_floatString, [ex_floatString cl_isPositiveFloat] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是负浮点数字: %@\n", ex_floatString, [ex_floatString cl_isNagativeFloat] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是浮点数字: %@\n", ex_floatString, [ex_floatString cl_isFloat] ? @"YES" : @"NO"];

    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是纯汉字: %@\n", ex_chineseString, [ex_chineseString cl_isChineseCharacter] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是数字或26位英文字母组成: %@\n", ex_englishOrNumbersString, [ex_englishOrNumbersString cl_isEnglishOrNumbers] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是长度为7且由数字或26位英文字母组成: %@\n", ex_englishOrNumbersString, [ex_englishOrNumbersString cl_checkString:7] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是由26位英文字母组成: %@\n", ex_englishOrNumbersString, [ex_englishOrNumbersString cl_isLettersString] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是由26位大写英文字母组成: %@\n", ex_englishOrNumbersString, [ex_englishOrNumbersString cl_isCapitalLetters] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是由26位小写英文字母组成: %@\n", ex_englishOrNumbersString, [ex_englishOrNumbersString cl_isLowercaseLetters] ? @"YES" : @"NO"];
    
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是0~100的范围: %@\n", ex_englishOrNumbersString, [ex_englishOrNumbersString cl_limitinglength:0 lastRange:100] ? @"YES" : @"NO"];

    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是由数字, 字母或下划线组成: %@\n", ex_lineString, [ex_lineString cl_isNumbersOrLettersOrLineString] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是由汉字, 数字, 字母或下划线组成: %@\n", ex_chineseLineString, [ex_chineseLineString cl_isChineseCharacterOrEnglishOrNumbersOrLineString] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是由汉字, 数字或字母且不带特殊字符组成: %@\n", ex_chineseString, [ex_chineseString cl_isDoesSpecialCharactersString] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否可以输入特殊字符: %@\n", ex_chineseString, [ex_chineseString cl_isContainSpecialCharacterString] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否可以输入指定特殊字符: %@\n", ex_lineString, [ex_lineString cl_isContainCharacter:@"="] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是字母开头: %@\n", ex_lineString, [ex_lineString cl_isLetterStar] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是强组合: %@\n", ex_lineString, [ex_lineString cl_checkStringIsStrong] ? @"YES" : @"NO"];

#pragma mark - 号码相关
    NSString *ex_phoneNumber     = @"18923123423";
    NSString *ex_chinaMobel      = @"13800138000";
    NSString *ex_chinaUnicom     = @"13000130000";
    NSString *ex_chinaTelecom    = @"13300133000";
    NSString *ex_telePhone       = @"0101234567";
    NSString *ex_formatTelePhone = @"010-1234567";

    [self.ex_textViewString appendString:@"\n----------号码相关的正则----------\n"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是手机号码: %@\n", ex_phoneNumber, [ex_phoneNumber cl_checkPhoneNumber] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是移动手机号码: %@\n", ex_chinaMobel, [ex_chinaMobel cl_checkChinaMobelPhoneNumber] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是联通手机号码: %@\n", ex_chinaUnicom, [ex_chinaUnicom cl_checkChinaUnicomPhoneNumber] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是电信手机号码: %@\n", ex_chinaTelecom, [ex_chinaTelecom cl_checkChinaTelecomPhoneNumber] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是固话号码: %@\n", ex_telePhone, [ex_telePhone cl_checkTelePhoneNumber] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是格式化固话号码: %@\n", ex_formatTelePhone, [ex_formatTelePhone cl_checkFormatTelePhoneNumber] ? @"YES" : @"NO"];
    
#pragma mark - 身份证相关
    NSString *ex_identityNumber = @"12345678901234567X";

    [self.ex_textViewString appendString:@"\n----------身份证相关的正则----------\n"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是有效身份证号码: %@\n", ex_identityNumber, [ex_identityNumber cl_checkIdentityCard] ? @"YES" : @"NO"];
    
#pragma mark - 账号相关
    NSString *ex_accountString  = @"a1234567890_123";
    NSString *ex_passwordString = @"a1234567890_1";
    NSString *ex_strongPassword = @"1a234567890A";
    
    [self.ex_textViewString appendString:@"\n----------账号相关的正则----------\n"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是字母开头至少5位至多16位的账号(可含有\"_\"): %@\n", ex_accountString, [ex_accountString cl_checkAccount] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是字母开头至少6位至多18位的密码(可含有\"_\"): %@\n", ex_passwordString, [ex_passwordString cl_checkPassword] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否包含大小写字母至少6位至多12位的强密码: %@\n", ex_strongPassword, [ex_strongPassword cl_checkStrongPassword:6
                                                                                                                                                    longest:12] ? @"YES" : @"NO"];
    
#pragma mark - 日期相关
    NSString *ex_dateString  = @"2018-02-17";
    NSString *ex_monthString = @"02";
    NSString *ex_dayString   = @"31";

    [self.ex_textViewString appendString:@"\n----------日期相关的正则----------\n"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是中国日期: %@\n", ex_dateString, [ex_dateString cl_checkChinaDateFormat] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是国外日期: %@\n", ex_dateString, [ex_dateString cl_checkAbroadDateFormat] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是一年的12个月: %@\n", ex_monthString, [ex_monthString cl_checkMonth] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是有效天数: %@\n", ex_dayString, [ex_dayString cl_checkDay] ? @"YES" : @"NO"];

#pragma mark - 特殊正则
    NSString *ex_emailString  = @"abcd@123.com";
    NSString *ex_domainString = @"www.baidu.com";
    NSString *ex_urlString    = @"http://www.baidu.com";
    NSString *ex_xmlString    = @"<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
    NSString *ex_qqNumber     = @"10001";
    NSString *ex_codeNumber   = @"100101";
    NSString *ex_ipv4Number   = @"192.168.0.0";

    [self.ex_textViewString appendString:@"\n----------特殊正则----------\n"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是邮箱地址: %@\n", ex_emailString, [ex_emailString cl_checkEmailAddress] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是URL地址: %@\n", ex_urlString, [ex_urlString cl_checkURL] ? @"YES" : @"NO"];

    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是QQ号码: %@\n", ex_qqNumber, [ex_qqNumber cl_checkQQNumber] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是邮政编码: %@\n", ex_codeNumber, [ex_codeNumber cl_checkPostalCode] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是IPv4地址: %@\n", ex_ipv4Number, [ex_ipv4Number cl_checkIPv4InternetProtocol] ? @"YES" : @"NO"];
    
#warning 有疑问的正则
    
    [self.ex_textViewString appendString:@"\n----------有疑问的正则----------\n"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是含有空格: %@\n", ex_blankString, [ex_blankString cl_checkBlankLines] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否含有首尾空白字符: %@\n", ex_spaceString, [ex_spaceString cl_checkFirstAndLastSpaceCharacters] ? @"YES" : @"NO"];

    [self.ex_textViewString appendFormat:@"\n待解决的正则:\n检测\"%@\"是否是非0开头并且最多带两位小数的数字: %@\n", ex_numberString, [ex_numberString cl_isNotZeroStartNumberHaveOneOrTwoDecimal] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否带两位小数的数字: %@\n", ex_numberString, [ex_numberString cl_isHaveOneOrTwoDecimalPositiveOrNegative] ? @"YES" : @"NO"];
    
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是正数, 负数, 或带小数的数字: %@\n", ex_numberString, [ex_numberString cl_realContainDecimal] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否带两位小数的正实数数字: %@\n", ex_numberString, [ex_numberString cl_isPositiveRealHaveTwoDecimal] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否带1~3位小数的正实数数字: %@\n", ex_numberString, [ex_numberString cl_isHaveOneOrThreeDecimalPositiveOrNegative] ? @"YES" : @"NO"];

    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是域名地址: %@\n", ex_domainString, [ex_domainString cl_checkDomainName] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是XML字符串: %@\n", ex_xmlString, [ex_xmlString cl_checkXMLFile] ? @"YES" : @"NO"];
}

@end
