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

    NSString *cl_encodingKey  = @"1234567890123456";

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

//    [self ex_dataWithAES128];
    [self ex_dataWith3DES];

    [self ex_reloadTextView];
}

- (void)ex_dataWithAES128 {
    
    UIImage *ex_image = [UIImage imageNamed:@"1"];

    NSString *cl_encodingKey  = @"1234567890123456";

    NSData *ex_tranformImageData = [NSData cl_compressOriginalImage:ex_image
                                                 compressionQuality:0.5];

    [self.ex_textViewString appendString:@"\nAES 128加密相关:\n"];
    
    NSData *ex_aes128EncryptData = [ex_tranformImageData cl_encryptedDataWithAESKey:cl_encodingKey
                                                                        encryptData:ex_tranformImageData];
    NSData *ex_aes128ECBEncryptData = [ex_tranformImageData cl_encryptedECBDataWithAESKey:cl_encodingKey
                                                                              encryptData:ex_tranformImageData];
    
    [self.ex_textViewString appendFormat:@"获取使用AES Key:\"%@\" AES128 CBC加密后的NSData: %lud\n", cl_encodingKey, ex_aes128EncryptData.length];
    [self.ex_textViewString appendFormat:@"获取使用AES Key:\"%@\" AES128 ECB加密后的NSData: %lud\n", cl_encodingKey, ex_aes128EncryptData.length];

    NSData *ex_aes128DecryptData = [ex_aes128EncryptData cl_decryptedDataWithAESKey:cl_encodingKey
                                                                        decryptData:ex_tranformImageData];
    NSData *ex_aes128ECBDecryptData = [ex_aes128ECBEncryptData cl_decryptedECBDataWithAESKey:cl_encodingKey
                                                                                 decryptData:ex_tranformImageData];
    
    
    NSLog(@"解密后AES 128 CBC长度: %ld", ex_aes128DecryptData.length);
    NSLog(@"解密后AES 128 ECB长度: %ld", ex_aes128ECBDecryptData.length);
    
    UIImage *ex_decryptImage = [UIImage imageWithData:ex_aes128ECBDecryptData];
    
    UIImageView *ex_imageView = [[UIImageView alloc] initWithImage:ex_decryptImage];
    
    ex_imageView.frame = self.view.bounds;
    
    [self.view addSubview:ex_imageView];
}

- (void)ex_dataWith3DES {
    
    UIImage *ex_image = [UIImage imageNamed:@"1"];
    
    NSString *cl_encodingKey  = @"12345678";
    
    NSData *ex_tranformImageData = [NSData cl_compressOriginalImage:ex_image
                                                 compressionQuality:0.5];

    [self.ex_textViewString appendString:@"\n3DES加密相关:\n"];
    
    NSLog(@"加密前的Data长度: %ld", ex_tranformImageData.length);
    
    NSData *ex_3desEncryptData = [ex_tranformImageData cl_encryptedDataWith3DESKey:cl_encodingKey
                                                                       encryptData:ex_tranformImageData];
    NSData *ex_3desECBEncryptData = [ex_tranformImageData cl_encryptedECBDataWithAESKey:cl_encodingKey
                                                                            encryptData:ex_tranformImageData];

    
    NSLog(@"加密后的3DES CBC长度: %ld", ex_3desEncryptData.length);

    [self.ex_textViewString appendFormat:@"获取使用3DES Key:\"%@\" 3DES CBC加密后的NSData: %lud\n", cl_encodingKey, ex_3desEncryptData.length];
    [self.ex_textViewString appendFormat:@"获取使用3DES Key:\"%@\" 3DES ECB加密后的NSData: %lud\n", cl_encodingKey, ex_3desECBEncryptData.length];
    
    NSData *ex_3desDecryptData = [ex_3desEncryptData cl_decryptedDataWith3DESKey:cl_encodingKey
                                                                     decryptData:ex_tranformImageData];
    NSData *ex_3desECBDecryptData = [ex_3desECBEncryptData cl_decryptedECBDataWithAESKey:cl_encodingKey
                                                                             decryptData:ex_tranformImageData];

    NSLog(@"解密后的3DES CBC长度: %ld", ex_3desDecryptData.length);
    NSLog(@"解密后的3DES ECB长度: %ld", ex_3desECBDecryptData.length);
    
    UIImage *ex_decryptImage = [UIImage imageWithData:ex_3desDecryptData];
    
    UIImageView *ex_imageView = [[UIImageView alloc] initWithImage:ex_decryptImage];
    
    ex_imageView.frame = self.view.bounds;
    
    [self.view addSubview:ex_imageView];
}

@end
