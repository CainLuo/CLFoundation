//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIImage+CLImage.m
//
//  Created by Cain on 2017/3/27.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "UIImage+CLImage.h"
#import "UIScreen+CLScreen.h"

#import <ImageIO/ImageIO.h>
#import <Accelerate/Accelerate.h>
#import <AVFoundation/AVFoundation.h>

@implementation UIImage (CLImage)

#pragma mark - 生成指定颜色图片
+ (void)cl_asyncGetImageWithColor:(UIColor *)color
                       completion:(CLImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        CGRect cl_rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
        
        UIGraphicsBeginImageContext(cl_rect.size);
        
        CGContextRef cl_context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(cl_context, color.CGColor);
        
        CGContextFillRect(cl_context, cl_rect);
        
        UIImage *cl_image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        NSData *cl_imageData = UIImageJPEGRepresentation(cl_image, 1.0f);
        
        cl_image = [UIImage imageWithData:cl_imageData];

        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion != nil) {
                
                completion(cl_image);
            }
        });
    });
}

+ (void)cl_asyncGetImageWithColor:(UIColor *)color
                             rect:(CGRect)rect
                       completion:(CLImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                
        UIGraphicsBeginImageContext(rect.size);
        
        CGContextRef cl_context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(cl_context, color.CGColor);
        
        CGContextFillRect(cl_context, rect);
        
        UIImage *cl_image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        NSData *cl_imageData = UIImageJPEGRepresentation(cl_image, 1.0f);
        
        cl_image = [UIImage imageWithData:cl_imageData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion) {
                
                completion(cl_image);
            }
        });
    });
}

+ (void)cl_asyncGetImageWithColor:(UIColor *)color
                           radius:(CGFloat)radius
                       completion:(CLImage)completion {
    
    CGRect cl_imageSize = CGRectMake(0, 0, radius * 2, radius * 2);
    
    [self cl_asyncGetImageWithColor:color
                               rect:cl_imageSize
                             radius:radius
                         completion:completion];
}

+ (void)cl_asyncGetImageWithColor:(UIColor *)color
                             rect:(CGRect)rect
                           radius:(CGFloat)radius
                       completion:(CLImage)completion {
    
    [self cl_asyncGetImageWithColor:color
                               rect:rect
                         completion:^(UIImage *image) {
                             
                             [self cl_asyncCornerImageWithRadius:radius
                                                           image:image
                                                      completion:completion];
                         }];
}

#pragma mark - 截取指定视图大小的截图
+ (UIImage *)cl_getImageForView:(UIView *)view {
    
    UIImage *__block cl_image = nil;
    
    dispatch_async(dispatch_get_main_queue(), ^{

        UIGraphicsBeginImageContextWithOptions(view.frame.size, false, 0.0);
        
        [view.layer renderInContext:UIGraphicsGetCurrentContext()];
        
        cl_image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
    });
    

    return cl_image;
}

#pragma mark - 缩放指定比例的图片
+ (void)cl_asyncDrawImageToSize:(CGSize)size
                          image:(UIImage *)image
                     completion:(CLImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
        UIGraphicsBeginImageContext(size);
        
        [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
        
        UIImage *cl_drawImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion) {
                
                completion(cl_drawImage);
            }
        });
    });
}

