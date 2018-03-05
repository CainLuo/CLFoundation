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
        
        [self cl_filterString];
        [self cl_formatString];
        [self cl_calculateString];
        [self cl_transformString];
        [self cl_encryptionString];
        [self cl_getStringCharactorOrPinYin];
        [self cl_checkString];

        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self ex_reloadTextView];
        });
    });
}

#pragma mark - 过滤字符串
- (void)cl_filterString {
    
    NSString *cl_baseString = @"a3b2c13d4e5fg98098";
    
    [self.ex_textViewString appendString:@"\n----------字符串过滤----------\n"];
    [self.ex_textViewString appendFormat:@"获取\"%@\"过滤后获得的数字为: %@\n\n", cl_baseString, [NSString cl_getNumberWithString:cl_baseString]];
}

#pragma mark - 格式化字符串
- (void)cl_formatString {
    
    NSString *cl_cradNumber = @"1234567890987654321";
    
    [self.ex_textViewString appendString:@"\n----------字符串格式化----------\n"];
    [self.ex_textViewString appendFormat:@"屏蔽银行卡号\"%@\"中间八位数: %@\n", cl_cradNumber, [NSString cl_getSecrectStringWithCardNumber:cl_cradNumber]];

    NSString *cl_unwantedZero = @"10.000000";
    
    [self.ex_textViewString appendFormat:@"删除\"%@\"运费结尾的小数0: %@\n", cl_unwantedZero, [cl_unwantedZero cl_removeUnwantedZero]];
    
    NSString *cl_empty = @" abcde ";
    
    [self.ex_textViewString appendFormat:@"删除\"%@\"前后空字符串: |%@|\n", cl_empty, [cl_empty cl_trimmedString]];
    
    NSString *cl_phoneNumber = @"13800138000";
    
    [self.ex_textViewString appendFormat:@"屏蔽\"%@\"号码中间四位数: %@\n", cl_phoneNumber, [NSString cl_getSecrectStringWithPhoneNumber:cl_phoneNumber]];
    [self.ex_textViewString appendFormat:@"格式化\"%@\"号码: %@\n", cl_phoneNumber, [NSString cl_stringMobileFormat:cl_phoneNumber]];
    [self.ex_textViewString appendFormat:@"用指定的字符格式化\"%@\"号码: %@\n", cl_phoneNumber, [NSString cl_stringMobileFormat:cl_phoneNumber
                                                                                                                  separator:@"-"]];
    [self.ex_textViewString appendFormat:@"格式化数值: %@\n\n", [NSString cl_stringUnitFormat:100000.0
                                                                                 unitString:@"万"]];
}

#pragma mark - 计算字符串
- (void)cl_calculateString {
    
    NSString *cl_baseString = @"Hello Word";
    
    [self.ex_textViewString appendString:@"\n----------字体相关----------\n"];
    [self.ex_textViewString appendFormat:@"获取指定\"%@\"字号的高度: %f\n", cl_baseString, [cl_baseString cl_heightWithFontSize:20
                                                                                                                       width:cl_baseString.length]];
    
    [self.ex_textViewString appendFormat:@"计算30字号的字符串\"%@\"的Size: %@\n", cl_baseString, NSStringFromCGSize([NSString cl_measureStringSizeWithString:cl_baseString
                                                                                                                                                     font:[UIFont systemFontOfSize:30]])];
    [self.ex_textViewString appendFormat:@"计算30字号的字符串\"%@\"的宽度: %f\n", cl_baseString, [NSString cl_measureSingleLineStringWidthWithString:cl_baseString
                                                                                                                                            font:[UIFont systemFontOfSize:30]]];
    
    [self.ex_textViewString appendFormat:@"计算30字号的字符串\"%@\"的高度: %f\n\n", cl_baseString, [NSString cl_measureHeightWithMutilineString:cl_baseString
                                                                                                                                       font:[UIFont systemFontOfSize:30]
                                                                                                                                      width:142]];
}

