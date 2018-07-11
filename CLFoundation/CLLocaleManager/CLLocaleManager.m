//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLLocaleManager.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/7/2.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLLocaleManager.h"

#import "NSBundle+CLBundle.h"
#import "NSString+CLString.h"

@implementation CLLocaleManager

+ (void)cl_saveCurrentLocaleWithKey:(NSString *)key {
    
    if ([key cl_checkStringEmpty]) {
        
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:key
                                              forKey:@"CLApplicationLocale"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)cl_getCurrentSaveLocale {
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"CLApplicationLocale"];
}

+ (void)cl_removeCurrentLocale {
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"CLApplicationLocale"];
}

#pragma mark - 系统语言相关
+ (NSString *)cl_getLocaleProjectPathWithType:(NSString *)type {
    
    return [NSBundle cl_getBundleFileWithName:type
                                         type:@"lproj"];
}

+ (NSString *)cl_getSystemPreferredFistLocale {
    
    return [NSLocale preferredLanguages].firstObject;
}

+ (NSArray *)cl_getSystemPreferredLocales {
        
    return [NSLocale preferredLanguages];
}

+ (NSArray<NSString *> *)cl_getAllSystemLocales {
    
    return [NSLocale availableLocaleIdentifiers];
}

+ (NSString *)cl_getSystemLanguageCode {
    
    return [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode];
}

+ (NSString *)cl_getSystemShowLanguage {
    
    NSString *cl_identifier = [[NSLocale currentLocale] localeIdentifier];
    
    return [[NSLocale currentLocale] displayNameForKey:NSLocaleIdentifier
                                                 value:cl_identifier];
}

+ (NSString *)cl_followSystemLocaleWithKey:(NSString *)key {
    
    return [self cl_followSystemLocaleWithKey:key
                                      comment:nil];
}

+ (NSString *)cl_followSystemLocaleWithKey:(NSString *)key
                                   comment:(NSString *)comment {
    
    return NSLocalizedString(key, comment);
}

+ (NSString *)cl_followSystemLocaleWithKey:(NSString *)key
                                 tableName:(NSString *)tableName {
    
    return [self cl_followSystemLocaleWithKey:key
                                    tableName:tableName
                                      comment:nil];
}

+ (NSString *)cl_followSystemLocaleWithKey:(NSString *)key
                                 tableName:(NSString *)tableName
                                   comment:(NSString *)comment {
    
    return NSLocalizedStringFromTable(key, tableName, comment);
}

+ (NSString *)cl_followSystemLocaleWithKey:(NSString *)key
                                 tableName:(NSString *)tableName
                                    bundle:(NSBundle *)bundle {
    
    return [self cl_followSystemLocaleWithKey:key
                                    tableName:tableName
                                       bundle:bundle
                                      comment:nil];
}

+ (NSString *)cl_followSystemLocaleWithKey:(NSString *)key
                                 tableName:(NSString *)tableName
                                    bundle:(NSBundle *)bundle
                                   comment:(NSString *)comment {
    
    return NSLocalizedStringFromTableInBundle(key, tableName, bundle, comment);
}

+ (NSString *)cl_followSystemLocaleWithKey:(NSString *)key
                                 tableName:(NSString *)tableName
                                    bundle:(NSBundle *)bundle
                                     value:(NSString *)value {
    
    return [self cl_followSystemLocaleWithKey:key
                                    tableName:tableName
                                       bundle:bundle
                                        value:value
                                      comment:nil];
}

+ (NSString *)cl_followSystemLocaleWithKey:(NSString *)key
                                 tableName:(NSString *)tableName
                                    bundle:(NSBundle *)bundle
                                     value:(NSString *)value
                                   comment:(NSString *)comment {
    
    return NSLocalizedStringWithDefaultValue(key, tableName, bundle, value, comment);
}

#pragma mark - 自定义语言相关
+ (NSString *)cl_customLocaleWithKey:(NSString *)key
                           tableName:(NSString *)tableName {
    
    NSString *ex_localType = [CLLocaleManager cl_getCurrentSaveLocale];
    
    return [self cl_customLocaleWithKey:key
                             localeType:ex_localType
                              tableName:tableName];
}

+ (NSString *)cl_customLocaleWithKey:(NSString *)key
                          localeType:(NSString *)localeType
                           tableName:(NSString *)tableName {
    
    return [self cl_customLocaleWithKey:key
                             localeType:localeType
                               tableName:tableName
                                  comment:nil];
}

+ (NSString *)cl_customLocaleWithKey:(NSString *)key
                          localeType:(NSString *)localeType
                           tableName:(NSString *)tableName
                             comment:(NSString *)comment {
    
    NSString *cl_bundlePath = [self cl_getLocaleProjectPathWithType:localeType];
    
    NSBundle *cl_bundle = [NSBundle bundleWithPath:cl_bundlePath];
    
    return [self cl_followSystemLocaleWithKey:key
                                    tableName:tableName
                                       bundle:cl_bundle
                                      comment:nil];
}

+ (NSString *)cl_customLocaleWithKey:(NSString *)key
                          localeType:(NSString *)localeType
                           tableName:(NSString *)tableName
                               value:(NSString *)value
                             comment:(NSString *)comment {
    
    NSString *cl_bundlePath = [self cl_getLocaleProjectPathWithType:localeType];

    NSBundle *cl_bundle = [NSBundle bundleWithPath:cl_bundlePath];
    
    return [self cl_followSystemLocaleWithKey:key
                                    tableName:tableName
                                       bundle:cl_bundle
                                        value:value
                                      comment:comment];
}

@end
