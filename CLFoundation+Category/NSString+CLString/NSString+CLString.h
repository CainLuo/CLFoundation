//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  NSString+CLString.h
//
//  Created by Cain on 2017/7/28.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (CLString)

#pragma mark - 字符串计算
/**
 计算字符串的行数

 @param font UIFont
 @param width CGFloat
 @return CGFloat
 */
- (CGFloat)cl_stringLineWithFont:(UIFont *)font
                           width:(CGFloat)width;
/**
 根据条件计算文字的高度

 @param font UIFont
 @param width CGFloat
 @return CGFloat
 */
- (CGFloat)cl_heightWithFont:(UIFont *)font
                       width:(CGFloat)width;

/**
 获取指定字符串的高度
 
 @param string NSString
 @param font UIFont
 @param width CGFloat
 @return CGFloat
 */
+ (CGFloat)cl_measureHeightWithMutilineString:(NSString *)string
                                         font:(UIFont *)font
                                        width:(CGFloat)width;

/**
 获取指定字符串的宽度

 @param string NSString
 @param font UIFont
 @return CGFloat
 */
+ (CGFloat)cl_measureSingleLineStringWidthWithString:(NSString *)string
                                                font:(UIFont *)font;

/**
 获取指定字符串的尺寸
 
 @param string NSString
 @param font UIFont
 @return CGFloat
 */
+ (CGSize)cl_measureStringSizeWithString:(NSString *)string
                                    font:(UIFont *)font;

/**
 获取指定字符串的尺寸

 @param string NSString
 @param font UIFont
 @param size CGSize
 @param lineBreakMode NSLineBreakMode
 @return CGSize
 */
+ (CGSize)cl_measureStringWithString:(NSString *)string
                                font:(UIFont *)font
                                size:(CGSize)size
                                mode:(NSLineBreakMode)lineBreakMode;

#pragma mark - 字符串过滤
/**
 抹除运费小数末尾的0
 
 @return NSString
 */
- (NSString *)cl_removeUnwantedZero;

/**
 去掉字符串前后的空格
 
 @return NSString
 */
- (NSString *)cl_trimmedString;

/**
 去掉字符串前后中间的空格
 
 @return NSString
 */
- (NSString *)cl_trimmedAllString;

/**
 去除指定的字符
 
 @param character NSString
 @return NSString
 */
- (NSString *)cl_removeStringCharacterWithCharacter:(NSString *)character;

#pragma mark - 字符串转换
/**
 将指定的NSDictionary转成URL字符串

 @param dictionary NSDictionary
 @return NSString
 */
+ (NSString *)cl_urlQueryStringWithDictionary:(NSDictionary *)dictionary;

/**
 将指定的NSObject转成JSON字符串

 @param object NSArray || NSDictionary || NSObject
 @return NSString
 */
+ (NSString *)cl_jsonStringWithObject:(NSObject *)object;

/**
 将指定的NSObject转成带格式的JSON字符串

 @param object NSArray || NSDictionary || NSObject
 @return NSString
 */
+ (NSString *)cl_jsonPrettyStringWithObject:(NSObject *)object;

/**
 将指定的字符串转义为URL字符串

 @param string NSString
 @return NSString
 */
+ (NSString *)cl_urlEncodeWithString:(NSString *)string;

/**
 将指定的URL字符串转义成正常的字符串

 @param string NSString
 @return NSString
 */
+ (NSString *)cl_urlDecodeWithString:(NSString *)string;

/**
 将指定的HTML字符串转义成正常的字符串

 @param string NSString
 @return NSString
 */
+ (NSString *)cl_escapingHTMLWithString:(NSString *)string;

/**
 判断字符串是否为空
 
 @param string NSString
 @return BOOL, YES为空, NO不为空
 */
+ (BOOL)cl_checkEmptyWithString:(NSString *)string;

/**
 判断字符串是否为空

 @return BOOL, YES为空, NO不为空
 */
- (BOOL)cl_checkStringEmpty;

/**
 十六进制字符串转二进制字符串

 @param hexadecimal NSString
 @return NSString
 */
+ (NSString *)cl_formatBinaryWithHexadecimal:(NSString *)hexadecimal;

