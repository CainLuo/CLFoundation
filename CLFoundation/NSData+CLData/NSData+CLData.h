//
//  NSData+CLData.h
//  CLFoundation
//
//  Created by Mac on 2018/1/23.
//  Copyright © 2018年 Cain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSData (CLData)

/**
 将指定的图片转成NSData, 可输入指定压缩比例

 @param image UIImage
 @param compressionQuality 压缩比例
 @return NSData
 */
+ (NSData *)cl_compressOriginalImage:(UIImage *)image
                  compressionQuality:(CGFloat)compressionQuality;

@end