#pragma mark - 转换字符串
- (void)cl_transformString {
    
    NSDictionary *cl_dictionary = @{@"account":@"13800138000",
                                    @"password":@"123456"};
    
    [self.ex_textViewString appendString:@"\n----------字符串转换----------\n"];
    [self.ex_textViewString appendFormat:@"将\"%@\"转成URL字符串: %@\n", cl_dictionary, [NSString cl_urlQueryStringWithDictionary:cl_dictionary]];
    [self.ex_textViewString appendFormat:@"将\"%@\"转成JSON字符串: %@\n\n", cl_dictionary, [NSString cl_jsonStringWithObject:cl_dictionary]];
}

#pragma mark - 字符串加密
- (void)cl_encryptionString {
    
    NSString *cl_baseString   = @"Hello Word";
    NSString *cl_base64String = [NSString cl_encodingBase64WithString:cl_baseString];
    
    [self.ex_textViewString appendString:@"\n----------字符串加密----------\n"];
    [self.ex_textViewString appendFormat:@"将\"%@\"加密成Base 64: %@\n", cl_baseString, cl_base64String];
    [self.ex_textViewString appendFormat:@"解密\"%@\"为: %@\n", cl_base64String, [NSString cl_decodedBase64WithString:cl_base64String]];
    [self.ex_textViewString appendFormat:@"将\"%@\"加密成MD5: %@\n\n", cl_baseString, [NSString cl_encodingMD5WithString:cl_baseString]];
}

#pragma mark - 获取字符串/中文字符的首字母
- (void)cl_getStringCharactorOrPinYin {
    
    NSString *cl_baseString    = @"Hello Word";
    NSString *cl_chineseString = @"你好 世界";

    [self.ex_textViewString appendString:@"\n----------获取首字母----------\n"];
    [self.ex_textViewString appendFormat:@"获取\"%@\"的首字母: %@\n", cl_baseString, [NSString cl_getFirstCharactorWithString:cl_baseString]];
    [self.ex_textViewString appendFormat:@"获取中文字符\"%@\"的首字母: %@\n\n", cl_chineseString, [NSString cl_getFirstPinYinWithString:cl_chineseString]];
}

