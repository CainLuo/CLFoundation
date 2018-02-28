//
//  NSData+CLData.m
//  CLFoundation
//
//  Created by Mac on 2018/1/23.
//  Copyright © 2018年 Cain. All rights reserved.
//

#import "NSData+CLData.h"
#import "NSString+CLString.h"
#import <CommonCrypto/CommonCryptor.h>

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
                                            wrapWidth:(CLDataBaseType)wrapWidth {
    
    if (![data length]) {
        
        return nil;
    }
    
    NSString *cl_dataEncodedString = nil;
    
    switch (wrapWidth) {
        case CLDataBaseType64: {
            
            return [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        } case CLDataBaseType76: {
            
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
    
    NSData *cl_keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    
    size_t cl_dataMoved;
    NSMutableData *cl_encryptedData = [NSMutableData dataWithLength:self.length + kCCBlockSizeAES128];
    
    CCCryptorStatus cl_cryptorStatus = CCCrypt(kCCEncrypt,
                                               kCCAlgorithmAES128,
                                               kCCOptionPKCS7Padding,
                                               cl_keyData.bytes,
                                               cl_keyData.length,
                                               encryptData.bytes,
                                               self.bytes,
                                               self.length,
                                               cl_encryptedData.mutableBytes,
                                               cl_encryptedData.length,
                                               &cl_dataMoved);
    
    if (cl_cryptorStatus == kCCSuccess) {
        
        cl_encryptedData.length = cl_dataMoved;
        
        return cl_encryptedData;
    }
    
    return nil;
}

- (NSData *)cl_decryptedDataWithAESKey:(NSString *)key
                           decryptData:(NSData *)decryptData {
    
    NSData *cl_keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    
    size_t cl_dataMoved;
    
    NSMutableData *cl_decryptedData = [NSMutableData dataWithLength:self.length + kCCBlockSizeAES128];
    
    CCCryptorStatus cl_cryptorStatus = CCCrypt(kCCDecrypt,
                                               kCCAlgorithmAES128,
                                               kCCOptionPKCS7Padding,
                                               cl_keyData.bytes,
                                               cl_keyData.length,
                                               decryptData.bytes,
                                               self.bytes,
                                               self.length,
                                               cl_decryptedData.mutableBytes,
                                               cl_decryptedData.length,
                                               &cl_dataMoved);
    
    if (cl_cryptorStatus == kCCSuccess) {
        
        cl_decryptedData.length = cl_dataMoved;
        
        return cl_decryptedData;
    }
    
    return nil;
}

#pragma mark - 3DES
- (NSData *)cl_encryptedDataWith3DESKey:(NSString *)key
                            encryptData:(NSData *)encryptData {
    
    NSData *cl_keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    
    size_t cl_dataMoved;
    NSMutableData *cl_encryptedData = [NSMutableData dataWithLength:self.length + kCCBlockSize3DES];
    
    CCCryptorStatus cl_cryptorStatus = CCCrypt(kCCEncrypt,
                                               kCCAlgorithm3DES,
                                               kCCOptionPKCS7Padding,
                                               cl_keyData.bytes,
                                               cl_keyData.length,
                                               encryptData.bytes,
                                               self.bytes,
                                               self.length,
                                               cl_encryptedData.mutableBytes,
                                               cl_encryptedData.length,
                                               &cl_dataMoved);
    
    if (cl_cryptorStatus == kCCSuccess) {
        
        cl_encryptedData.length = cl_dataMoved;
        
        return cl_encryptedData;
    }
    
    return nil;
}

- (NSData *)cl_decryptedDataWith3DEKey:(NSString *)key
                           decryptData:(NSData *)decryptData {
    
    NSData *cl_keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    
    size_t cl_dataMoved;
    
    NSMutableData *cl_decryptedData = [NSMutableData dataWithLength:self.length + kCCBlockSize3DES];
    
    CCCryptorStatus cl_cryptorStatus = CCCrypt(kCCDecrypt,
                                               kCCAlgorithm3DES,
                                               kCCOptionPKCS7Padding,
                                               cl_keyData.bytes,
                                               cl_keyData.length,
                                               decryptData.bytes,
                                               self.bytes,
                                               self.length,
                                               cl_decryptedData.mutableBytes,
                                               cl_decryptedData.length,
                                               &cl_dataMoved);
    
    if (cl_cryptorStatus == kCCSuccess) {
        
        cl_decryptedData.length = cl_dataMoved;
        
        return cl_decryptedData;
    }
    
    return nil;
}

@end