#pragma mark - 加载GIF图片
+ (void)cl_asyncLoadGIFImageForName:(NSString *)name
                         completion:(CLImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        CGFloat cl_scale = [UIScreen mainScreen].scale;
        
        if (cl_scale > 1.0f) {
            
            NSString *cl_retinaPath = [[NSBundle mainBundle] pathForResource:[name stringByAppendingString:@"@2x"]
                                                                      ofType:@"gif"];
            
            NSData *cl_data = [NSData dataWithContentsOfFile:cl_retinaPath];

            if (completion) {

                if (cl_data) {
                    
                    [UIImage cl_asyncLoadGIFImageWithData:cl_data
                                               completion:^(UIImage *image) {
                                                   
                                                   completion(image);
                                               }];
                }
            }
            
            NSString *cl_path = [[NSBundle mainBundle] pathForResource:name
                                                             ofType:@"gif"];
            
            cl_data = [NSData dataWithContentsOfFile:cl_path];
            
            dispatch_async(dispatch_get_main_queue(), ^{

                if (completion) {

                    if (cl_data) {
                        
                        [UIImage cl_asyncLoadGIFImageWithData:cl_data
                                                   completion:^(UIImage *image) {
                                                       
                                                       completion(image);
                                                   }];
                        
                        return;
                    }
                    
                    completion([UIImage imageNamed:name]);
                }
            });
            
        } else {
            
            NSString *cl_path = [[NSBundle mainBundle] pathForResource:name
                                                                ofType:@"gif"];
            
            NSData *cl_data = [NSData dataWithContentsOfFile:cl_path];
            
            dispatch_async(dispatch_get_main_queue(), ^{

                if (completion) {
                    
                    if (cl_data) {
                        
                        [UIImage cl_asyncLoadGIFImageWithData:cl_data
                                                   completion:^(UIImage *image) {
                            
                                                       completion(image);
                                                   }];
                    }
                    
                    completion([UIImage imageNamed:name]);
                }
            });
        }
    });
}

+ (void)cl_asyncLoadGIFImageWithData:(NSData *)data
                          completion:(CLImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        if (!data) {
            return;
        }
        
        //获取数据源
        CGImageSourceRef cl_source = CGImageSourceCreateWithData((__bridge CFDataRef)data,
                                                                 NULL);
        
        // 获取图片数量(如果传入的是gif图的二进制，那么获取的是图片帧数)
        size_t cl_count = CGImageSourceGetCount(cl_source);
        
        UIImage *cl_animatedImage;
        
        if (cl_count <= 1) {
            cl_animatedImage = [[UIImage alloc] initWithData:data];
            
        } else {
            
            NSMutableArray *cl_images = [NSMutableArray array];
            
            NSTimeInterval cl_duration = 0.0f;
            
            for (size_t i = 0; i < cl_count; i++) {
                
                CGImageRef cl_image = CGImageSourceCreateImageAtIndex(cl_source,
                                                                      i,
                                                                      NULL);
                
                cl_duration += [self cl_frameDurationAtIndex:i
                                                      source:cl_source];
                
                [cl_images addObject:[UIImage imageWithCGImage:cl_image
                                                         scale:[UIScreen mainScreen].scale
                                                   orientation:UIImageOrientationUp]];
                
                CGImageRelease(cl_image);
            }
            
            // 如果上面的计算播放时间方法没有成功，就按照下面方法计算
            // 计算一次播放的总时间：每张图播放1/10秒 * 图片总数
            if (!cl_duration) {
                cl_duration = (1.0f / 10.0f) * cl_count;
            }
            
            cl_animatedImage = [UIImage animatedImageWithImages:cl_images
                                                       duration:cl_duration];
        }
        
        CFRelease(cl_source);

        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion) {
                
                completion(cl_animatedImage);
            }
        });
    });
}

/**
 计算GIF图片播放的时间

 @param index 索引
 @param source 图片内容
 @return 计算时间
 */
