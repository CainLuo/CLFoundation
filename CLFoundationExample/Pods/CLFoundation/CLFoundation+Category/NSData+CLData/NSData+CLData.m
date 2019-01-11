//
//  NSData+CLData.m
//  CLFoundation
//
//  Created by Mac on 2018/1/23.
//  Copyright © 2018年 Cain. All rights reserved.
//

#import "NSData+CLData.h"
#import "NSString+CLString.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSData (CLData)

+ (NSData *)cl_compressOriginalImage:(UIImage *)image
                  compressionQuality:(CGFloat)compressionQuality {
    
    NSData *cl_data = UIImageJPEGRepresentation(image, compressionQuality);
    
    CGFloat cl_dataKBytes = cl_data.length / 1000.0;
    CGFloat cl_maxQuality = 0.9f;
    CGFloat cl_lastData   = cl_dataKBytes;
    
    while (cl_dataKBytes > compressionQuality && cl_maxQuality > 0.01f) {
        
        cl_maxQuality = cl_maxQuality - 0.01f;
        
        cl_data = UIImageJPEGRepresentation(image, cl_maxQuality);
        
        cl_dataKBytes = cl_data.length / 1000.0;
        
        if (cl_lastData == cl_dataKBytes) {
            
            break;
            
        } else {
            
            cl_lastData = cl_dataKBytes;
        }
    }
    
    return cl_data;
}

+ (NSString *)cl_replacingAPNsTokenWithData:(NSData *)data {
    
    NSString *cl_replacingStringOne   = [[data description] stringByReplacingOccurrencesOfString:@"<" withString: @""];
    NSString *cl_replacingStringTwo   = [cl_replacingStringOne stringByReplacingOccurrencesOfString: @">" withString: @""];
    NSString *cl_replacingStringThree = [cl_replacingStringTwo stringByReplacingOccurrencesOfString: @" " withString: @""];

    return cl_replacingStringThree;
}

#pragma mark - Base 64
+ (NSData *)cl_transformDataWithBase64EncodedString:(NSString *)string {
    
    if ([NSString cl_checkEmptyWithString:string]) {
        
        return nil;
    }
    
    NSData *cl_decodedData = [[NSData alloc] initWithBase64EncodedString:string
                                                                 options:NSDataBase64DecodingIgnoreUnknownCharacters];

    return [cl_decodedData length] ? cl_decodedData: nil;
}