/**
 将十进制转换成二进制字符串
 
 @param decimal NSInteger
 @return NSString
 */
+ (NSString *)cl_formatBinaryWithDecimal:(NSInteger)decimal;

/**
 二进制字符串转十六进制字符串
 
 @param binary NSString
 @return NSString
 */
+ (NSString *)cl_formatHexadecimalWithBinary:(NSString *)binary;

/**
 将二进制字符串转十进制字符串

 @param binary NSString
 @return NSString
 */
+ (NSString *)cl_formatDecimalWithBinary:(NSString *)binary;

/**
 将NSData转换为十六进制字符串
 
 @param data NSData
 @return NSString
 */
+ (NSString *)cl_formatHexadecimalWithData:(NSData *)data;

/**
 将十进制转换成十六进制字符串

 @param decimal NSInteger
 @return NSString
 */
+ (NSString *)cl_formatHexadecimalWithDecimal:(NSInteger)decimal;

#pragma mark - 字符串格式化
/**
 返回过滤后的数字
 
 @param string NSString
 @return NSString
 */
+ (NSString *)cl_getNumberWithString:(NSString *)string;

/**
 隐藏银行卡号中间8位数字
 
 @param cardNumber NSString
 @return NSString
 */
+ (NSString *)cl_getSecrectStringWithCardNumber:(NSString *)cardNumber;

/**
 隐藏电话号码中间4位数字
 
 @param phoneNumber NSString
 @return NSString
 */
+ (NSString *)cl_getSecrectStringWithPhoneNumber:(NSString *)phoneNumber;

/**
 手机号格式化, 默认: 138 0013 8000
 
 @param phoneNumber NSString
 @return NSString
 */
+ (NSString *)cl_stringMobileFormat:(NSString *)phoneNumber;

/**
 手机号格式化
 
 @param phoneNumber NSString
 @param separator NSString, 比如: 138-0013-8000
 @return NSString
 */
+ (NSString *)cl_stringMobileFormat:(NSString *)phoneNumber
                          separator:(NSString *)separator;

/**
 字符串单位格式化
 
 @param value CGFloat, 数值
 @param unitString NSString, 单位, 比如亿, 万
 @return NSString
 */
+ (NSString *)cl_stringUnitFormat:(CGFloat)value
                       unitString:(NSString *)unitString;

#pragma mark - Base64加密字符串
/**
 将data数据转成Base64字符串
 
 @param data NSData
 @param length NSUInteger
 @return NSString
 */
+ (NSString *)cl_base64StringFromData:(NSData *)data
                               length:(NSUInteger)length;

/**
 将指定的字符串加密成Base64
 
 @param string NSString
 @return NSString
 */
+ (NSString *)cl_encodingBase64WithString:(NSString *)string;

/**
 将指定的加密的Base64字符串解码
 
 @param string NSString
 @return NSString
 */
+ (NSString *)cl_decodedBase64WithString:(NSString *)string;

#pragma mark - MD加密字符串
/**
 加密成MD2字符串

 @param string NSString
 @return NSString
 */
+ (NSString *)cl_encodingMD2WithString:(NSString *)string;

/**
 加密成MD4字符串
 
 @return NSString
 */
+ (NSString *)cl_encodingMD4WithString:(NSString *)string;

/**
 加密成MD5字符串
 
 @return NSString
 */
+ (NSString *)cl_encodingMD5WithString:(NSString *)string;

/**
 获取使用指定Key HASH MD5加密后的NSString
 
 @param key NSString
 @return NSString
 */
+ (NSString *)cl_hmacEncodingMD5StringWithString:(NSString *)string
                                             key:(NSString *)key;

#pragma mark - SHA加密字符串
/**
 加密成SHA1字符串
 
 @return NSString
 */
+ (NSString *)cl_encodingSHA1WithString:(NSString *)string;

/**
 获取使用指定Key HASH SHA1加密后的NSString
 
 @param key NSString
 @return NSString
 */
+ (NSString *)cl_hmacEncodingSHA1StringWithString:(NSString *)string
                                              key:(NSString *)key;

/**
 加密成SHA224字符串
 
 @return NSString
 */
