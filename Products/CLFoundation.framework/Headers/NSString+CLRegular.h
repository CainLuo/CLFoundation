//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  NSString+CLRegular.h
//
//  Created by Cain on 2016/12/7.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CLRegular)

#pragma mark - Test Numbers
/**
 当前字符是否为数字

 @return bool
 */
- (BOOL)cl_isNumber;

/**
 当前字符是否为number位的数字

 @param quantity 限制数字的数量
 @return bool
 */
- (BOOL)cl_checkMoreNumber:(NSInteger)quantity;

/**
 当前字符是否为至少number位的数字

 @param quantity 至少数字的数量
 @return bool
 */
- (BOOL)cl_checkAtLeastNumber:(NSInteger)quantity;

/**
 当前字符是否为fistNumber-scondNumber位的数字

 @param fistNumber 开始
 @param lastNumber 结束
 @return bool
 */
- (BOOL)cl_checkLimitsNumber:(NSInteger)fistNumber lastNumber:(NSInteger)lastNumber;

/**
 当前字符是否为非零开头的数字

 @return bool
 */
- (BOOL)cl_isNonZeroStartNumber;

/**
 当前字符是否为非零开头的最多带两位小数的数字

 @return bool
 */
- (BOOL)cl_isNonZeroStartNumberHaveOneOrTwoDecimal;

/**
 当前字符是否为带1-2位小数的正数或负数

 @return bool
 */
- (BOOL)cl_isHaveOneOrTwoDecimalPositiveOrNegative;

/**
 当前字符是否为正数、负数、和小数

 @return bool
 */
- (BOOL)cl_realContainDecimal;

/**
 当前字符是否为有两位小数的正实数

 @return bool
 */
- (BOOL)cl_isPositiveRealHaveTwoDecimal;

/**
 当前字符是否为有1~3位小数的正实数

 @return bool
 */
- (BOOL)cl_isHaveOneOrThreeDecimalPositiveOrNegative;


/**
 当前字符是否为非零的正整数

 @return bool
 */
- (BOOL)cl_isNonZeroPositiveInteger;


/**
 当前字符是否为非零的负整数

 @return bool
 */
- (BOOL)cl_isNonZeroNegativeInteger;

/**
 当前字符是否为非负整数

 @return bool
 */
- (BOOL)cl_isNonNegativeInteger;


/**
 当前字符是否为非正整数

 @return bool
 */
- (BOOL)cl_isNonPositiveInteger;

#pragma mark - Test Float
/**
 当前字符是否为非负浮点数

 @return bool
 */
- (BOOL)cl_isNonNegativeFloat;


/**
 当前字符是否为非正浮点数

 @return bool
 */
- (BOOL)cl_isNonPositiveFloat;

/**
 当前字符是否为正浮点数

 @return bool
 */
- (BOOL)cl_isPositiveFloat;

/**
 当前字符是否为负浮点数

 @return bool
 */
- (BOOL)cl_isNagativeFloat;

/**
 当前字符是否为浮点数
 
 @return bool
 */
- (BOOL)cl_isFloat;

#pragma mark - Test String
/**
 当前字符是否为汉字

 @return bool
 */
- (BOOL)cl_isChineseCharacter;

/**
 当前字符是否为由数字和26个英文字母组成的字符串

 @return bool
 */
- (BOOL)cl_isEnglishAndNumbers;

/**
 当前字符是否为 长度为3-20的所有字符

 @param fistRange 开始的范围
 @param lastRange 结束的范围
 @return bool
 */
- (BOOL)cl_limitinglength:(NSInteger)fistRange
                 lastRange:(NSInteger)lastRange;

/**
 当前字符长度是否位 length, 并且是由字母和数字所组成

 @param length length 字符的长度
 @return bool
 */
- (BOOL)cl_checkString:(NSInteger)length;

/**
 当前字符是否为由26个英文字母组成的字符串

 @return bool
 */
- (BOOL)cl_isLettersString;

/**
 当前字符是否为由26个大写英文字母组成的字符串

 @return bool
 */
- (BOOL)cl_isCapitalLetters;

/**
 当前字符是否为由26个小写英文字母组成的字符串

 @return bool
 */
- (BOOL)cl_isLowercaseLetters;

/**
 当前字符是否为由数字、26个英文字母或者下划线组成的字符串

 @return bool
 */
- (BOOL)cl_isNumbersAndLettersOrUnderlineString;

/**
 当前字符是否为中文、英文、数字包括下划线

 @return bool
 */
- (BOOL)cl_isChineseCharacterAndEnglishAndNumbersAndUnderlineString;

/**
 当前字符是否为中文、英文、数字但不包括下划线等符号

 @return bool
 */
- (BOOL)cl_isDoesNotContainUnderscoresChineseCharacterAndEnglishAndNumbersString;

/**
 当前字符是否可以输入含有^%&',;=?$\"等字符

 @return bool
 */
- (BOOL)cl_isContainSpecialCharacterString;

