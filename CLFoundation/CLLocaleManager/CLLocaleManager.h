//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLLocaleManager.h
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/7/2.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLLocaleManager : NSObject

/**
 保存当前语言环境

 @param key NSString
 */
+ (void)cl_saveCurrentLocaleWithKey:(NSString *)key;

/**
 获取当前语言环境
 */
+ (NSString *)cl_getCurrentSaveLocale;

/**
 删除已保存的语言环境
 */
+ (void)cl_removeCurrentLocale;

#pragma mark - 系统语言相关
/**
 获取lproj的路径

 @param type NSString, 比如: zh-Hans, en
 @return NSString
 */
+ (NSString *)cl_getLocaleProjectPathWithType:(NSString *)type;

/**
 获取系统首选语言的第一语言

 @return NSString
 */
+ (NSString *)cl_getSystemPreferredFistLocale;

/**
 获取系统当前的首选语言顺序

 @return NSArray
 */
+ (NSArray *)cl_getSystemPreferredLocales;

/**
 获取系统所有的语言

 @return NSArray<NSString *>
 */
+ (NSArray<NSString *> *)cl_getAllSystemLocales;

/**
 获取系统语言的代号, 比如: zh, en

 @return NSString
 */
+ (NSString *)cl_getSystemLanguageCode;

/**
 获取系统语言当前显示的语言, 比如: 中文(中国), 中文(香港)

 @return NSString
 */
+ (NSString *)cl_getSystemShowLanguage;

/**
 获取系统当前语言下的Key标签文字

 @param key NSString
 @return NSString
 */
+ (NSString *)cl_followSystemLocaleWithKey:(NSString *)key;

/**
 获取系统当前语言下的Key标签文字

 @param key NSString
 @param comment NSString, 备注
 @return NSString
 */
+ (NSString *)cl_followSystemLocaleWithKey:(NSString *)key
                                   comment:(NSString *)comment;

/**
 获取系统当前语言下的Key标签文字
 
 @param key NSString
 @param tableName NSString, Locale.strings文件名
 @return NSString
 */
+ (NSString *)cl_followSystemLocaleWithKey:(NSString *)key
                                 tableName:(NSString *)tableName;

/**
 获取系统当前语言下的Key标签文字

 @param key NSString
 @param tableName NSString, Locale.strings文件名
 @param comment NSString, 备注
 @return NSString
 */
+ (NSString *)cl_followSystemLocaleWithKey:(NSString *)key
                                 tableName:(NSString *)tableName
                                   comment:(NSString *)comment;

/**
 获取系统当前语言下的Key标签文字
 
 @param key NSString
 @param tableName NSString, Locale.strings文件名
 @param bundle NSBundle
 @param comment NSString, 备注
 @return NSString
 */
+ (NSString *)cl_followSystemLocaleWithKey:(NSString *)key
                                 tableName:(NSString *)tableName
                                    bundle:(NSBundle *)bundle
                                   comment:(NSString *)comment;

/**
 获取系统当前语言下的Key标签文字

 @param key NSString
 @param tableName NSString, Locale.strings文件名
 @param bundle NSBundle
 @param value NSString
 @param comment NSString, 备注
 @return NSString
 */
+ (NSString *)cl_followSystemLocaleWithKey:(NSString *)key
                                 tableName:(NSString *)tableName
                                    bundle:(NSBundle *)bundle
                                     value:(NSString *)value
                                   comment:(NSString *)comment;

#pragma mark - 自定义语言相关
/**
 自定义多语言下的Key标签文字

 @param key NSString
 @param tableName NSString
 @return NSString
 */
+ (NSString *)cl_customLocaleWithKey:(NSString *)key
                           tableName:(NSString *)tableName;

/**
 自定义多语言下的Key标签文字

 @param key NSString
 @param localeType NSString, 比如简体中文为: zh-Hans
 @param tableName NSString, Locale.strings文件名
 @return NSString
 */
+ (NSString *)cl_customLocaleWithKey:(NSString *)key
                          localeType:(NSString *)localeType
                           tableName:(NSString *)tableName;

/**
 自定义多语言下的Key标签文字

 @param key NSString
 @param localeType NSString, 比如简体中文为: zh-Hans
 @param tableName NSString, Locale.strings文件名
 @param comment NSString, 备注
 @return NSString
 */
+ (NSString *)cl_customLocaleWithKey:(NSString *)key
                          localeType:(NSString *)localeType
                           tableName:(NSString *)tableName
                             comment:(NSString *)comment;

/**
 自定义多语言下的Key标签文字

 @param key NSString
 @param localeType NSString, 比如简体中文为: zh-Hans
 @param tableName NSString, Locale.strings文件名
 @param value NSString, 如果Key找不到, 则使用该默认值
 @param comment NSString, 备注
 @return NSString
 */
+ (NSString *)cl_customLocaleWithKey:(NSString *)key
                          localeType:(NSString *)localeType
                           tableName:(NSString *)tableName
                               value:(NSString *)value
                             comment:(NSString *)comment;
@end
