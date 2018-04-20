# CLFoundation

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/CLFoundation.svg)](https://img.shields.io/cocoapods/v/CLFoundation.svg) [![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![Platform](https://img.shields.io/cocoapods/p/CLFoundation.svg?style=flat)](http://cocoadocs.org/docsets/CLFoundation) [![Language](https://img.shields.io/badge/language-ObjC-blue.svg)](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 

## CLFoundation简介

`CLFoundation`是对系统`Foundation API`进行扩展的库, `API`的用法全部都在`CLFoundationExample`里, 如果在使用库遇到的一些疑惑欢迎随时`Issues`给我.

支持`CocoaPod`管理

> pod 'CLFoundation'



## 支助
如果您觉得挺赞的话, 可以给我打赏打赏, 谢谢啦~

![支付宝](https://raw.githubusercontent.com/CainRun/PayProject/master/WeChatPay-Objective-C/Images/支付宝QRC.jpg)



## 目录

- [CLSpeechSunthesizer@](#CLSpeechSunthesizer)
- [NSArray+CLArray@](#NSArray+CLArray)
- [NSAttributedString+CLAttributedString@](#NSAttributedString+CLAttributedString)
- [NSBundle+CLBundle@](#NSBundle+CLBundle)
- [NSData+CLData@](#NSData+CLData)
- [NSDate+CLDate@](#NSDate+CLDate)
  - [时间戳处理/计算日期@](#时间戳处理/计算日期)
  - [日期处理@](#日期处理)
  - [日期判断@](#日期判断)
- [获取NSDateComponents@](#获取NSDateComponents)
- [NSDictionary+CLDictionary@](#NSDictionary+CLDictionary)
- [NSFileManager+CLFileManager@](#NSFileManager+CLFileManager)
- [NSMutableArray+CLMutableArray@](#NSMutableArray+CLMutableArray)
- [NSMutableAttributedString+CLMutableAttributedString@](#NSMutableAttributedString+CLMutableAttributedString)
- [NSMutableDictionary+CLMutableDictionary@](#NSMutableDictionary+CLMutableDictionary)
- [NSNumber+CLNumber@](#NSNumber+CLNumber)
- [NSObject+CLObject@](#NSObject+CLObject)
  - [RunTime@](#RunTime)
  - [GCD@](#GCD)
- [NSString+CLString@](#NSString+CLString)
  - [字符串处理@](#字符串处理)
  - [加密字符串@](#加密字符串)
  - [取首字母@](#取首字母)
  - [正则表达式(数字相关)@](#正则表达式(数字相关))
  - [正则表达式验证(整数相关)@](#正则表达式验证(整数相关))
  - [正则表达式验证(浮点数相关)@](#正则表达式验证(浮点数相关))
  - [正则表达式验证(字符串相关)@](#正则表达式验证(字符串相关))
  - [正则表达式验证(号码相关)@](#正则表达式验证(号码相关))
  - [正则表达式验证(身份证相关)@](#正则表达式验证(身份证相关))
  - [正则表达式验证(账号相关)@](#正则表达式验证(账号相关))
  - [正则表达式验证(日期相关)@](#正则表达式验证(日期相关))
  - [正则表达式验证(特殊相关)@](#正则表达式验证(特殊相关))
- [NSTimer+CLTimer@](#NSTimer+CLTimer)
- [NSURL+CLURL@](#NSURL+CLURL)




## CLSpeechSunthesizer@

**CLSpeechSunthesizer**基于**AVFoundation**实现的语音播报工具类:

```objective-c
+ (instancetype)sharedSpeechSynthesizer;

- (BOOL)cl_isSpeaking;

- (void)cl_speakString:(NSString *)string;

- (void)cl_stopSpeak;

- (void)cl_chooseVoiceWithLanguage:(NSString *)language
                        speakSpeed:(CGFloat)speakSpeed;
```



## NSArray+CLArray@

针对`Foundation`的`NSArray`进行系统外的方法补充:

```objective-c
+ (instancetype)cl_initSafeArrayWithObject:(id)object;

- (id)cl_safeObjectAtIndex:(NSUInteger)index;

- (NSArray *)cl_safeArrayWithRange:(NSRange)range;

- (NSUInteger)cl_safeIndexOfObject:(id)object;

+ (NSArray *)cl_getArrayWithPlistName:(NSString *)name;
```



## NSAttributedString+CLAttributedString@

针对`Foundation`的`NSAttributedString`进行系统外的方法补充:

```objective-c
- (CGFloat)cl_attributedStringHeightWithContainWidth:(CGFloat)width;

+ (NSAttributedString *)cl_attributeStringWithString:(NSString *)string
                                               color:(UIColor *)color
                                               range:(NSRange)range;

+ (NSAttributedString *)cl_attributeStringWithAttributedString:(NSAttributedString *)attributedString
                                                         color:(UIColor *)color
                                                         range:(NSRange)range;

+ (NSAttributedString *)cl_attributeStringWithString:(NSString *)string
                                                font:(UIFont *)font
                                               range:(NSRange)range;

+ (NSAttributedString *)cl_attributeStringWithAttributedString:(NSAttributedString *)attributedString
                                                          font:(UIFont *)font
                                                         range:(NSRange)range;

+ (NSAttributedString *)cl_attributeStringWithPrefixString:(NSString *)prefixString
                                                prefixFont:(UIFont *)prefixFont
                                              suffixString:(NSString *)suffixString
                                                suffixFont:(UIFont *)suffixFont;

+ (NSAttributedString *)cl_attributeStringWithPrefixString:(NSString *)prefixString
                                                prefixFont:(UIFont *)prefixFont
                                               prefixColor:(UIColor *)prefixColor
                                              suffixString:(NSString *)suffixString
                                                suffixFont:(UIFont *)suffixFont
                                               suffixColor:(UIColor *)suffixColor;
```



## NSBundle+CLBundle@

针对`Foundation`的`NSBundle`进行系统外的方法补充:

```objective-c
+ (NSString *)cl_getBundleDisplayName;

+ (NSString *)cl_getBundleShortVersionString;

+ (NSString *)cl_getBundleVersion;

+ (NSString *)cl_getBundleIdentifier;
```



## NSData+CLData@

针对`Foundation`的`NSData`进行系统外的方法补充:

```objective-c
typedef NS_ENUM(NSInteger, CLEncodedType) {
    
    CLEncodedType64 = 64,
    CLEncodedType76 = 76
};

+ (NSData *)cl_compressOriginalImage:(UIImage *)image
                  compressionQuality:(CGFloat)compressionQuality;

+ (NSString *)cl_replacingAPNsTokenWithData:(NSData *)data;

+ (NSData *)cl_transformDataWithBase64EncodedString:(NSString *)string;

+ (NSString *)cl_transformBase64EncodedStringWithData:(NSData *)data
                                            wrapWidth:(CLEncodedType)wrapWidth;

- (NSData *)cl_encryptedDataWithAESKey:(NSString *)key
                           encryptData:(NSData *)encryptData;

- (NSData *)cl_decryptedDataWithAESKey:(NSString *)key
                           decryptData:(NSData *)decryptData;

- (NSData *)cl_encryptedDataWith3DESKey:(NSString *)key
                            encryptData:(NSData *)encryptData;

- (NSData *)cl_decryptedDataWith3DEKey:(NSString *)key
                           decryptData:(NSData *)decryptData;

- (NSString *)cl_encryptredMD2String;

- (NSData *)cl_encryptredMD2Data;

- (NSString *)cl_encryptredMD4String;

- (NSData *)cl_encryptredMD4Data;

- (NSString *)cl_encryptredMD5String;

- (NSString *)cl_hmacEncryptredMD5StringWithKey:(NSString *)key;

- (NSData *)cl_encryptredMD5Data;

- (NSData *)cl_hmacEncryptredMD5DataWithKey:(NSData *)key;

- (NSString *)cl_encryptredSHA1String;

- (NSString *)cl_hmacEncryptredSHA1StringWithKey:(NSString *)key;

- (NSData *)cl_encryptredSHA1Data;

- (NSData *)cl_hmacEncryptredSHA1DataWithKey:(NSData *)key;

- (NSString *)cl_encryptredSHA224String;

- (NSString *)cl_hmacEncryptredSHA224StringWithKey:(NSString *)key;

- (NSData *)cl_encryptredSHA224Data;

- (NSData *)cl_hmacEncryptredSHA224DataWithKey:(NSData *)key;

- (NSString *)cl_encryptredSHA256String;

- (NSString *)cl_hmacEncryptredSHA256StringWithKey:(NSString *)key;

- (NSData *)cl_encryptredSHA256Data;

- (NSData *)cl_hmacEncryptredSHA256DataWithKey:(NSData *)key;

- (NSString *)cl_encryptredSHA384String;

- (NSString *)cl_hmacEncryptredSHA384StringWithKey:(NSString *)key;

- (NSData *)cl_encryptredSHA384Data;

- (NSData *)cl_hmacEncryptredSHA384DataWithKey:(NSData *)key;

- (NSString *)cl_encryptredSHA512String;

- (NSString *)cl_hmacEncryptredSHA512StringWithKey:(NSString *)key;

- (NSData *)cl_encryptredSHA512Data;

- (NSData *)cl_hmacEncryptredSHA512DataWithKey:(NSData *)key;

- (id)cl_dataJSONValueDecoded;

+ (NSData *)cl_getDataWithBundleNamed:(NSString *)name;
```



## NSDate+CLDate@

针对`Foundation`的`NSDate`进行系统外的方法补充:


### 时间戳处理/计算日期@

```objective-c
+ (NSString *)cl_compareCureentTimeWithDate:(NSTimeInterval)timeStamp;

+ (NSString *)cl_getCurrentTimeStamp;

+ (NSString *)cl_displayTimeWithTimeStamp:(NSTimeInterval)timeStamp;

+ (NSString *)cl_displayTimeWithTimeStamp:(NSTimeInterval)timeStamp
                                formatter:(NSString *)formatter;

+ (NSString *)cl_getDateStringWithDate:(NSDate *)date
                             formatter:(NSString *)formatter;

+ (NSString *)cl_calculateDaysWithDate:(NSDate *)date;
```


### 日期处理@

```objective-c
+ (NSUInteger)cl_getEraWithDate:(NSDate *)date;

+ (NSUInteger)cl_getYearWithDate:(NSDate *)date;

+ (NSUInteger)cl_getMonthWithDate:(NSDate *)date;

+ (NSUInteger)cl_getDayWithDate:(NSDate *)date;

+ (NSUInteger)cl_getHourWithDate:(NSDate *)date;

+ (NSUInteger)cl_getMinuteWithDate:(NSDate *)date;

+ (NSUInteger)cl_getSecondWithDate:(NSDate *)date;

+ (NSInteger)cl_getWeekdayStringFromDate:(NSDate *)date;

+ (NSInteger)cl_getDateTimeDifferenceWithBeginDate:(NSDate *)beginDate
                                           endDate:(NSDate *)endDate;

+ (NSDate *)cl_getMonthFirstDeteWithDate:(NSDate *)date;

+ (NSDate *)cl_getMonthLastDayWithDate:(NSDate *)date;

+ (NSUInteger)cl_getWeekOfYearWithDate:(NSDate *)date;

+ (NSDate *)cl_getTomorrowDay:(NSDate *)date;

+ (NSDate *)cl_getYearDateWithDate:(NSDate *)date
                             years:(NSInteger)years;

+ (NSDate *)cl_getMonthDateWithDate:(NSDate *)date
                             months:(NSInteger)months;

+ (NSDate *)cl_getDaysDateWithDate:(NSDate *)date
                              days:(NSInteger)days;

+ (NSDate *)cl_getHoursDateWithDate:(NSDate *)date
                              hours:(NSInteger)hours;
```


### 日期判断@

```objective-c
+ (BOOL)cl_isLeapYear:(NSDate *)date;

+ (BOOL)cl_checkTodayWithDate:(NSDate *)date;
```


### 获取NSDateComponents@

```objective-c
+ (NSDateComponents *)cl_getCalendarWithUnitFlags:(NSCalendarUnit)unitFlags
                                             date:(NSDate *)date;
```



## NSDictionary+CLDictionary@

针对`Foundation`的`NSDictionary`进行系统外的方法补充:

```objective-c
+ (NSDictionary *)cl_dictionaryWithURLString:(NSString *)urlString;
```



## NSFileManager+CLFileManager@

针对`Foundation`的`NSFileManager`进行系统外的方法补充:

```objective-c
+ (BOOL)cl_saveDataCacheWithData:(NSData *)data
                      identifier:(NSString *)identifier;

+ (BOOL)cl_saveDataCacheWithData:(NSData *)data
                       cacheName:(NSString *)cacheName
                      identifier:(NSString *)identifier;

+ (NSData *)cl_getDataCacheWithIdentifier:(NSString *)identifier;

+ (NSData *)cl_getDataCacheWithCacheName:(NSString *)cacheName
                              identifier:(NSString *)identifier;

+ (BOOL)cl_removeDataWithCache;

+ (BOOL)cl_removeDataWithCacheWithCacheName:(NSString *)cacheName;

+ (BOOL)cl_saveDocumentWithObject:(id)object
                         fileName:(NSString *)fileName;

+ (BOOL)cl_removeDocumentObjectWithFileName:(NSString *)fileName;

+ (id)cl_getDocumentObjectWithFileName:(NSString *)fileName;

+ (BOOL)cl_checkFileExistWithFilePath:(NSString *)filePath;

+ (NSUInteger)cl_getApplicationDocumentSize;

+ (NSUInteger)cl_getApplicationCacheSize;

+ (NSUInteger)cl_getApplicationLibrarySize;

+ (NSUInteger)cl_getApplicationFileSizeWithFilePath:(NSString *)folderPath;
```



## NSMutableArray+CLMutableArray@

针对`Foundation`的`NSMutableArray`进行系统外的方法补充:

```objective-c
- (void)cl_addSafeObject:(id)object;

- (void)cl_insertSafeObject:(id)object
                      index:(NSUInteger)index;

- (void)cl_safeRemoveObjectAtIndex:(NSUInteger)index;

- (void)cl_safeRemoveObjectsInRange:(NSRange)range;
```



## NSMutableAttributedString+CLMutableAttributedString@

针对`Foundation`的`NSMutableAttributedString`进行系统外的方法补充:

```objective-c
+ (NSMutableAttributedString *)cl_attributeStringWithSubffixString:(NSString *)subffixString
                                                      subffixImage:(UIImage *)subffixImage;

+ (NSMutableAttributedString *)cl_attributeStringWithSubffixString:(NSString *)subffixString
                                                     subffixImages:(NSArray<UIImage *> *)subffixImages;

+ (NSMutableAttributedString *)cl_attributeStringWithPrefixString:(NSString *)prefixString
                                                      prefixImage:(UIImage *)prefixImage;

+ (NSMutableAttributedString *)cl_attributeStringWithPrefixString:(NSString *)prefixString
                                                     prefixImages:(NSArray<UIImage *> *)prefixImages;

+ (NSMutableAttributedString *)cl_attributedStringWithString:(NSString *)string
                                                 lineSpacing:(CGFloat)lineSpacing;

+ (NSMutableAttributedString *)cl_attributedStringWithAttributedString:(NSAttributedString *)attributedString
                                                           lineSpacing:(CGFloat)lineSpacing;

+ (NSMutableAttributedString *)cl_attributedStringAddLineWithString:(NSString *)string
                                                              range:(NSRange)range;

+ (NSMutableAttributedString *)cl_attributedStringAddLineWithAttributedString:(NSAttributedString *)attributedString
                                                                        range:(NSRange)range;
```



## NSMutableDictionary+CLMutableDictionary@

针对`Foundation`的`NSMutableDictionary`进行系统外的方法补充:

```objective-c
- (void)cl_setSafeObject:(id)object
                  forKey:(id)key;

- (id)cl_safeObjectForKey:(id)key;

- (id)cl_safeKeyForValue:(id)value;
```



## NSNumber+CLNumber@

针对`Foundation`的`NSNumber`进行系统外的方法补充:

```objective-c
+ (NSString *)cl_displayDecimalWithNumber:(NSNumber *)number
                                    digit:(NSUInteger)digit;

+ (NSString *)cl_displayCurrencyWithNumber:(NSNumber *)number
                                     digit:(NSUInteger)digit;

+ (NSString *)cl_displayPercentWithNumber:(NSNumber *)number
                                    digit:(NSUInteger)digit;

+ (NSNumber *)cl_roundingWithNumber:(NSNumber *)number
                              digit:(NSUInteger)digit;

+ (NSNumber *)cl_roundCeilingWithNumber:(NSNumber *)number
                                  digit:(NSUInteger)digit;

+ (NSNumber *)cl_roundFloorWithNumber:(NSNumber *)number
                                digit:(NSUInteger)digit;
```

## NSObject+CLObject@

针对`Foundation`的`NSObject`进行系统外的方法补充:


### RunTime@

```objective-c
+ (void)cl_exchangeImplementationsWithClass:(Class)class
                           originalSelector:(SEL)originalSelector
                           swizzledSelector:(SEL)swizzledSelector;

+ (BOOL)cl_addMethodWithClass:(Class)class
             originalSelector:(SEL)originalSelector
             swizzledSelector:(SEL)swizzledSelector;

+ (void)cl_replaceMethodWithClass:(Class)class
                 originalSelector:(SEL)originalSelector
                 swizzledSelector:(SEL)swizzledSelector;

+ (NSArray <NSString *> *)cl_getClassList;

+ (NSArray <NSString *> *)cl_getClassMethodListWithClass:(Class)class;

+ (NSArray <NSString *> *)cl_getPropertyListWithClass:(Class)class;

+ (NSArray <NSString *> *)cl_getIVarListWithClass:(Class)class;

+ (NSArray <NSString *> *)cl_getProtocolListWithClass:(Class)class;

- (BOOL)cl_hasPropertyWithKey:(NSString *)key;

- (BOOL)cl_hasIvarWithKey:(NSString *)key;
```


### GCD@

```objective-c
- (void)cl_performAsyncWithComplete:(CLObject)complete;

- (void)cl_performMainThreadWithComplete:(CLObject)complete
                               isWait:(BOOL)isWait;

- (void)cl_performWithAfterSecond:(NSTimeInterval)afterSecond
                         complete:(CLObject)complete;
```



## NSString+CLString@

针对`Foundation`的`NSString`进行系统外的方法补充:


### 字符串处理@

```objective-c
+ (NSString *)cl_getNumberWithString:(NSString *)string;

+ (NSString *)cl_getSecrectStringWithPhoneNumber:(NSString *)phoneNumber;

+ (NSString *)cl_getSecrectStringWithCardNumber:(NSString *)cardNumber;

- (CGFloat)cl_heightWithFontSize:(CGFloat)fontSize
                           width:(CGFloat)width;

- (NSString *)cl_removeUnwantedZero;

- (NSString *)cl_trimmedString;

- (NSString *)cl_removeStringCharacterWithCharacter:(NSString *)character;

+ (NSString *)cl_stringMobileFormat:(NSString *)phoneNumber;

+ (NSString *)cl_stringMobileFormat:(NSString *)phoneNumber
                          separator:(NSString *)separator;

+ (NSString *)cl_stringUnitFormat:(CGFloat)value
                       unitString:(NSString *)unitString;

+ (CGSize)cl_measureStringSizeWithString:(NSString *)string
                                    font:(UIFont *)font;

+ (CGFloat)cl_measureSingleLineStringWidthWithString:(NSString *)string
                                                font:(UIFont *)font;

+ (CGFloat)cl_measureHeightWithMutilineString:(NSString *)string
                                         font:(UIFont *)font
                                        width:(CGFloat)width;

+ (NSString *)cl_urlQueryStringWithDictionary:(NSDictionary *)dictionary;

+ (NSString *)cl_jsonStringWithObject:(NSObject *)object;
```


### 加密字符串@

```objective-c
+ (NSString *)cl_base64StringFromData:(NSData *)data
                               length:(NSUInteger)length;

+ (NSString *)cl_encodingBase64WithString:(NSString *)string;

+ (NSString *)cl_decodedBase64WithString:(NSString *)string;

+ (NSString *)cl_encodingMD2WithString:(NSString *)string;

+ (NSString *)cl_encodingMD4WithString:(NSString *)string;

+ (NSString *)cl_encodingMD5WithString:(NSString *)string;

+ (NSString *)cl_hmacEncodingMD5StringWithString:(NSString *)string
                                             key:(NSString *)key;

+ (NSString *)cl_encodingSHA1WithString:(NSString *)string;

+ (NSString *)cl_hmacEncodingSHA1StringWithString:(NSString *)string
                                              key:(NSString *)key;

+ (NSString *)cl_encodingSHA224WithString:(NSString *)string;

+ (NSString *)cl_hmacEncodingSHA224StringWithString:(NSString *)string
                                                key:(NSString *)key;

+ (NSString *)cl_encodingSHA256WithString:(NSString *)string;

+ (NSString *)cl_hmacEncodingSHA256StringWithString:(NSString *)string
                                                key:(NSString *)key;

+ (NSString *)cl_encodingSHA384WithString:(NSString *)string;

+ (NSString *)cl_hmacEncodingSHA384StringWithString:(NSString *)string
                                                key:(NSString *)key;

+ (NSString *)cl_encodingSHA512WithString:(NSString *)string;

+ (NSString *)cl_hmacEncodingSHA512StringWithString:(NSString *)string
                                                key:(NSString *)key;
```


### 取首字母@

```objective-c
+ (NSString *)cl_getFirstCharactorWithString:(NSString *)string;

+ (NSString *)cl_getFirstPinYinWithString:(NSString *)string;
```


### 正则表达式(数字相关)@

```objective-c
- (BOOL)cl_realContainDecimal;
```


### 正则表达式验证(整数相关)@

```objective-c
- (BOOL)cl_isNumber;

- (BOOL)cl_checkMostNumber:(NSInteger)quantity;

- (BOOL)cl_checkAtLeastNumber:(NSInteger)quantity;

- (BOOL)cl_checkLeastNumber:(NSInteger)leastNumber
                 mostNumber:(NSInteger)mostNumber;

- (BOOL)cl_isNotZeroStartNumber;

- (BOOL)cl_isNotZeroPositiveInteger;

- (BOOL)cl_isNotZeroNegativeInteger;

- (BOOL)cl_isPositiveInteger;

- (BOOL)cl_isNegativeInteger;
```


### 正则表达式验证(浮点数相关)@

```objective-c
- (BOOL)cl_isFloat;

- (BOOL)cl_isPositiveFloat;

- (BOOL)cl_isNagativeFloat;

- (BOOL)cl_isNotZeroStartNumberHaveOneOrTwoDecimal;

- (BOOL)cl_isHaveOneOrTwoDecimalPositiveOrNegative;

- (BOOL)cl_isPositiveRealHaveTwoDecimal;

- (BOOL)cl_isHaveOneOrThreeDecimalPositiveOrNegative;
```


### 正则表达式验证(字符串相关)@

```objective-c
- (BOOL)cl_isChineseCharacter;

- (BOOL)cl_isEnglishOrNumbers;

- (BOOL)cl_limitinglength:(NSInteger)fistRange
                lastRange:(NSInteger)lastRange;

- (BOOL)cl_checkString:(NSInteger)length;

- (BOOL)cl_isLettersString;

- (BOOL)cl_isCapitalLetters;

- (BOOL)cl_isLowercaseLetters;

- (BOOL)cl_isNumbersOrLettersOrLineString;

- (BOOL)cl_isChineseCharacterOrEnglishOrNumbersOrLineString;

- (BOOL)cl_isDoesSpecialCharactersString;

- (BOOL)cl_isContainSpecialCharacterString;

- (BOOL)cl_isContainCharacter:(NSString *)charater;

- (BOOL)cl_isLetterStar;

- (BOOL)cl_checkStringIsStrong;

- (BOOL)cl_checkChineseCharacter;

- (BOOL)cl_checkDoubleByteCharacters;

- (BOOL)cl_checkBlankLines;

- (BOOL)cl_checkFirstAndLastSpaceCharacters;
```


### 正则表达式验证(号码相关)@

```objective-c
- (BOOL)cl_checkPhoneNumber;

- (BOOL)cl_checkChinaMobelPhoneNumber;

- (BOOL)cl_checkChinaUnicomPhoneNumber;

- (BOOL)cl_checkChinaTelecomPhoneNumber;

- (BOOL)cl_checkTelePhoneNumber;

- (BOOL)cl_checkFormatTelePhoneNumber;
```


### 正则表达式验证(身份证相关)@

```objective-c
- (BOOL)cl_checkIdentityCard;
```


### 正则表达式验证(账号相关)@

```objective-c
- (BOOL)cl_checkAccount;

- (BOOL)cl_checkPassword;

- (BOOL)cl_checkStrongPassword:(NSInteger)briefest
                       longest:(NSInteger)longest;
```


### 正则表达式验证(日期相关)@

```objective-c
- (BOOL)cl_checkChinaDateFormat;

- (BOOL)cl_checkAbroadDateFormat;

- (BOOL)cl_checkMonth;

- (BOOL)cl_checkDay;
```


### 正则表达式验证(特殊正则)@

```objective-c
- (BOOL)cl_checkEmailAddress;

- (BOOL)cl_checkDomainName;

- (BOOL)cl_checkURL;

- (BOOL)cl_checkXMLFile;

- (BOOL)cl_checkHTMLSign;

- (BOOL)cl_checkQQNumber;

- (BOOL)cl_checkPostalCode;

- (BOOL)cl_checkIPv4InternetProtocol;

- (BOOL)cl_regularWithRule:(NSString *)rule;
```



## NSTimer+CLTimer@

针对`Foundation`的`NSTimer`进行系统外的方法补充:

```objective-c
+ (NSTimer *)cl_scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval
                                       repeats:(BOOL)repeats
                                      complete:(CLTimer)complete;

+ (NSTimer *)cl_timerWithTimeInterval:(NSTimeInterval)timeInterval
                              repeats:(BOOL)repeats
                             complete:(CLTimer)complete;

- (void)cl_resumeTimer;

- (void)cl_pauseTimer;

- (void)cl_resumeTimerAfterTimeInterval:(NSTimeInterval)timeInterval;
```



## NSURL+CLURL@

针对`Foundation`的`NSURL`进行系统外的方法补充:

```objective-c
+ (void)cl_openBrowserWithURL:(NSString *)urlString;

+ (NSURL *)cl_getDocumentFileURL;

+ (NSURL *)cl_getLibraryFileURL;

+ (NSURL *)cl_getCachesFileURL;

+ (NSURL *)cl_getFileURLForDirectory:(NSSearchPathDirectory)directory;

+ (NSString *)cl_getDocumentPathURL;

+ (NSString *)cl_getLibraryPathURL;

+ (NSString *)cl_getCachesPathURL;

+ (NSString *)cl_getPathURLForDirectory:(NSSearchPathDirectory)directory;
```