+ (NSString *)cl_encodingSHA224WithString:(NSString *)string;

/**
 获取使用指定Key HASH SHA224加密后的NSString
 
 @param key NSString
 @return NSString
 */
+ (NSString *)cl_hmacEncodingSHA224StringWithString:(NSString *)string
                                                key:(NSString *)key;

/**
 加密成SHA256字符串
 
 @return NSString
 */
+ (NSString *)cl_encodingSHA256WithString:(NSString *)string;

/**
 获取使用指定Key HASH SHA256加密后的NSString
 
 @param key NSString
 @return NSString
 */
+ (NSString *)cl_hmacEncodingSHA256StringWithString:(NSString *)string
                                                key:(NSString *)key;

/**
 加密成SHA384字符串
 
 @return NSString
 */
+ (NSString *)cl_encodingSHA384WithString:(NSString *)string;

/**
 获取使用指定Key HASH SHA384加密后的NSString
 
 @param key NSString
 @return NSString
 */
+ (NSString *)cl_hmacEncodingSHA384StringWithString:(NSString *)string
                                                key:(NSString *)key;

/**
 加密成SHA512字符串
 
 @return NSString
 */
+ (NSString *)cl_encodingSHA512WithString:(NSString *)string;

/**
 获取使用指定Key HASH SHA512加密后的NSString
 
 @param key NSString
 @return NSString
 */
+ (NSString *)cl_hmacEncodingSHA512StringWithString:(NSString *)string
                                                key:(NSString *)key;

#pragma mark - RSA加密
+ (NSString *)cl_rsaEncodingWithString:(NSString *)string
                             publicKey:(NSString *)key;

+ (NSString *)cl_rsaEncodingWithString:(NSString *)string
                             privateKey:(NSString *)key;

#pragma mark - NSString获取首字母
/**
 获取字符串的首个字符

 @param string NSString
 @return NSString
 */
+ (NSString *)cl_getFirstCharactorWithString:(NSString *)string;

/**
 获取中文字符串首个拼音字母

 @param string NSString
 @return NSString
 */
+ (NSString *)cl_getFirstPinYinWithString:(NSString *)string;

#pragma mark - 正则表达式
#pragma mark - 数字字符判断
/**
 当前字符是否为数字
 
 @return BOOL
 */
- (BOOL)cl_realContainDecimal;

#pragma mark - 整数相关
/**
 当前字符是否为整数
 
 @return BOOL
 */
- (BOOL)cl_isNumber;

/**
 当前字符是否为number位的数字
 
 @param quantity NSInteger, 限制数字的数量
 @return BOOL
 */
- (BOOL)cl_checkMostNumber:(NSInteger)quantity;

/**
 当前字符是否为至少number位的数字
 
 @param quantity NSInteger, 至少数字的数量
 @return BOOL
 */
- (BOOL)cl_checkAtLeastNumber:(NSInteger)quantity;

/**
 当前字符是否为最少leastNumber个数字, 最多moreNumber个数字的
 
 @param leastNumber NSInteger, 最少
 @param mostNumber NSInteger, 最多
 @return BOOL
 */
- (BOOL)cl_checkLeastNumber:(NSInteger)leastNumber
                 mostNumber:(NSInteger)mostNumber;

/**
 当前字符是否为非零开头的数字
 
 @return BOOL
 */
- (BOOL)cl_isNotZeroStartNumber;


/**
 当前字符是否为非零的正整数
 
 @return BOOL
 */
- (BOOL)cl_isNotZeroPositiveInteger;


/**
 当前字符是否为非零的负整数
 
 @return BOOL
 */
- (BOOL)cl_isNotZeroNegativeInteger;

/**
 当前字符是否为正整数
 
 @return BOOL
 */
- (BOOL)cl_isPositiveInteger;

/**
 当前字符是否为负整数
 
 @return BOOL
 */
- (BOOL)cl_isNegativeInteger;

#pragma mark - 浮点数相关
/**
 当前字符是否为浮点数
 
 @return BOOL
 */
- (BOOL)cl_isFloat;

/**
 当前字符是否为正浮点数
 
 @return BOOL
 */