+ (CGFloat)cl_frameDurationAtIndex:(NSUInteger)index
                            source:(CGImageSourceRef)source {
    
    CGFloat cl_frameDuration = 0.1f;
    
    // 获取这一帧的属性字典
    CFDictionaryRef cl_cfFrameProperties = CGImageSourceCopyPropertiesAtIndex(source,
                                                                              index,
                                                                              nil);
    
    NSDictionary *cl_frameProperties = (__bridge NSDictionary *)cl_cfFrameProperties;
    NSDictionary *cl_gifProperties = cl_frameProperties[(NSString *)kCGImagePropertyGIFDictionary];
    
    // 从字典中获取这一帧持续的时间
    NSNumber *cl_delayTimeUnclampedProp = cl_gifProperties[(NSString *)kCGImagePropertyGIFUnclampedDelayTime];
    
    if (cl_delayTimeUnclampedProp) {
        
        cl_frameDuration = [cl_delayTimeUnclampedProp floatValue];
        
    } else {
        
        NSNumber *cl_delayTimeProp = cl_gifProperties[(NSString *)kCGImagePropertyGIFDelayTime];
        
        if (cl_delayTimeProp) {
            
            cl_frameDuration = [cl_delayTimeProp floatValue];
        }
    }
    
    // Many annoying ads specify a 0 duration to make an image flash as quickly as possible.
    // We follow Firefox's behavior and use a duration of 100 ms for any frames that specify
    // a duration of <= 10 ms. See <rdar://problem/7689300> and <http://webkit.org/b/36082>
    // for more information.
    
    if (cl_frameDuration < 0.011f) {
        
        cl_frameDuration = 0.100f;
    }
    
    CFRelease(cl_cfFrameProperties);
    
    return cl_frameDuration;
}

#pragma mark - 异步生成一个二维码
+ (void)cl_asyncCreateQRCodeImageWithString:(NSString *)string
                                 completion:(CLImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        CIFilter *cl_QRCodeImageFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
        
        [cl_QRCodeImageFilter setDefaults];
        
        NSData *QRCodeImageData = [string dataUsingEncoding:NSUTF8StringEncoding];
        
        [cl_QRCodeImageFilter setValue:QRCodeImageData
                                forKey:@"inputMessage"];
        [cl_QRCodeImageFilter setValue:@"H"
                                forKey:@"inputCorrectionLevel"];
        
        CIImage *cl_QRCodeCIImage = [cl_QRCodeImageFilter outputImage];
        
        cl_QRCodeCIImage = [cl_QRCodeCIImage imageByApplyingTransform:CGAffineTransformMakeScale(20, 20)];
        
        UIImage *cl_QRCodeUIImage = [UIImage imageWithCIImage:cl_QRCodeCIImage];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion != nil) {
                
                completion(cl_QRCodeUIImage);
            }
        });
    });
}

+ (void)cl_asyncCreateQRCodeImageWithString:(NSString *)string
                                  logoImage:(UIImage *)logoImage
                                 completion:(CLImage)completion {
        
    [self cl_asyncCreateQRCodeImageWithString:string
                                   completion:^(UIImage *image) {
                                       
                                       dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                                           
                                           UIGraphicsBeginImageContext(image.size);
                                           
                                           [image drawInRect:CGRectMake(0,
                                                                        0,
                                                                        image.size.width,
                                                                        image.size.height)];
                                           
                                           CGFloat cl_imageW = 150;
                                           CGFloat cl_imageH = cl_imageW;
                                           CGFloat cl_imageX = (image.size.width - cl_imageW) * 0.5;
                                           CGFloat cl_imgaeY = (image.size.height - cl_imageH) * 0.5;
                                           
                                           [logoImage drawInRect:CGRectMake(cl_imageX, cl_imgaeY, cl_imageW, cl_imageH)];
                                           
                                           UIImage *cl_finalyImage = UIGraphicsGetImageFromCurrentImageContext();
                                           
                                           UIGraphicsEndImageContext();
                                           
                                           dispatch_async(dispatch_get_main_queue(), ^{
                                               
                                               if (completion) {
                                                   
                                                   completion(cl_finalyImage);
                                               }
                                           });
                                       });
                                   }];
}

#pragma mark - 生成条形码
+ (void)cl_asyncCreate128BarcodeImageWithString:(NSString *)string
                                     completion:(CLImage)completion {
    
    [self cl_asyncCreate128BarcodeImageWithString:string
                                       imageSpace:[UIScreen cl_fitScreen:14]
                                       completion:completion];
}