+ (NSString *)cl_transformBase64EncodedStringWithData:(NSData *)data
                                            wrapWidth:(CLEncodedType)wrapWidth {
    
    if (![data length]) {
        
        return nil;
    }
    
    NSString *cl_dataEncodedString = nil;
    
    switch (wrapWidth) {
        case CLEncodedType64: {
            
            return [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        } case CLEncodedType76: {
            
            return [data base64EncodedStringWithOptions:NSDataBase64Encoding76CharacterLineLength];
            
        } default: {
            
            cl_dataEncodedString = [data base64EncodedStringWithOptions:(NSDataBase64EncodingOptions)0];
        }
    }

    if (!wrapWidth || wrapWidth >= [cl_dataEncodedString length]) {
        
        return cl_dataEncodedString;
    }
    
    wrapWidth = (wrapWidth / 4) * 4;
    
    NSMutableString *cl_resultString = [NSMutableString string];
    
    for (NSUInteger i = 0; i < [cl_dataEncodedString length]; i+= wrapWidth) {
        
        if (i + wrapWidth >= [cl_dataEncodedString length]) {
            
            [cl_resultString appendString:[cl_dataEncodedString substringFromIndex:i]];
            
            break;
        }
        
        [cl_resultString appendString:[cl_dataEncodedString
                                       substringWithRange:NSMakeRange(i, wrapWidth)]];
        
        [cl_resultString appendString:@"\r\n"];
    }
    
    return cl_resultString;
}

#pragma mark - AES
- (NSData *)cl_encryptedDataWithAESKey:(NSString *)key
                           encryptData:(NSData *)encryptData {
    
    return [self cl_formatAES128DataWithOperation:kCCEncrypt
                                          options:kCCOptionPKCS7Padding
                                              key:key
                                             data:encryptData];
}

- (NSData *)cl_decryptedDataWithAESKey:(NSString *)key
                           decryptData:(NSData *)decryptData {
    
    return [self cl_formatAES128DataWithOperation:kCCDecrypt
                                          options:kCCOptionPKCS7Padding
                                              key:key
                                             data:decryptData];
}

- (NSData *)cl_encryptedECBDataWithAESKey:(NSString *)key
                              encryptData:(NSData *)encryptData {
    
    return [self cl_formatAES128DataWithOperation:kCCEncrypt
                                          options:kCCOptionPKCS7Padding|kCCOptionECBMode
                                              key:key
                                             data:encryptData];
}

- (NSData *)cl_decryptedECBDataWithAESKey:(NSString *)key
                              decryptData:(NSData *)decryptData {
    
    return [self cl_formatAES128DataWithOperation:kCCDecrypt
                                          options:kCCOptionPKCS7Padding|kCCOptionECBMode
                                              key:key
                                             data:decryptData];
}

#pragma mark - AES通用加密/解密私有方法, 私有
- (NSData *)cl_formatAES128DataWithOperation:(CCOperation)operation
                                     options:(CCOptions)options
                                         key:(NSString *)key
                                        data:(NSData *)data {
    
    NSData *cl_keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    
    size_t cl_dataMoved;
    
    NSMutableData *cl_mutableData = [NSMutableData dataWithLength:self.length + kCCBlockSizeAES128];
    
    CCCryptorStatus cl_cryptorStatus = CCCrypt(operation,
                                               kCCAlgorithmAES128,
                                               options,
                                               cl_keyData.bytes,
                                               cl_keyData.length,
                                               data.bytes,
                                               self.bytes,
                                               self.length,
                                               cl_mutableData.mutableBytes,
                                               cl_mutableData.length,
                                               &cl_dataMoved);
    
    if (cl_cryptorStatus == kCCSuccess) {
        
        cl_mutableData.length = cl_dataMoved;
        
        return cl_mutableData;
    }
    
    return nil;
}

#pragma mark - 3DES
- (NSData *)cl_encryptedDataWith3DESKey:(NSString *)key
                            encryptData:(NSData *)encryptData {
    
    return [self cl_format3DESDataWithOperation:kCCEncrypt
                                        options:kCCOptionPKCS7Padding
                                            key:key
                                           data:encryptData];
}

- (NSData *)cl_decryptedDataWith3DESKey:(NSString *)key
                            decryptData:(NSData *)decryptData {
    
    return [self cl_format3DESDataWithOperation:kCCDecrypt
                                        options:kCCOptionPKCS7Padding
                                            key:key
                                           data:decryptData];
}

- (NSData *)cl_encryptedECBDataWith3DESKey:(NSString *)key
                               encryptData:(NSData *)encryptData {
    
    return [self cl_format3DESDataWithOperation:kCCEncrypt
                                        options:kCCOptionPKCS7Padding|kCCOptionECBMode
                                            key:key
                                           data:encryptData];
}

- (NSData *)cl_decryptedECBDataWith3DESKey:(NSString *)key
                               decryptData:(NSData *)decryptData {
    
    return [self cl_format3DESDataWithOperation:kCCDecrypt
                                        options:kCCOptionPKCS7Padding|kCCOptionECBMode
                                            key:key
                                           data:decryptData];
}

#pragma mark - 3DES加密/解密通用方法, 私有
- (NSData *)cl_format3DESDataWithOperation:(CCOperation)operation
                                   options:(CCOptions)options
                                       key:(NSString *)key
                                      data:(NSData *)data {
    
    NSData *cl_keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    
    size_t cl_dataMoved;
    
    NSMutableData *cl_mutableData = [NSMutableData dataWithLength:self.length + kCCBlockSize3DES];
    
    CCCryptorStatus cl_cryptorStatus = CCCrypt(operation,
                                               kCCAlgorithm3DES,
                                               options,
                                               cl_keyData.bytes,
                                               kCCKeySize3DES,
                                               data.bytes,
                                               self.bytes,
                                               self.length,
                                               cl_mutableData.mutableBytes,
                                               cl_mutableData.length,
                                               &cl_dataMoved);
    
    if (cl_cryptorStatus == kCCSuccess) {
        
        cl_mutableData.length = cl_dataMoved;
        
        return cl_mutableData;
    }
    
    return nil;
}

#pragma mark - MD加密
- (NSString *)cl_encryptredMD2String {
    
    unsigned char cl_result[CC_MD2_DIGEST_LENGTH];
    
    CC_MD2(self.bytes, (CC_LONG)self.length, cl_result);
    
    return [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", cl_result[0], cl_result[1], cl_result[2], cl_result[3],
                                                                                                            cl_result[4], cl_result[5], cl_result[6], cl_result[7],
                                                                                                            cl_result[8], cl_result[9], cl_result[10], cl_result[11],
                                                                                                            cl_result[12], cl_result[13], cl_result[14], cl_result[15]];
}

- (NSData *)cl_encryptredMD2Data {
    
    unsigned char cl_result[CC_MD2_DIGEST_LENGTH];
    
    CC_MD2(self.bytes,
           (CC_LONG)self.length,
           cl_result);
    
    return [NSData dataWithBytes:cl_result
                          length:CC_MD2_DIGEST_LENGTH];
}

- (NSString *)cl_encryptredMD4String {
    
    unsigned char cl_result[CC_MD4_DIGEST_LENGTH];
    
    CC_MD4(self.bytes,
           (CC_LONG)self.length,
           cl_result);
    
    return [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", cl_result[0], cl_result[1], cl_result[2], cl_result[3],
                                                                                                            cl_result[4], cl_result[5], cl_result[6], cl_result[7],
                                                                                                            cl_result[8], cl_result[9], cl_result[10], cl_result[11],
                                                                                                            cl_result[12], cl_result[13], cl_result[14], cl_result[15]];
}

- (NSData *)cl_encryptredMD4Data {
    
    unsigned char cl_result[CC_MD4_DIGEST_LENGTH];
    
    CC_MD4(self.bytes,
           (CC_LONG)self.length,
           cl_result);
    
    return [NSData dataWithBytes:cl_result
                          length:CC_MD4_DIGEST_LENGTH];
}

- (NSString *)cl_encryptredMD5String {
    
    unsigned char cl_result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(self.bytes,
           (CC_LONG)self.length,
           cl_result);
    
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", cl_result[0], cl_result[1], cl_result[2], cl_result[3],
                                                                                                           cl_result[4], cl_result[5], cl_result[6], cl_result[7],
                                                                                                           cl_result[8], cl_result[9], cl_result[10], cl_result[11],
                                                                                                           cl_result[12], cl_result[13], cl_result[14], cl_result[15]];
}

