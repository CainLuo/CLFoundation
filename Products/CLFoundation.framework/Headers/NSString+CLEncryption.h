//
//  NSString+CLEncryption.h
//  SimpleProject
//
//  Created by Cain on 2017/8/24.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CLEncryption)

/**
 将data数据转成Base64字符串
 
 @param data data对象
 @param length NSUInteger
 @return NSString
 */
+ (NSString *)cl_base64StringFromData:(NSData *)data
                               length:(NSUInteger)length;

/**
 加密成MD5字符串
 
 @return NSString
 */
- (NSString *)cl_md5WithString;

@end