- (BOOL)cl_isPositiveFloat;

/**
 当前字符是否为负浮点数
 
 @return BOOL
 */
- (BOOL)cl_isNagativeFloat;

/**
 当前字符是否为非零开头的最多带两位小数的数字
 
 @return BOOL
 */
- (BOOL)cl_isNotZeroStartNumberHaveOneOrTwoDecimal;

/**
 当前字符是否为带1-2位小数的正数或负数
 
 @return BOOL
 */
- (BOOL)cl_isHaveOneOrTwoDecimalPositiveOrNegative;

/**
 当前字符是否为有两位小数的正实数
 
 @return BOOL
 */
- (BOOL)cl_isPositiveRealHaveTwoDecimal;

/**
 当前字符是否为有1~3位小数的正实数
 
 @return BOOL
 */
- (BOOL)cl_isHaveOneOrThreeDecimalPositiveOrNegative;

#pragma mark - 字符串相关
/**
 当前字符是否为汉字
 
 @return BOOL
 */
- (BOOL)cl_isChineseCharacter;

/**
 当前字符是否为由数字或26个英文字母组成的字符串
 
 @return BOOL
 */
- (BOOL)cl_isEnglishOrNumbers;

/**
 当前字符是否为 长度为3-20的所有字符
 
 @param fistRange NSInteger, 开始的范围
 @param lastRange NSInteger, 结束的范围
 @return BOOL
 */
- (BOOL)cl_limitinglength:(NSInteger)fistRange
                lastRange:(NSInteger)lastRange;

/**
 当前字符长度是否位 length, 并且是由字母或数字所组成
 
 @param length length NSInteger, 字符的长度
 @return BOOL
 */
- (BOOL)cl_checkString:(NSInteger)length;

/**
 当前字符是否为由26个英文字母组成的字符串
 
 @return BOOL
 */
- (BOOL)cl_isLettersString;

/**
 当前字符是否为由26个大写英文字母组成的字符串
 
 @return BOOL
 */
- (BOOL)cl_isCapitalLetters;

/**
 当前字符是否为由26个小写英文字母组成的字符串
 
 @return BOOL
 */
- (BOOL)cl_isLowercaseLetters;

/**
 当前字符是否为由数字、26个英文字母或者下划线组成的字符串
 
 @return BOOL
 */
- (BOOL)cl_isNumbersOrLettersOrLineString;

/**
 当前字符是否为中文、英文、数字或者下划线
 
 @return BOOL
 */
- (BOOL)cl_isChineseCharacterOrEnglishOrNumbersOrLineString;

/**
 当前字符是否为中文、英文、数字但不包括特殊符号
 
 @return BOOL
 */
- (BOOL)cl_isDoesSpecialCharactersString;

/**
 当前字符是否可以输入含有^%&',;=?$\"等字符
 
 @return BOOL
 */
- (BOOL)cl_isContainSpecialCharacterString;

/**
 当前字符是否禁止输入 含有charater的字符
 
 @param charater NSString, 输入限制的字符
 @return BOOL
 */
- (BOOL)cl_isContainCharacter:(NSString *)charater;

/**
 *  判断当前字符串是否是字母开头
 *
 *  @return BOOL
 */
- (BOOL)cl_isLetterStar;

/**
 *  判断当前字符串是否是字母, 数字及下划线的强组合
 *
 *  @return BOOL
 */
- (BOOL)cl_checkStringIsStrong;

/**
 当前字符是否为中文字符的正则表达式
 
 @return BOOL
 */
- (BOOL)cl_checkChineseCharacter;

/**
 当前字符是否为双字节字符：(包括汉字在内，可以用来计算字符串的长度(一个双字节字符长度计2，ASCII字符计1))
 
 @return BOOL
 */
- (BOOL)cl_checkDoubleByteCharacters;

/**
 当前字符是否为空白行的正则表达式：(判断是否有空白行)
 
 @return BOOL
 */
- (BOOL)cl_checkBlankLines;

/**
 当前字符是否为首尾空白字符的正则表达式：(可以用来删除行首行尾的空白字符(包括空格、制表符、换页符等等)，非常有用的表达式)
 
 @return BOOL
 */
