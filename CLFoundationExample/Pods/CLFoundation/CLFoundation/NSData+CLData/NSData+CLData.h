//
//  NSData+CLData.h
//  CLFoundation
//
//  Created by Mac on 2018/1/23.
//  Copyright © 2018年 Cain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CLEncodedType) {
    
    CLEncodedType64 = 64,
    CLEncodedType76 = 76
};

@interface NSData (CLData)

/**
 将指定的图片转成NSData, 可输入指定压缩比例

 @param image UIImage
 @param compressionQuality 压缩比例
 @return NSData
 */
+ (NSData *)cl_compressOriginalImage:(UIImage *)image
                  compressionQuality:(CGFloat)compressionQuality;

/**
 将制定的APNs NSData转成NSString

 @param data NSData
 @return NSString
 */
+ (NSString *)cl_replacingAPNsTokenWithData:(NSData *)data;

#pragma mark - Base 64加密/解密
/**
 将Base 64的字符串转成NSData

 @param string NSString
 @return NSData
 */
+ (NSData *)cl_transformDataWithBase64EncodedString:(NSString *)string;

/**
 将指定的NSData转成64或76的字符串

 @param data NSData
 @param wrapWidth CLEncodedType
 @return NSString
 */
+ (NSString *)cl_transformBase64EncodedStringWithData:(NSData *)data
                                            wrapWidth:(CLEncodedType)wrapWidth;

#pragma mark - AES加密/解密
/**
 利用AES加密NSData

 @param key NSString
 @param encryptData NSData
 @return NSData
 */
- (NSData *)cl_encryptedDataWithAESKey:(NSString *)key
                           encryptData:(NSData *)encryptData;

/**
 利用AES解密NSData

 @param key NSString
 @param decryptData NSData
 @return NSData
 */
- (NSData *)cl_decryptedDataWithAESKey:(NSString *)key
                           decryptData:(NSData *)decryptData;

#pragma mark - 3DES加密/解密
/**
 利用3DES加密NSData
 
 @param key NSString
 @param encryptData NSData
 @return NSData
 */
- (NSData *)cl_encryptedDataWith3DESKey:(NSString *)key
                            encryptData:(NSData *)encryptData;

/**
 利用3DES解密NSData
 
 @param key NSString
 @param decryptData NSData
 @return NSData
 */
- (NSData *)cl_decryptedDataWith3DEKey:(NSString *)key
                           decryptData:(NSData *)decryptData;

#pragma mark - MD加密
/**
 获取MD2加密后的NSString
 
 @return NSString
 */
- (NSString *)cl_encryptredMD2String;

/**
 获取MD2加密后的NSData
 
 @return NSData
 */
- (NSData *)cl_encryptredMD2Data;

/**
 获取MD4加密后的NSString
 
 @return NSString
 */
- (NSString *)cl_encryptredMD4String;

/**
 获取MD4加密后的NSData
 
 @return NSData
 */
- (NSData *)cl_encryptredMD4Data;

/**
 获取MD5加密后的NSString
 
 @return NSString
 */
- (NSString *)cl_encryptredMD5String;

/**
 使用指定Key去哈希加密MD5
 
 @param key NSString
 @return NSString
 */
- (NSString *)cl_hmacEncryptredMD5StringWithKey:(NSString *)key;

/**
 获取MD5加密后的NSData

 @return NSData
 */
- (NSData *)cl_encryptredMD5Data;

/**
 获取使用指定Key HASH MD5加密后的NSData
 
 @param key NSData
 @return NSData
 */
- (NSData *)cl_hmacEncryptredMD5DataWithKey:(NSData *)key;

#pragma mark - SHA加密
/**
 获取SHA1加密后的NSString
 
 @return NSString
 */
- (NSString *)cl_encryptredSHA1String;

/**
 获取使用指定Key HASH SHA1加密后的NSString
 
 @param key NSString
 @return NSString
 */
- (NSString *)cl_hmacEncryptredSHA1StringWithKey:(NSString *)key;

/**
 获取SHA1加密后的NSData
 
 @return NSData
 */
- (NSData *)cl_encryptredSHA1Data;

/**
 获取使用指定Key HASH SHA1加密后的NSData
 
 @param key NSData
 @return NSData
 */
- (NSData *)cl_hmacEncryptredSHA1DataWithKey:(NSData *)key;

/**
 获取SHA224加密后的NSString
 
 @return NSString
 */
- (NSString *)cl_encryptredSHA224String;

/**
 获取使用指定Key HASH SHA224加密后的NSString
 
 @param key NSString
 @return NSString
 */
- (NSString *)cl_hmacEncryptredSHA224StringWithKey:(NSString *)key;

/**
 获取SHA224加密后的NSData
 
 @return NSData
 */
- (NSData *)cl_encryptredSHA224Data;

/**
 获取使用指定Key HASH SHA224加密后的NSData
 
 @param key NSData
 @return NSData
 */
- (NSData *)cl_hmacEncryptredSHA224DataWithKey:(NSData *)key;

/**
 获取SHA256加密后的NSString
 
 @return NSString
 */
- (NSString *)cl_encryptredSHA256String;

/**
 获取使用指定Key HASH SHA256加密后的NSString
 
 @param key NSString
 @return NSString
 */
- (NSString *)cl_hmacEncryptredSHA256StringWithKey:(NSString *)key;

/**
 获取SHA256加密后的NSData
 
 @return NSData
 */
- (NSData *)cl_encryptredSHA256Data;

/**
 获取使用指定Key HASH SHA256加密后的NSData
 
 @param key NSData
 @return NSData
 */
- (NSData *)cl_hmacEncryptredSHA256DataWithKey:(NSData *)key;

/**
 获取SHA384加密后的NSString
 
 @return NSString
 */
- (NSString *)cl_encryptredSHA384String;

/**
 获取使用指定Key HASH SHA384加密后的NSString
 
 @param key NSString
 @return NSString
 */
- (NSString *)cl_hmacEncryptredSHA384StringWithKey:(NSString *)key;

/**
 获取SHA384加密后的NSData
 
 @return NSData
 */
- (NSData *)cl_encryptredSHA384Data;

/**
 获取使用指定Key HASH SHA384加密后的NSData
 
 @param key NSData
 @return NSData
 */
- (NSData *)cl_hmacEncryptredSHA384DataWithKey:(NSData *)key;

/**
 获取SHA512加密后的NSString
 
 @return NSString
 */
- (NSString *)cl_encryptredSHA512String;

/**
 获取使用指定Key HASH SHA512加密后的NSString
 
 @param key NSString
 @return NSString
 */
- (NSString *)cl_hmacEncryptredSHA512StringWithKey:(NSString *)key;

/**
 获取SHA512加密后的NSData
 
 @return NSData
 */
- (NSData *)cl_encryptredSHA512Data;

/**
 获取使用指定Key HASH SHA512加密后的NSData

 @param key NSData
 @return NSData
 */
- (NSData *)cl_hmacEncryptredSHA512DataWithKey:(NSData *)key;

/**
 解析JSON数据

 @return id
 */
- (id)cl_dataJSONValueDecoded;

/**
 获取指定NSBundle获取NSData

 @param name NSString
 @return NSData
 */
+ (NSData *)cl_getDataWithBundleNamed:(NSString *)name;

@end