- (NSString *)cl_hmacEncryptredMD5StringWithKey:(NSString *)key {
    
    return [self cl_hmacStringUsingWithHmacAlgorithm:kCCHmacAlgMD5
                                                 key:key];
}

- (NSData *)cl_encryptredMD5Data {
    
    unsigned char cl_result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(self.bytes,
           (CC_LONG)self.length,
           cl_result);
    
    return [NSData dataWithBytes:cl_result
                          length:CC_MD5_DIGEST_LENGTH];
}

- (NSData *)cl_hmacEncryptredMD5DataWithKey:(NSData *)key {
    
    return [self cl_hmacDataUsingWithHmacAlgorithm:kCCHmacAlgMD5
                                               key:key];
}

#pragma mark - SHA加密
- (NSString *)cl_encryptredSHA1String {
    
    unsigned char cl_result[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(self.bytes,
            (CC_LONG)self.length,
            cl_result);
    
    NSMutableString *cl_hashString = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        
        [cl_hashString appendFormat:@"%02x", cl_result[i]];
    }
    
    return cl_hashString;
}

- (NSString *)cl_hmacEncryptredSHA1StringWithKey:(NSString *)key {
    
    return [self cl_hmacStringUsingWithHmacAlgorithm:kCCHmacAlgSHA1
                                                 key:key];
}

