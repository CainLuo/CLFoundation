//
//  NSData+CLData.m
//  CLFoundation
//
//  Created by Mac on 2018/1/23.
//  Copyright © 2018年 Cain. All rights reserved.
//

#import "NSData+CLData.h"

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

@end