/**
 当前字符是否禁止输入 含有charater的字符

 @param charater 输入限制的字符
 @return bool
 */
- (BOOL)cl_isContainCharacter:(NSString *)charater;

/**
 *  判断当前字符串是否是字母开头
 *
 *  @return BOOL
 */
- (BOOL)cl_isLetterStar;

/**
 *  判断当前字符串是否是字母, 数字及下划线的组合
 *
 *  @return BOOL
 */
- (BOOL)cl_checkStringIsStrong;

#pragma mark - Special Needs
/**
 当前字符是否为 Email地址

 @return bool
 */
- (BOOL)cl_checkEmailAddress;

/**
 当前字符是否为域名

 @return bool
 */
- (BOOL)cl_checkDomainName;

/**
 当前字符是否为Internet URL

 @return bool
 */
- (BOOL)cl_checkURL;

/**
 当前字符是否为手机号码

 @return bool
 */
- (BOOL)cl_checkPhoneNumber;

/**
 当前字符是否为中国移动手机号

 @return bool
 */
- (BOOL)cl_checkChinaMobelPhoneNumber;

/**
 当前字符是否为中国联通手机号

 @return bool
 */
- (BOOL)cl_checkChinaUnicomPhoneNumber;

/**
 当前字符是否为中国电信手机号

 @return bool
 */
- (BOOL)cl_checkChinaTelecomPhoneNumber;

/**
 当前字符是否为 电话号码("XXX-XXXXXXX"、"XXXX-XXXXXXXX"、"XXX-XXXXXXX"、"XXX-XXXXXXXX"、"XXXXXXX"和"XXXXXXXX)

 @return bool
 */
- (BOOL)cl_checkTelePhoneNumber;

/**
 当前字符是否为 国内电话号码(0511-4405222、021-87888822)

 @return bool
 */
- (BOOL)cl_checkDomesticPhoneNumber;

/**
 当前字符是否为身份证号(15位、18位数字)

 @return bool
 */
- (BOOL)cl_checkIdentityCard;

/**
 当前字符是否为X结尾的身份证号码(数字、字母x结尾)

 @return bool
 */
- (BOOL)cl_checkShortIdentityCard;

/**
 当前字符是否为帐号是否合法(字母开头，允许5-16字节，允许字母数字下划线)

 @return bool
 */
- (BOOL)cl_checkAccount;

/**
 当前字符是否为密码(以字母开头，长度在6~18之间, 并且密码是从0开始，只能包含字母、数字和下划线)

 @return bool
 */
- (BOOL)cl_checkPassword;

/**
 当前字符是否为强密码(必须包含大小写字母和数字的组合，不能使用特殊字符，长度在8-10之间)：briefest指的是最短密码长度, longest指的时最长密码长度

 @param briefest 密码最短的长度
 @param longest 密码最长的长度
 @return bool
 */
- (BOOL)cl_checkStrongPassword:(NSInteger)briefest
                        longest:(NSInteger)longest;

/**
 当前字符是否为中国日期格式

 @return bool
 */
- (BOOL)cl_checkChinaDateFormat;

/**
 当前字符是否为国外日期格式

 @return bool
 */
- (BOOL)cl_checkAbroadDateFormat;

/**
 当前字符是否为一年的12个月(01～09和1～12)

 @return bool
 */
- (BOOL)cl_checkMonth;

/**
 当前字符是否为一个月的31天(01～09和1～31)

 @return bool
 */
- (BOOL)cl_checkDay;

/**
 当前字符是否为xml文件

 @return bool
 */
- (BOOL)cl_checkXMLFile;

/**
 当前字符是否为中文字符的正则表达式

 @return bool
 */
- (BOOL)cl_checkChineseCharacter;

/**
 当前字符是否为双字节字符：(包括汉字在内，可以用来计算字符串的长度(一个双字节字符长度计2，ASCII字符计1))

 @return bool
 */
- (BOOL)cl_checkDoubleByteCharacters;

/**
 当前字符是否为空白行的正则表达式：(判断是否有空白行)

 @return bool
 */
- (BOOL)cl_checkBlankLines;

/**
 当前字符是否为HTML标记的正则表达式：(网上流传的版本太糟糕，上面这个也仅仅能部分，对于复杂的嵌套标记依旧无能为力)

 @return bool
 */
- (BOOL)cl_checkHTMLSign;

/**
 当前字符是否为首尾空白字符的正则表达式：(可以用来删除行首行尾的空白字符(包括空格、制表符、换页符等等)，非常有用的表达式)

 @return bool
 */
- (BOOL)cl_checkFirstAndLastSpaceCharacters;

/**
 当前字符是否为腾讯QQ号：(腾讯QQ号从10000开始)

 @return bool
 */
- (BOOL)cl_checkQQNumber;

/**
 当前字符是否为中国邮政编码：(中国邮政编码为6位数字)

 @return bool
 */
- (BOOL)cl_checkPostalCode;

/**
 当前字符是否为IP地址

 @return bool
 */
- (BOOL)cl_checkIPv4InternetProtocol;

@end