- (NSData *)cl_encryptredSHA1Data {
    
    unsigned char cl_result[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(self.bytes,
            (CC_LONG)self.length,
            cl_result);
    
    return [NSData dataWithBytes:cl_result
                          length:CC_SHA1_DIGEST_LENGTH];
}

- (NSData *)cl_hmacEncryptredSHA1DataWithKey:(NSData *)key {
    
    return [self cl_hmacDataUsingWithHmacAlgorithm:kCCHmacAlgSHA1
                                                 key:key];
}

- (NSString *)cl_encryptredSHA224String {
    
    unsigned char cl_result[CC_SHA224_DIGEST_LENGTH];
    
    CC_SHA224(self.bytes,
              (CC_LONG)self.length,
              cl_result);
    
    NSMutableString *cl_hashString = [NSMutableString stringWithCapacity:CC_SHA224_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_SHA224_DIGEST_LENGTH; i++) {
        
        [cl_hashString appendFormat:@"%02x", cl_result[i]];
    }
    
    return cl_hashString;
}

- (NSString *)cl_hmacEncryptredSHA224StringWithKey:(NSString *)key {
    
    return [self cl_hmacStringUsingWithHmacAlgorithm:kCCHmacAlgSHA224
                                                 key:key];
}

- (NSData *)cl_encryptredSHA224Data {
    
    unsigned char cl_result[CC_SHA224_DIGEST_LENGTH];
    
    CC_SHA224(self.bytes,
              (CC_LONG)self.length,
              cl_result);
    
    return [NSData dataWithBytes:cl_result
                          length:CC_SHA224_DIGEST_LENGTH];
}

- (NSData *)cl_hmacEncryptredSHA224DataWithKey:(NSData *)key {
    
    return [self cl_hmacDataUsingWithHmacAlgorithm:kCCHmacAlgSHA224
                                               key:key];
}

- (NSString *)cl_encryptredSHA256String {
    
    unsigned char cl_result[CC_SHA256_DIGEST_LENGTH];
    
    CC_SHA256(self.bytes,
              (CC_LONG)self.length,
              cl_result);
    
    NSMutableString *cl_hashString = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        
        [cl_hashString appendFormat:@"%02x", cl_result[i]];
    }
    
    return cl_hashString;
}

- (NSString *)cl_hmacEncryptredSHA256StringWithKey:(NSString *)key {
    
    return [self cl_hmacStringUsingWithHmacAlgorithm:kCCHmacAlgSHA256
                                                 key:key];
}

- (NSData *)cl_encryptredSHA256Data {
    
    unsigned char cl_result[CC_SHA256_DIGEST_LENGTH];
    
    CC_SHA256(self.bytes,
              (CC_LONG)self.length,
              cl_result);
    
    return [NSData dataWithBytes:cl_result
                          length:CC_SHA256_DIGEST_LENGTH];
}

- (NSData *)cl_hmacEncryptredSHA256DataWithKey:(NSData *)key {
    
    return [self cl_hmacDataUsingWithHmacAlgorithm:kCCHmacAlgSHA256
                                               key:key];
}

- (NSString *)cl_encryptredSHA384String {
    
    unsigned char cl_result[CC_SHA384_DIGEST_LENGTH];
    
    CC_SHA384(self.bytes,
              (CC_LONG)self.length,
              cl_result);
    
    NSMutableString *cl_hashString = [NSMutableString stringWithCapacity:CC_SHA384_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_SHA384_DIGEST_LENGTH; i++) {
        
        [cl_hashString appendFormat:@"%02x", cl_result[i]];
    }
    
    return cl_hashString;
}

- (NSString *)cl_hmacEncryptredSHA384StringWithKey:(NSString *)key {
    
    return [self cl_hmacStringUsingWithHmacAlgorithm:kCCHmacAlgSHA384
                                                 key:key];
}

- (NSData *)cl_encryptredSHA384Data {
    
    unsigned char cl_result[CC_SHA384_DIGEST_LENGTH];
    
    CC_SHA384(self.bytes,
              (CC_LONG)self.length,
              cl_result);
    
    return [NSData dataWithBytes:cl_result
                          length:CC_SHA384_DIGEST_LENGTH];
}

