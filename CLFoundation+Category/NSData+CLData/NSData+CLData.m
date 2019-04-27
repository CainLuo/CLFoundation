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
#import <Security/Security.h>

NSString *const CLPublicTag  = @"RSAUtil_PubKey";
NSString *const CLPrivateTag = @"RSAUtil_PrivKey";

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

#pragma mark - RSA加密
+ (NSString *)cl_encryptString:(NSString *)content
                        rsaKey:(NSString *)rsaKey
                       keyType:(CLRSAKeyType)keyType {

    NSData *data = [self cl_encryptData:[content dataUsingEncoding:NSUTF8StringEncoding]
                                 rsaKey:rsaKey
                                keyType:keyType];
    
    return [self cl_base64EncodeWithData:data];
}

+ (NSData *)cl_encryptData:(NSData *)data
                    rsaKey:(NSString *)rsaKey
                   keyType:(CLRSAKeyType)keyType {

    if (!data || !rsaKey) {
        return nil;
    }
    
    BOOL cl_isPublic = (keyType == CLRSAKeyTypePublic);
    
    SecKeyRef cl_secKeyRef = [self cl_addRSAKey:rsaKey
                                         keyTag:cl_isPublic ? CLPublicTag : CLPrivateTag
                                        keyType:keyType];

    if(!cl_secKeyRef){
        
        return nil;
    }
    
    return [self cl_encryptData:data
                      secKeyRef:cl_secKeyRef
                         isSign:!cl_isPublic];
}

+ (NSString *)cl_base64EncodeWithData:(NSData *)data {
    data = [data base64EncodedDataWithOptions:0];
    
    return [[NSString alloc] initWithData:data
                                 encoding:NSUTF8StringEncoding];
}

+ (NSData *)cl_decryptData:(NSData *)data
                    rsaKey:(NSString *)rsaKey
                   keyType:(CLRSAKeyType)keyType {
    
    if(!data || !rsaKey.length){
        return nil;
    }
    
    BOOL cl_isPublic = (keyType == CLRSAKeyTypePublic);
    
    SecKeyRef cl_secKeyRef = [self cl_addRSAKey:rsaKey
                                         keyTag:cl_isPublic ? CLPublicTag : CLPrivateTag
                                        keyType:keyType];
    
    if(!cl_secKeyRef){
        return nil;
    }
    
    return [self cl_decryptData:data
                      secKeyRef:cl_secKeyRef];
}

+ (NSString *)cl_decryptString:(NSString *)conent
                        rsaKey:(NSString *)rsaKey
                       keyType:(CLRSAKeyType)keyType {
    
    NSData *data = [self cl_transformDataWithBase64EncodedString:conent];
    
    data = [self cl_decryptData:data
                         rsaKey:rsaKey
                        keyType:keyType];

    return [[NSString alloc] initWithData:data
                                 encoding:NSUTF8StringEncoding];
}

// ******* RSA Private Method Start ******* //
+ (NSData *)cl_encryptData:(NSData *)data
                 secKeyRef:(SecKeyRef)secKeyRef
                    isSign:(BOOL)isSign {
    
    const uint8_t *srcbuf = (const uint8_t *)[data bytes];
    size_t srclen = (size_t)data.length;
    
    size_t block_size = SecKeyGetBlockSize(secKeyRef) * sizeof(uint8_t);
    void *outbuf = malloc(block_size);
    size_t src_block_size = block_size - 11;
    
    NSMutableData *ret = [[NSMutableData alloc] init];
    for(int idx=0; idx<srclen; idx+=src_block_size){
        //NSLog(@"%d/%d block_size: %d", idx, (int)srclen, (int)block_size);
        size_t data_len = srclen - idx;
        if(data_len > src_block_size){
            data_len = src_block_size;
        }
        
        size_t outlen = block_size;
        OSStatus status = noErr;
        
        if (isSign) {
            status = SecKeyRawSign(secKeyRef,
                                   kSecPaddingPKCS1,
                                   srcbuf + idx,
                                   data_len,
                                   outbuf,
                                   &outlen);
        } else {
            status = SecKeyEncrypt(secKeyRef,
                                   kSecPaddingPKCS1,
                                   srcbuf + idx,
                                   data_len,
                                   outbuf,
                                   &outlen);
        }
        
        if (status != 0) {
            NSLog(@"SecKeyEncrypt fail. Error Code: %d", status);
            ret = nil;
            break;
        } else {
            [ret appendBytes:outbuf
                      length:outlen];
        }
    }
    
    free(outbuf);
    CFRelease(secKeyRef);
    return ret;
}