- (BOOL)cl_checkFirstAndLastSpaceCharacters;

#pragma mark - 号码相关
/**
 当前字符是否为手机号码
 
 @return BOOL
 */
- (BOOL)cl_checkPhoneNumber;

/**
 当前字符是否为中国移动手机号
 
 @return BOOL
 */
- (BOOL)cl_checkChinaMobelPhoneNumber;

/**
 当前字符是否为中国联通手机号
 
 @return BOOL
 */
- (BOOL)cl_checkChinaUnicomPhoneNumber;

/**
 当前字符是否为中国电信手机号
 
 @return BOOL
 */
- (BOOL)cl_checkChinaTelecomPhoneNumber;

/**
 当前字符是否为 电话号码("0101234567"、"075512345678"、"01012345678")
 
 @return BOOL
 */
- (BOOL)cl_checkTelePhoneNumber;

/**
 当前字符是否为 格式化国内电话号码(0511-4405222、021-87888822)
 
 @return BOOL
 */
- (BOOL)cl_checkFormatTelePhoneNumber;

#pragma mark - 身份证相关
/**
 当前字符是否为身份证号(15位、18位数字)
 
 @return BOOL
 */
- (BOOL)cl_checkIdentityCard;

#pragma mark - 账号相关
/**
 当前字符是否为帐号是否是字母开头，最少5位最多16位，且是字母数字下划线组成
 
 @return BOOL
 */
- (BOOL)cl_checkAccount;

/**
 当前字符是否以字母开头，长度在6~18之间, 并且密码是从0开始，只能包含字母、数字和下划线的密码
 
 @return BOOL
 */
- (BOOL)cl_checkPassword;

/**
 当前字符是否为强密码(必须包含大小写字母和数字的组合，不能使用特殊字符，长度在8-10之间)：briefest指的是最短密码长度, longest指的时最长密码长度
 
 @param briefest NSInteger, 密码最短的长度
 @param longest NSInteger, 密码最长的长度
 @return BOOL
 */
- (BOOL)cl_checkStrongPassword:(NSInteger)briefest
                       longest:(NSInteger)longest;

#pragma mark - 日期相关
/**
 当前字符是否为中国日期格式
 
 @return BOOL
 */
- (BOOL)cl_checkChinaDateFormat;

/**
 当前字符是否为国外日期格式
 
 @return BOOL
 */
- (BOOL)cl_checkAbroadDateFormat;

/**
 当前字符是否为一年的12个月(01～09和1～12)
 
 @return BOOL
 */
- (BOOL)cl_checkMonth;

/**
 当前字符是否为一个月的31天(01～09和1～31)
 
 @return BOOL
 */
- (BOOL)cl_checkDay;

#pragma mark - 特殊正则
/**
 当前字符是否为 Email地址
 
 @return BOOL
 */
- (BOOL)cl_checkEmailAddress;

/**
 当前字符是否为域名
 
 @return BOOL
 */
- (BOOL)cl_checkDomainName;

/**
 当前字符是否为Internet URL
 
 @return BOOL
 */
- (BOOL)cl_checkURL;

/**
 当前字符是否为xml文件
 
 @return BOOL
 */
- (BOOL)cl_checkXMLFile;

/**
 当前字符是否为HTML标记的正则表达式：(网上流传的版本太糟糕，上面这个也仅仅能部分，对于复杂的嵌套标记依旧无能为力)
 
 @return BOOL
 */
- (BOOL)cl_checkHTMLSign;

/**
 当前字符是否为腾讯QQ号：(腾讯QQ号从10000开始)
 
 @return BOOL
 */
- (BOOL)cl_checkQQNumber;

/**
 当前字符是否为中国邮政编码：(中国邮政编码为6位数字)
 
 @return BOOL
 */
- (BOOL)cl_checkPostalCode;

/**
 当前字符是否为IPv4地址
 
 @return BOOL
 */
- (BOOL)cl_checkIPv4InternetProtocol;

/**
 自定义正则
 
 @param rule NSString, 正则规则
 @return BOOL
 */
- (BOOL)cl_regularWithRule:(NSString *)rule;

@end