- (NSData *)cl_hmacEncryptredSHA384DataWithKey:(NSData *)key {
    
    return [self cl_hmacDataUsingWithHmacAlgorithm:kCCHmacAlgSHA384
                                               key:key];
}

- (NSString *)cl_encryptredSHA512String {
    
    unsigned char cl_result[CC_SHA512_DIGEST_LENGTH];
    
    CC_SHA512(self.bytes,
              (CC_LONG)self.length,
              cl_result);
    
    NSMutableString *cl_hashString = [NSMutableString stringWithCapacity:CC_SHA512_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_SHA512_DIGEST_LENGTH; i++) {
        
        [cl_hashString appendFormat:@"%02x", cl_result[i]];
    }
    
    return cl_hashString;
}

- (NSString *)cl_hmacEncryptredSHA512StringWithKey:(NSString *)key {
    
    return [self cl_hmacStringUsingWithHmacAlgorithm:kCCHmacAlgSHA512
                                                 key:key];
}

- (NSData *)cl_encryptredSHA512Data {
    
    unsigned char cl_result[CC_SHA512_DIGEST_LENGTH];
    
    CC_SHA512(self.bytes,
              (CC_LONG)self.length,
              cl_result);
    
    return [NSData dataWithBytes:cl_result
                          length:CC_SHA512_DIGEST_LENGTH];
}

- (NSData *)cl_hmacEncryptredSHA512DataWithKey:(NSData *)key {
    
    return [self cl_hmacDataUsingWithHmacAlgorithm:kCCHmacAlgSHA512
                                               key:key];
}

- (id)cl_dataJSONValueDecoded {
    
    NSError *error = nil;
    
    id value = [NSJSONSerialization JSONObjectWithData:self
                                               options:kNilOptions
                                                 error:&error];
    
    if (error) {
        NSLog(@"Data Json Value Decoded Error:%@", error);
    }
    
    return value;
}

+ (NSData *)cl_getDataWithBundleNamed:(NSString *)name {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:name
                                                     ofType:@""];
    
    if (!path) return nil;
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    return data;
}

#pragma mark - Hash加密的API
- (NSString *)cl_hmacStringUsingWithHmacAlgorithm:(CCHmacAlgorithm)hmacAlgorithm
                                              key:(NSString *)key {
    size_t cl_size;
    switch (hmacAlgorithm) {
            
        case kCCHmacAlgMD5: cl_size    = CC_MD5_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA1: cl_size   = CC_SHA1_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA224: cl_size = CC_SHA224_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA256: cl_size = CC_SHA256_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA384: cl_size = CC_SHA384_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA512: cl_size = CC_SHA512_DIGEST_LENGTH; break;
            
        default: return nil;
    }
    
    unsigned char cl_result[cl_size];
    
    const char *cl_hasKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    
    CCHmac(hmacAlgorithm,
           cl_hasKey,
           strlen(cl_hasKey),
           self.bytes,
           self.length,
           cl_result);
    
    NSMutableString *cl_hashString = [NSMutableString stringWithCapacity:cl_size * 2];
    
    for (int i = 0; i < cl_size; i++) {
        
        [cl_hashString appendFormat:@"%02x", cl_result[i]];
    }
    
    return cl_hashString;
}

- (NSData *)cl_hmacDataUsingWithHmacAlgorithm:(CCHmacAlgorithm)hmacAlgorithm
                                          key:(NSData *)key {
    size_t cl_size;
    
    switch (hmacAlgorithm) {
        case kCCHmacAlgMD5: cl_size    = CC_MD5_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA1: cl_size   = CC_SHA1_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA224: cl_size = CC_SHA224_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA256: cl_size = CC_SHA256_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA384: cl_size = CC_SHA384_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA512: cl_size = CC_SHA512_DIGEST_LENGTH; break;
        default: return nil;
    }
    
    unsigned char cl_result[cl_size];
    
    CCHmac(hmacAlgorithm,
           [key bytes],
           key.length,
           self.bytes,
           self.length,
           cl_result);
    
    return [NSData dataWithBytes:cl_result
                          length:cl_size];
}

@end