+ (NSData *)cl_stripPublicKeyHeader:(NSData *)keyData {
    // Skip ASN.1 public key header
    if (keyData == nil) return(nil);
    
    unsigned long cl_dataLength = [keyData length];
    if (!cl_dataLength) return(nil);
    
    unsigned char *cl_charKey = (unsigned char *)[keyData bytes];
    unsigned int  cl_index     = 0;
    
    if (cl_charKey[cl_index++] != 0x30) return(nil);
    
    if (cl_charKey[cl_index] > 0x80) cl_index += cl_charKey[cl_index] - 0x80 + 1;
    else cl_index++;
    
    // PKCS #1 rsaEncryption szOID_RSA_RSA
    static unsigned char cl_seqiod[] = {0x30, 0x0d, 0x06,
                                        0x09, 0x2a, 0x86,
                                        0x48, 0x86, 0xf7,
                                        0x0d, 0x01, 0x01,
                                        0x01, 0x05, 0x00};
    
    if (memcmp(&cl_charKey[cl_index], cl_seqiod, 15)) return(nil);
    
    cl_index += 15;
    
    if (cl_charKey[cl_index++] != 0x03) return(nil);
    
    if (cl_charKey[cl_index] > 0x80) cl_index += cl_charKey[cl_index] - 0x80 + 1;
    else cl_index++;
    
    if (cl_charKey[cl_index++] != '\0') return(nil);
    
    // Now make a new NSData from this buffer
    return([NSData dataWithBytes:&cl_charKey[cl_index]
                          length:cl_dataLength - cl_index]);
}

//credit: http://hg.mozilla.org/services/fx-home/file/tip/Sources/NetworkAndStorage/CryptoUtils.m#l1036
+ (NSData *)cl_stripPrivateKeyHeader:(NSData *)keyData {
    // Skip ASN.1 private key header
    if (keyData == nil) return(nil);
    
    unsigned long cl_dataLength = [keyData length];
    if (!cl_dataLength) return(nil);
    
    unsigned char *cl_keyBytes = (unsigned char *)[keyData bytes];
    unsigned int  cl_index     = 22; //magic byte at offset 22
    
    if (0x04 != cl_keyBytes[cl_index++]) return nil;
    
    //calculate length of the key
    unsigned int cl_keyLength = cl_keyBytes[cl_index++];
    int det = cl_keyLength & 0x80;
    if (!det) {
        cl_keyLength = cl_keyLength & 0x7f;
    } else {
        int cl_byteCount = cl_keyLength & 0x7f;
        if (cl_byteCount + cl_index > cl_dataLength) {
            //rsa length field longer than buffer
            return nil;
        }
        unsigned int cl_accessCount = 0;
        unsigned char *cl_printString = &cl_keyBytes[cl_index];
        
        cl_index += cl_byteCount;
        
        while (cl_byteCount) {
            cl_accessCount = (cl_accessCount << 8) + *cl_printString;
            cl_printString++;
            cl_byteCount--;
        }
        cl_keyLength = cl_accessCount;
    }
    
    // Now make a new NSData from this buffer
    return [keyData subdataWithRange:NSMakeRange(cl_index, cl_keyLength)];
}