+ (void)cl_asyncCreate128BarcodeImageWithString:(NSString *)string
                                     imageSpace:(CGFloat)imageSpace
                                     completion:(CLImage)completion {

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        CIFilter *cl_code128Filter = [CIFilter filterWithName:@"CICode128BarcodeGenerator"];
        
        NSData *cl_contentData = [string dataUsingEncoding:NSUTF8StringEncoding];
        
        [cl_code128Filter setValue:cl_contentData
                            forKey:@"inputMessage"];
        [cl_code128Filter setValue:@(imageSpace)
                            forKey:@"inputQuietSpace"];
        
        CIImage *cl_code128Image = cl_code128Filter.outputImage;
        
        cl_code128Image = [cl_code128Image imageByApplyingTransform:CGAffineTransformMakeScale(20, 20)];
        
        UIImage *cl_code128UIImage = [UIImage imageWithCIImage:cl_code128Image];

        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion) {
                
                completion(cl_code128UIImage);
            }
        });
    });
}

#pragma mark - 获取指定Bundle文件里的图片
+ (UIImage *)cl_getImageWithBundleName:(NSString *)bundle
                             imageName:(NSString *)imageName {
    
    NSBundle *cl_mainBundle = [NSBundle bundleForClass:NSClassFromString(bundle)];
    
    NSString *cl_pathString = [cl_mainBundle pathForResource:bundle
                                                      ofType:@"bundle"];
    
    NSBundle *cl_resourcesBundle = [NSBundle bundleWithPath:cl_pathString];
    
    if (!cl_resourcesBundle) {
        
        cl_resourcesBundle = cl_mainBundle;
    }
    
    UIImage *cl_image = [UIImage imageNamed:imageName
                                   inBundle:cl_resourcesBundle
              compatibleWithTraitCollection:nil];
    
    return cl_image;
}

+ (void)cl_asyncGetVideoPreViewImageWithVideoURL:(NSURL *)videoURL
                                      completion:(CLImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        AVURLAsset *cl_avURLAsset = [[AVURLAsset alloc] initWithURL:videoURL
                                                            options:nil];
        
        AVAssetImageGenerator *cl_avAssetImageGenerator = [[AVAssetImageGenerator alloc] initWithAsset:cl_avURLAsset];
        
        cl_avAssetImageGenerator.appliesPreferredTrackTransform = YES;
        
        CMTime cl_time    = CMTimeMakeWithSeconds(0.0, 600);
        NSError *cl_error = nil;
        
        CMTime cl_actualTime;
        CGImageRef cl_videoImageRef = [cl_avAssetImageGenerator copyCGImageAtTime:cl_time
                                                                       actualTime:&cl_actualTime
                                                                            error:&cl_error];
        
        UIImage *cl_image = [[UIImage alloc] initWithCGImage:cl_videoImageRef];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion) {
                
                completion(cl_image);
            }
        });
    });
}

