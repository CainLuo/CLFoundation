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

+ (NSData *)cl_compressOriginalImage:(UIImage *)image
                  compressionQuality:(CGFloat)compressionQuality;

@end
