//
//  EXDataController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/14.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXDataController.h"

@interface EXDataController ()

@end

@implementation EXDataController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *ex_image = [UIImage imageNamed:@"1"];
    
    // 压缩前
    NSData *ex_imageData = UIImageJPEGRepresentation(ex_image, 1.0);

    // 压缩后
    NSData *ex_tranformImageData = [NSData cl_compressOriginalImage:ex_image
                                                 compressionQuality:0.5];
    
    NSData *ex_md2Data = [ex_tranformImageData cl_encryptredMD2Data];
    NSData *ex_md4Data = [ex_tranformImageData cl_encryptredMD4Data];
    NSData *ex_md5Data = [ex_tranformImageData cl_encryptredMD5Data];
    
    NSData *ex_sha1Data   = [ex_tranformImageData cl_encryptredSHA1Data];
    NSData *ex_sha224Data = [ex_tranformImageData cl_encryptredSHA224Data];
    NSData *ex_sha255Data = [ex_tranformImageData cl_encryptredSHA256Data];
    NSData *ex_sha384Data = [ex_tranformImageData cl_encryptredSHA384Data];
    NSData *ex_sha512Data = [ex_tranformImageData cl_encryptredSHA512Data];

    NSString *cl_encodingKey  = @"123";

    [self.ex_textViewString appendString:@"压缩相关:\n"];
    [self.ex_textViewString appendFormat:@"压缩前: %lud\n", ex_imageData.length];
    [self.ex_textViewString appendFormat:@"压缩后: %lud\n", ex_tranformImageData.length];

    [self.ex_textViewString appendString:@"\n散列加密相关:\n"];
    [self.ex_textViewString appendFormat:@"获取MD2加密后的NSData: %lud\n", ex_md2Data.length];
    [self.ex_textViewString appendFormat:@"获取MD4加密后的NSData: %lud\n", ex_md4Data.length];
    [self.ex_textViewString appendFormat:@"获取MD5加密后的NSData: %lud\n", ex_md5Data.length];
    [self.ex_textViewString appendFormat:@"获取SHA1加密后的NSData: %lud\n", ex_sha1Data.length];
    [self.ex_textViewString appendFormat:@"获取SHA224加密后的NSData: %lud\n", ex_sha224Data.length];
    [self.ex_textViewString appendFormat:@"获取SHA256加密后的NSData: %lud\n", ex_sha255Data.length];
    [self.ex_textViewString appendFormat:@"获取SHA384加密后的NSData: %lud\n", ex_sha384Data.length];
    [self.ex_textViewString appendFormat:@"获取SHA512加密后的NSData: %lud\n", ex_sha512Data.length];

    [self.ex_textViewString appendString:@"\n哈希加密相关:\n"];
    [self.ex_textViewString appendFormat:@"获取使用HASH Key:\"%@\" SHA1加密后的NSData: %@\n", cl_encodingKey, [ex_tranformImageData cl_hmacEncryptredSHA1StringWithKey:cl_encodingKey]];
    [self.ex_textViewString appendFormat:@"获取使用HASH Key:\"%@\" SHA224加密后的NSData: %@\n", cl_encodingKey, [ex_tranformImageData cl_hmacEncryptredSHA224StringWithKey:cl_encodingKey]];
    [self.ex_textViewString appendFormat:@"获取使用HASH Key:\"%@\" SHA256加密后的NSData: %@\n", cl_encodingKey, [ex_tranformImageData cl_hmacEncryptredSHA256StringWithKey:cl_encodingKey]];
    [self.ex_textViewString appendFormat:@"获取使用HASH Key:\"%@\" SHA384加密后的NSData: %@\n", cl_encodingKey, [ex_tranformImageData cl_hmacEncryptredSHA384StringWithKey:cl_encodingKey]];
    [self.ex_textViewString appendFormat:@"获取使用HASH Key:\"%@\" SHA512加密后的NSData: %@\n", cl_encodingKey, [ex_tranformImageData cl_hmacEncryptredSHA512StringWithKey:cl_encodingKey]];
    
    [self ex_reloadTextView];
}

@end