#pragma mark - 图片高斯模糊处理
+ (void)cl_asyncBlurImageWithBlur:(CGFloat)blur
                            image:(UIImage *)image
                       completion:(CLImage)completion {
    
    __block CGFloat cl_blurValue = blur;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSData *cl_imageData  = UIImageJPEGRepresentation(image, 1); // convert to jpeg
        UIImage *cl_destImage = [UIImage imageWithData:cl_imageData];
        
        if (cl_blurValue < 0.f || cl_blurValue > 1.f) {
            cl_blurValue = 0.5f;
        }
        
        int cl_boxSize = (int)(blur * 40);
        
        cl_boxSize = cl_boxSize - (cl_boxSize % 2) + 1;
        
        CGImageRef cl_imageRef = cl_destImage.CGImage;
        
        vImage_Buffer cl_inBuffer, cl_outBuffer;
        
        vImage_Error cl_error;
        
        void *cl_pixelBuffer;
        
        //create vImage_Buffer with data from CGImageRef
        
        CGDataProviderRef cl_inProvider = CGImageGetDataProvider(cl_imageRef);
        CFDataRef cl_inBitmapData = CGDataProviderCopyData(cl_inProvider);
        
        cl_inBuffer.width    = CGImageGetWidth(cl_imageRef);
        cl_inBuffer.height   = CGImageGetHeight(cl_imageRef);
        cl_inBuffer.rowBytes = CGImageGetBytesPerRow(cl_imageRef);
        cl_inBuffer.data     = (void *)CFDataGetBytePtr(cl_inBitmapData);
        
        //create vImage_Buffer for output
        
        cl_pixelBuffer = malloc(CGImageGetBytesPerRow(cl_imageRef) * CGImageGetHeight(cl_imageRef));
        
        if(cl_pixelBuffer == NULL) {
            
            NSLog(@"No pixelbuffer");
        }
        
        cl_outBuffer.data     = cl_pixelBuffer;
        cl_outBuffer.width    = CGImageGetWidth(cl_imageRef);
        cl_outBuffer.height   = CGImageGetHeight(cl_imageRef);
        cl_outBuffer.rowBytes = CGImageGetBytesPerRow(cl_imageRef);
        
        // Create a third buffer for intermediate processing
        void *cl_pixelBuffer2 = malloc(CGImageGetBytesPerRow(cl_imageRef) * CGImageGetHeight(cl_imageRef));
        
        vImage_Buffer cl_outBuffer2;
        
        cl_outBuffer2.data     = cl_pixelBuffer2;
        cl_outBuffer2.width    = CGImageGetWidth(cl_imageRef);
        cl_outBuffer2.height   = CGImageGetHeight(cl_imageRef);
        cl_outBuffer2.rowBytes = CGImageGetBytesPerRow(cl_imageRef);
        
        //perform convolution
        cl_error = vImageBoxConvolve_ARGB8888(&cl_inBuffer,
                                              &cl_outBuffer2,
                                              NULL,
                                              0,
                                              0,
                                              cl_boxSize,
                                              cl_boxSize,
                                              NULL,
                                              kvImageEdgeExtend);
        
        if (cl_error) {
            NSLog(@"error from convolution %ld", cl_error);
        }
        
        cl_error = vImageBoxConvolve_ARGB8888(&cl_outBuffer2,
                                              &cl_inBuffer,
                                              NULL,
                                              0,
                                              0,
                                              cl_boxSize,
                                              cl_boxSize,
                                              NULL,
                                              kvImageEdgeExtend);
        
        if (cl_error) {
            NSLog(@"error from convolution %ld", cl_error);
        }
        
        cl_error = vImageBoxConvolve_ARGB8888(&cl_inBuffer,
                                              &cl_outBuffer,
                                              NULL,
                                              0,
                                              0,
                                              cl_boxSize,
                                              cl_boxSize,
                                              NULL,
                                              kvImageEdgeExtend);
        
        if (cl_error) {
            NSLog(@"error from convolution %ld", cl_error);
        }
        
        CGColorSpaceRef cl_colorSpaceRef = CGColorSpaceCreateDeviceRGB();
        
        CGContextRef cl_ontextRef = CGBitmapContextCreate(cl_outBuffer.data,
                                                          cl_outBuffer.width,
                                                          cl_outBuffer.height,
                                                          8,
                                                          cl_outBuffer.rowBytes,
                                                          cl_colorSpaceRef,
                                                          (CGBitmapInfo)kCGImageAlphaNoneSkipLast);
        
        CGImageRef cl_imageRef2 = CGBitmapContextCreateImage(cl_ontextRef);
        UIImage *cl_image = [UIImage imageWithCGImage:cl_imageRef2];
        
        //clean up
        CGContextRelease(cl_ontextRef);
        CGColorSpaceRelease(cl_colorSpaceRef);
        
        free(cl_pixelBuffer);
        free(cl_pixelBuffer2);
        CFRelease(cl_inBitmapData);
        
        CGImageRelease(cl_imageRef2);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion) {
                
                completion(cl_image);
            }
        });
    });
}

