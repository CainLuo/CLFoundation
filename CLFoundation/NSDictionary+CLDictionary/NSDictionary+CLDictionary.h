//
//  NSDictionary+CLDictionary.h
//  SimpleProject
//
//  Created by Cain on 2017/8/28.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (CLDictionary)

/**
 将指定的URL字符串转成NSDictionary
 
 @param urlString URL字符串, 格式: http://www.xxxx.com?a=1&b=2 || a=1&b=2
 @return NSDictionary
 */
+ (NSDictionary *)cl_dictionaryWithURLString:(NSString *)urlString;

@end