// 私有方法, 获取RSA加密的SecKeyRef
+ (SecKeyRef)cl_addRSAKey:(NSString *)key
                   keyTag:(NSString *)keyTag
                  keyType:(CLRSAKeyType)keyType {
    
    BOOL cl_isPublicType = (keyType == CLRSAKeyTypePublic);
    
    NSRange cl_beginTitleRange = [key rangeOfString:@"-----BEGIN PUBLIC KEY-----"];
    NSRange cl_endTitleRange;
    
    if (cl_isPublicType) {
        cl_endTitleRange = [key rangeOfString:@"-----END PUBLIC KEY-----"];
    } else {
        cl_beginTitleRange = [key rangeOfString:@"-----BEGIN RSA PRIVATE KEY-----"];
        
        if(cl_beginTitleRange.length > 0){
            cl_endTitleRange   = [key rangeOfString:@"-----END RSA PRIVATE KEY-----"];
        } else {
            cl_beginTitleRange = [key rangeOfString:@"-----BEGIN PRIVATE KEY-----"];
            cl_endTitleRange   = [key rangeOfString:@"-----END PRIVATE KEY-----"];
        }
    }
    
    if(cl_beginTitleRange.location != NSNotFound &&
       cl_endTitleRange.location != NSNotFound) {
        NSUInteger cl_titleLocation = cl_beginTitleRange.location + cl_beginTitleRange.length;
        NSUInteger cl_titleLength   = cl_endTitleRange.location;
        
        key = [key substringWithRange:NSMakeRange(cl_titleLocation, cl_titleLength - cl_titleLocation)];
    }
    
    NSArray *cl_symbolArray = @[@"\r", @"\n", @"\t", @" "];
    
    for (NSString *cl_symbol in cl_symbolArray) {
        key = [key stringByReplacingOccurrencesOfString:cl_symbol
                                             withString:@""];
    }
    
    // This will be base64 encoded, decode it.
    NSData *cl_data = [self cl_transformDataWithBase64EncodedString:key];
    if (cl_isPublicType) {
        cl_data = [NSData cl_stripPublicKeyHeader:cl_data];
    } else {
        cl_data = [NSData cl_stripPrivateKeyHeader:cl_data];
    }
    
    if(!cl_data){
        return nil;
    }
    
    //a tag to read/write keychain storage
    NSString *cl_tag = keyTag;
    NSData *cl_dataTag = [NSData dataWithBytes:[cl_tag UTF8String]
                                        length:[cl_tag length]];
    
    // Delete any old lingering key with the same tag
    NSMutableDictionary *cl_keyDictionary = [[NSMutableDictionary alloc] init];
    [cl_keyDictionary setObject:(__bridge id)kSecClassKey
                         forKey:(__bridge id)kSecClass];
    [cl_keyDictionary setObject:(__bridge id)kSecAttrKeyTypeRSA
                         forKey:(__bridge id)kSecAttrKeyType];
    [cl_keyDictionary setObject:cl_dataTag
                         forKey:(__bridge id)kSecAttrApplicationTag];
    SecItemDelete((__bridge CFDictionaryRef)cl_keyDictionary);
    
    CFStringRef cl_stringerRef = cl_isPublicType ? kSecAttrKeyClassPublic : kSecAttrKeyClassPrivate;
    
    // Add persistent version of the key to system keychain
    [cl_keyDictionary setObject:cl_data
                         forKey:(__bridge id)kSecValueData];
    [cl_keyDictionary setObject:(__bridge id)cl_stringerRef
                         forKey:(__bridge id)kSecAttrKeyClass];
    [cl_keyDictionary setObject:@(YES)
                         forKey:(__bridge id)kSecReturnPersistentRef];
    
    CFTypeRef cl_persistKey = nil;
    OSStatus cl_status = SecItemAdd((__bridge CFDictionaryRef)cl_keyDictionary, &cl_persistKey);
    
    if (cl_persistKey != nil){
        CFRelease(cl_persistKey);
    }
    
    if ((cl_status != noErr) && (cl_status != errSecDuplicateItem)) {
        return nil;
    }
    
    [cl_keyDictionary removeObjectForKey:(__bridge id)kSecValueData];
    [cl_keyDictionary removeObjectForKey:(__bridge id)kSecReturnPersistentRef];
    [cl_keyDictionary setObject:@(YES)
                         forKey:(__bridge id)kSecReturnRef];
    [cl_keyDictionary setObject:(__bridge id)kSecAttrKeyTypeRSA
                         forKey:(__bridge id)kSecAttrKeyType];
    
    // Now fetch the SecKeyRef version of the key
    SecKeyRef cl_secKeyRef = nil;
    cl_status = SecItemCopyMatching((__bridge CFDictionaryRef)cl_keyDictionary,
                                    (CFTypeRef *)&cl_secKeyRef);
    if(cl_status != noErr) {
        return nil;
    }
    return cl_secKeyRef;
}

+ (NSData *)cl_decryptData:(NSData *)data
                 secKeyRef:(SecKeyRef)secKeyRef {
    
    const uint8_t *srcbuf = (const uint8_t *)[data bytes];
    size_t srclen = (size_t)data.length;
    
    size_t block_size = SecKeyGetBlockSize(secKeyRef) * sizeof(uint8_t);
    UInt8 *outbuf = malloc(block_size);
    size_t src_block_size = block_size;
    
    NSMutableData *cl_mutableData = [[NSMutableData alloc] init];
    
    for(int idx = 0; idx < srclen; idx += src_block_size){
        
        size_t data_len = srclen - idx;
        if(data_len > src_block_size){
            data_len = src_block_size;
        }
        
        size_t outlen = block_size;
        OSStatus status = noErr;
        status = SecKeyDecrypt(secKeyRef,
                               kSecPaddingNone,
                               srcbuf + idx,
                               data_len,
                               outbuf,
                               &outlen);
        if (status != 0) {
            NSLog(@"SecKeyEncrypt fail. Error Code: %d", status);
            cl_mutableData = nil;
            break;
        } else {
            //the actual decrypted data is in the middle, locate it!
            int idxFirstZero = -1;
            int idxNextZero = (int)outlen;
            
            for ( int i = 0; i < outlen; i++ ) {
                if ( outbuf[i] == 0 ) {
                    if ( idxFirstZero < 0 ) {
                        idxFirstZero = i;
                    } else {
                        idxNextZero = i;
                        break;
                    }
                }
            }
            
            [cl_mutableData appendBytes:&outbuf[idxFirstZero + 1]
                                 length:idxNextZero-idxFirstZero - 1];
        }
    }
    
    free(outbuf);
    CFRelease(secKeyRef);
    return cl_mutableData;
}
// ******* RSA Private Method End ******* //

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