#pragma mark - 图片圆角处理
+ (void)cl_asyncCornerImageWithRadius:(CGFloat)radius
                                image:(UIImage *)image
                           completion:(CLImage)completion {
    
    [UIImage cl_asyncCornerImageWithRadius:radius
                                     image:image
                               borderWidth:0
                               borderColor:nil
                                completion:completion];
}

+ (void)cl_asyncCornerImageWithRadius:(CGFloat)radius
                                image:(UIImage *)image
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor
                           completion:(CLImage)completion {
    
    [UIImage cl_asyncCornerImageWithRadius:radius
                                     image:image
                                   corners:UIRectCornerAllCorners
                               borderWidth:borderWidth
                               borderColor:borderColor
                            borderLineJoin:kCGLineJoinMiter
                                completion:completion];
}

+ (void)cl_asyncCornerImageWithRadius:(CGFloat)radius
                                image:(UIImage *)image
                              corners:(UIRectCorner)corners
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor
                       borderLineJoin:(CGLineJoin)borderLineJoin
                           completion:(CLImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
        
        CGContextScaleCTM(context, 1, -1);
        
        CGContextTranslateCTM(context, 0, -rect.size.height);
        
        CGFloat minSize = MIN(image.size.width, image.size.height);
        
        if (borderWidth < minSize / 2) {
            
            UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(rect, borderWidth, borderWidth)
                                                       byRoundingCorners:corners
                                                             cornerRadii:CGSizeMake(radius, borderWidth)];
            [path closePath];
            
            CGContextSaveGState(context);
            
            [path addClip];
            
            CGContextDrawImage(context, rect, image.CGImage);
            CGContextRestoreGState(context);
        }
        
        if (borderColor && borderWidth < minSize / 2 && borderWidth > 0) {
            
            CGFloat strokeInset = (floor(borderWidth * image.scale) + 0.5) / image.scale;
            
            CGRect strokeRect = CGRectInset(rect, strokeInset, strokeInset);
            
            CGFloat strokeRadius = radius > image.scale / 2 ? radius - image.scale / 2 : 0;
            
            UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:strokeRect
                                                       byRoundingCorners:corners
                                                             cornerRadii:CGSizeMake(strokeRadius, borderWidth)];
            [path closePath];
            
            path.lineWidth = borderWidth;
            path.lineJoinStyle = borderLineJoin;
            
            [borderColor setStroke];
            
            [path stroke];
        }
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion) {
                
                completion(image);
            }
        });
    });
}

#pragma mark - 图片处理
+ (void)cl_resetSizeWithImage:(UIImage *)image
                         size:(CGSize)size
                   completion:(CLImage)completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        UIGraphicsBeginImageContext(size);
        
        [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
        
        UIImage *cl_resetSizeImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion) {
                
                completion(cl_resetSizeImage);
            }
        });
    });
}

+ (CGSize)cl_getScaleImageWithImage:(UIImage *)image
                             length:(CGFloat)length {
    
    CGFloat cl_resetW = 0.0f;
    CGFloat cl_resetH = 0.0f;
    
    CGFloat cl_imageW = image.size.width;
    CGFloat cl_imageH = image.size.height;
    
    if (cl_imageW > length || cl_imageH > length) {
        
        if (cl_imageW > cl_imageH) {
            
            cl_resetW = length;
            cl_resetH = cl_resetW * cl_imageH / cl_imageW;
            
        } else if (cl_imageH > cl_imageW) {
            
            cl_resetH = length;
            cl_resetW = cl_resetH * cl_imageW / cl_imageH;
        } else {
            
            cl_resetW = length;
            cl_resetH = length;
        }
    } else {
        
        return CGSizeMake(cl_imageW, cl_imageH);
    }
    
    return CGSizeMake(cl_resetW, cl_resetH);
}

@end
