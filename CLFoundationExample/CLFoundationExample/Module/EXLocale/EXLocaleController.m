//
//  EXLocaleController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/7/2.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXLocaleController.h"

@interface EXLocaleController ()

@end

@implementation EXLocaleController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.ex_textViewString appendString:@"\n----------获取系统语言----------\n"];
    [self.ex_textViewString appendFormat:@"当前系统首先语言的第一个语言: %@\n", [CLLocaleManager cl_getSystemPreferredFistLocale]];
    [self.ex_textViewString appendFormat:@"当前系统首选语言为: %@\n", [CLLocaleManager cl_getSystemPreferredLocales]];
    [self.ex_textViewString appendFormat:@"获取系统所有的语言个数为: %ld\n", [CLLocaleManager cl_getAllSystemLocales].count];

    [self.ex_textViewString appendString:@"\n----------多语言设置----------\n"];
    NSString *ex_bundlePath = [NSBundle cl_getBundleFileWithName:@"zh-Hans"
                                                            type:@"lproj"];
    
    NSBundle *ex_bundle = [NSBundle bundleWithPath:ex_bundlePath];

    [self.ex_textViewString appendFormat:@"获取系统语言标签为Done的内容: %@\n", [CLLocaleManager cl_followSystemLocaleWithKey:@"Done"]];
    [self.ex_textViewString appendFormat:@"获取系统语言标签为Done的内容并设置备注为Localizable: %@\n", [CLLocaleManager cl_followSystemLocaleWithKey:@"Done"
                                                                                                                               comment:@"Localizable"]];
    [self.ex_textViewString appendFormat:@"获取EXLanguage语言文件标签为Done的内容并设置备注为EXLanguage: %@\n", [CLLocaleManager cl_followSystemLocaleWithKey:@"Done"
                                                                                                                                  tableName:@"EXLanguage"
                                                                                                                                    comment:@"EXLanguage"]];
    [self.ex_textViewString appendFormat:@"获取EXLanguage语言文件标签为Done的内容并设置备注为EXLanguage: %@\n", [CLLocaleManager cl_followSystemLocaleWithKey:@"Done"
                                                                                                                                  tableName:@"EXLanguage"
                                                                                                                                     bundle:ex_bundle
                                                                                                                                    comment:@"EXLanguage"]];
    
    [self.ex_textViewString appendString:@"\n----------自定义多语言设置----------\n"];
    [self.ex_textViewString appendFormat:@"自定义获取English语言环境下的内容: %@\n", [CLLocaleManager cl_customLocaleWithKey:@"Done"
                                                                                                     localeType:@"en"
                                                                                                      tableName:@"EXLanguage"]];
    [self.ex_textViewString appendFormat:@"自定义获取简体中文语言环境下的内容: %@\n", [CLLocaleManager cl_customLocaleWithKey:@"Done"
                                                                                                  localeType:@"zh-Hans"
                                                                                                   tableName:@"EXLanguage"]];
    
    if ([[CLLocaleManager cl_getCurrentSaveLocale] isEqualToString:@"zh-Hans"]) {
        
        [CLLocaleManager cl_saveCurrentLocaleWithKey:@"en"];
    } else {
        
        [CLLocaleManager cl_saveCurrentLocaleWithKey:@"zh-Hans"];
    }
    
    self.title = [CLLocaleManager cl_customLocaleWithKey:@"Title"
                                               tableName:@"EXLanguage"];

    [self ex_reloadTextView];
}

@end