#pragma mark - 正则表达式
- (void)cl_checkString {
    
#pragma mark - 检测字符串
    NSString *cl_baseString             = @"Hello Word";
    NSString *cl_numberString           = @"12345";
    NSString *cl_floatString            = @"12345.0";
    NSString *cl_chineseString          = @"您好";
    NSString *cl_blankString            = @"您\n \r好";
    NSString *cl_spaceString            = @" 您好";
    NSString *cl_doubleByteString       = @"嗨";
    NSString *cl_englishOrNumbersString = @"123abcd";
    NSString *cl_lineString             = @"a_";
    NSString *cl_chineseLineString      = @"你好_a_1";

    [self.ex_textViewString appendString:@"\n----------数字的正则----------\n"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否为空: %@\n", cl_baseString, [NSString cl_checkEmptyWithString:cl_baseString] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否数字: %@\n", cl_baseString, [cl_baseString cl_isNumber] ? @"YES" : @"NO"];

    [self.ex_textViewString appendFormat:@"检测\"%@\"是否最多为5位数数字: %@\n", cl_numberString, [cl_numberString cl_checkMostNumber:5] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否至少为5位数数字: %@\n", cl_numberString, [cl_numberString cl_checkAtLeastNumber:5] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否至少为1位, 最多为6位的数字: %@\n", cl_numberString, [cl_numberString cl_checkLeastNumber:1 mostNumber:6] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是非0开头的数字: %@\n", cl_numberString, [cl_numberString cl_isNotZeroStartNumber] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是中文字符: %@\n", cl_chineseString, [cl_chineseString cl_checkChineseCharacter] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是双字节字符: %@\n", cl_doubleByteString, [cl_doubleByteString cl_checkDoubleByteCharacters] ? @"YES" : @"NO"];

    
#pragma mark - 整数
    [self.ex_textViewString appendString:@"\n----------整数相关的正则----------\n"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是非零的正整数数字: %@\n", cl_numberString, [cl_numberString cl_isNotZeroPositiveInteger] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是非零的负整数数字: %@\n", cl_numberString, [cl_numberString cl_isNotZeroNegativeInteger] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是正整数数字: %@\n", cl_numberString, [cl_numberString cl_isPositiveInteger] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是负整数数字: %@\n", cl_numberString, [cl_numberString cl_isNegativeInteger] ? @"YES" : @"NO"];
    
#pragma mark - 浮点数
    [self.ex_textViewString appendString:@"\n----------浮点数相关的正则----------\n"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是正浮点数字: %@\n", cl_floatString, [cl_floatString cl_isPositiveFloat] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是负浮点数字: %@\n", cl_floatString, [cl_floatString cl_isNagativeFloat] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是浮点数字: %@\n", cl_floatString, [cl_floatString cl_isFloat] ? @"YES" : @"NO"];

    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是纯汉字: %@\n", cl_chineseString, [cl_chineseString cl_isChineseCharacter] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是数字或26位英文字母组成: %@\n", cl_englishOrNumbersString, [cl_englishOrNumbersString cl_isEnglishOrNumbers] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是长度为7且由数字或26位英文字母组成: %@\n", cl_englishOrNumbersString, [cl_englishOrNumbersString cl_checkString:7] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是由26位英文字母组成: %@\n", cl_englishOrNumbersString, [cl_englishOrNumbersString cl_isLettersString] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是由26位大写英文字母组成: %@\n", cl_englishOrNumbersString, [cl_englishOrNumbersString cl_isCapitalLetters] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是由26位小写英文字母组成: %@\n", cl_englishOrNumbersString, [cl_englishOrNumbersString cl_isLowercaseLetters] ? @"YES" : @"NO"];
    
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是0~100的范围: %@\n", cl_englishOrNumbersString, [cl_englishOrNumbersString cl_limitinglength:0 lastRange:100] ? @"YES" : @"NO"];

    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是由数字, 字母或下划线组成: %@\n", cl_lineString, [cl_lineString cl_isNumbersOrLettersOrLineString] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是由汉字, 数字, 字母或下划线组成: %@\n", cl_chineseLineString, [cl_chineseLineString cl_isChineseCharacterOrEnglishOrNumbersOrLineString] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是由汉字, 数字或字母且不带特殊字符组成: %@\n", cl_chineseString, [cl_chineseString cl_isDoesSpecialCharactersString] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否可以输入特殊字符: %@\n", cl_chineseString, [cl_chineseString cl_isContainSpecialCharacterString] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否可以输入指定特殊字符: %@\n", cl_lineString, [cl_lineString cl_isContainCharacter:@"="] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是字母开头: %@\n", cl_lineString, [cl_lineString cl_isLetterStar] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是强组合: %@\n", cl_lineString, [cl_lineString cl_checkStringIsStrong] ? @"YES" : @"NO"];

#pragma mark - 号码相关
    NSString *cl_phoneNumber     = @"18923123423";
    NSString *cl_chinaMobel      = @"13800138000";
    NSString *cl_chinaUnicom     = @"13000130000";
    NSString *cl_chinaTelecom    = @"13300133000";
    NSString *cl_telePhone       = @"0101234567";
    NSString *cl_formatTelePhone = @"010-1234567";

    [self.ex_textViewString appendString:@"\n----------号码相关的正则----------\n"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是手机号码: %@\n", cl_phoneNumber, [cl_phoneNumber cl_checkPhoneNumber] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是移动手机号码: %@\n", cl_chinaMobel, [cl_chinaMobel cl_checkChinaMobelPhoneNumber] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是联通手机号码: %@\n", cl_chinaUnicom, [cl_chinaUnicom cl_checkChinaUnicomPhoneNumber] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是电信手机号码: %@\n", cl_chinaTelecom, [cl_chinaTelecom cl_checkChinaTelecomPhoneNumber] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是固话号码: %@\n", cl_telePhone, [cl_telePhone cl_checkTelePhoneNumber] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是格式化固话号码: %@\n", cl_formatTelePhone, [cl_formatTelePhone cl_checkFormatTelePhoneNumber] ? @"YES" : @"NO"];
    
#pragma mark - 身份证相关
    NSString *cl_identityNumber = @"12345678901234567X";

    [self.ex_textViewString appendString:@"\n----------身份证相关的正则----------\n"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是有效身份证号码: %@\n", cl_identityNumber, [cl_identityNumber cl_checkIdentityCard] ? @"YES" : @"NO"];
    
#pragma mark - 账号相关
    NSString *cl_accountString  = @"a1234567890_123";
    NSString *cl_passwordString = @"a1234567890_1";
    NSString *cl_strongPassword = @"1a234567890A";
    
    [self.ex_textViewString appendString:@"\n----------账号相关的正则----------\n"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是字母开头至少5位至多16位的账号(可含有\"_\"): %@\n", cl_accountString, [cl_accountString cl_checkAccount] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是字母开头至少6位至多18位的密码(可含有\"_\"): %@\n", cl_passwordString, [cl_passwordString cl_checkPassword] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否包含大小写字母至少6位至多12位的强密码: %@\n", cl_strongPassword, [cl_strongPassword cl_checkStrongPassword:6
                                                                                                                                                    longest:12] ? @"YES" : @"NO"];
    
#pragma mark - 日期相关
    NSString *cl_dateString  = @"2018-02-17";
    NSString *cl_monthString = @"02";
    NSString *cl_dayString   = @"31";

    [self.ex_textViewString appendString:@"\n----------日期相关的正则----------\n"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是中国日期: %@\n", cl_dateString, [cl_dateString cl_checkChinaDateFormat] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是国外日期: %@\n", cl_dateString, [cl_dateString cl_checkAbroadDateFormat] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是一年的12个月: %@\n", cl_monthString, [cl_monthString cl_checkMonth] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是有效天数: %@\n", cl_dayString, [cl_dayString cl_checkDay] ? @"YES" : @"NO"];

#pragma mark - 特殊正则
    NSString *cl_emailString  = @"abcd@123.com";
    NSString *cl_domainString = @"www.baidu.com";
    NSString *cl_urlString    = @"http://www.baidu.com";
    NSString *cl_xmlString    = @"<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
    NSString *cl_qqNumber     = @"10001";
    NSString *cl_codeNumber   = @"100101";
    NSString *cl_ipv4Number   = @"192.168.0.0";

    [self.ex_textViewString appendString:@"\n----------特殊正则----------\n"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是邮箱地址: %@\n", cl_emailString, [cl_emailString cl_checkEmailAddress] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是URL地址: %@\n", cl_urlString, [cl_urlString cl_checkURL] ? @"YES" : @"NO"];

    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是QQ号码: %@\n", cl_qqNumber, [cl_qqNumber cl_checkQQNumber] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是邮政编码: %@\n", cl_codeNumber, [cl_codeNumber cl_checkPostalCode] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是IPv4地址: %@\n", cl_ipv4Number, [cl_ipv4Number cl_checkIPv4InternetProtocol] ? @"YES" : @"NO"];
    
#warning 有疑问的正则
    
    [self.ex_textViewString appendString:@"\n----------有疑问的正则----------\n"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是含有空格: %@\n", cl_blankString, [cl_blankString cl_checkBlankLines] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否含有首尾空白字符: %@\n", cl_spaceString, [cl_spaceString cl_checkFirstAndLastSpaceCharacters] ? @"YES" : @"NO"];

    [self.ex_textViewString appendFormat:@"\n待解决的正则:\n检测\"%@\"是否是非0开头并且最多带两位小数的数字: %@\n", cl_numberString, [cl_numberString cl_isNotZeroStartNumberHaveOneOrTwoDecimal] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否带两位小数的数字: %@\n", cl_numberString, [cl_numberString cl_isHaveOneOrTwoDecimalPositiveOrNegative] ? @"YES" : @"NO"];
    
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是正数, 负数, 或带小数的数字: %@\n", cl_numberString, [cl_numberString cl_realContainDecimal] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否带两位小数的正实数数字: %@\n", cl_numberString, [cl_numberString cl_isPositiveRealHaveTwoDecimal] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否带1~3位小数的正实数数字: %@\n", cl_numberString, [cl_numberString cl_isHaveOneOrThreeDecimalPositiveOrNegative] ? @"YES" : @"NO"];

    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是域名地址: %@\n", cl_domainString, [cl_domainString cl_checkDomainName] ? @"YES" : @"NO"];
    [self.ex_textViewString appendFormat:@"检测\"%@\"是否是XML字符串: %@\n", cl_xmlString, [cl_xmlString cl_checkXMLFile] ? @"YES" : @"NO"];
}

@end
