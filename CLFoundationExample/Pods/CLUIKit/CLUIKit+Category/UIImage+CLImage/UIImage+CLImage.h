//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIImage+CLImage.h
//
//  Created by Cain on 2017/3/27.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CLImage)(UIImage *image);
typedef void(^CLSaveImage)(NSError *error);

@interface UIImage (CLImage)

#pragma mark - 生成指定颜色图片
/**
 根据给定的颜色异步生成一张图
 
 @param color UIColor
 @param completion 回调
 */
+ (void)cl_asyncGetImageWithColor:(UIColor *)color
                       completion:(CLImage)completion;

/**
 根据给定的颜色异步生成一张图

 @param color UIColor
 @param rect 指定大小
 @param completion 回调
 */
+ (void)cl_asyncGetImageWithColor:(UIColor *)color
                             rect:(CGRect)rect
                       completion:(CLImage)completion;

/**
 根据给定的颜色异步生成一张图, 并设置圆角
 
 @param color UIColor
 @param radius 弧度
 @param completion 回调
 */
+ (void)cl_asyncGetImageWithColor:(UIColor *)color
                           radius:(CGFloat)radius
                       completion:(CLImage)completion;

/**
 根据给定的颜色异步生成一张图, 并设置大小和圆角

 @param color UIColor
 @param rect 指定大小
 @param radius 弧度
 @param completion 回调
 */
+ (void)cl_asyncGetImageWithColor:(UIColor *)color
                             rect:(CGRect)rect
                           radius:(CGFloat)radius
                       completion:(CLImage)completion;

#pragma mark - 截取指定视图大小的截图
/**
 截取指定视图大小的截图

 @param view 指定视图
 */
+ (UIImage *)cl_getImageForView:(UIView *)view;

#pragma mark - 缩放指定比例的图片
/**
 给指定UIImage绘制指定大小

 @param size Size
 @param image 图片
 @param completion 回调
 */
+ (void)cl_asyncDrawImageToSize:(CGSize)size
                          image:(UIImage *)image
                     completion:(CLImage)completion;

#pragma mark - 加载GIF图片
/**
 加载指定名称的GIF UIImage
 
 @param name 图片名
 @param completion 回调
 */
+ (void)cl_asyncLoadGIFImageForName:(NSString *)name
                         completion:(CLImage)completion;

/**
 从NSData里加载GIF图片
 
 @param data 图片数据
 @param completion 回调
 */
+ (void)cl_asyncLoadGIFImageWithData:(NSData *)data
                          completion:(CLImage)completion;

/**
 判断NSData对象是否是GIF图片

 @param data NSData
 @return BOOL
 */
+ (BOOL)cl_isAnimatedGIFWithData:(NSData *)data;

/**
 判断文件路径是否是GIF图片

 @param filePath NSString
 @return BOOL
 */
+ (BOOL)cl_isAnimatedGIFWithFilePath:(NSString *)filePath;

#pragma mark - 生成二维码
/**
 异步创建一个二维码
 
 @param string 二维码的内容
 @param completion 回调
 */
+ (void)cl_asyncCreateQRCodeImageWithString:(NSString *)string
                                 completion:(CLImage)completion;

/**
 创建一个二维码, 且可以添加中间的Logo图
 
 @param string 二维码内容
 @param logoImage logo图 default size is 150 * 150
 @param completion 回调
 */
+ (void)cl_asyncCreateQRCodeImageWithString:(NSString *)string
                                  logoImage:(UIImage *)logoImage
                                 completion:(CLImage)completion;

#pragma mark - 生成条形码
/**
 创建一个条形码
 
 @param string 条形码内容, 只能输入ASCII字符
 @param completion 回调
 */
+ (void)cl_asyncCreate128BarcodeImageWithString:(NSString *)string
                                     completion:(CLImage)completion;

/**
 创建一个条形码, 并且可以设置条形码与UIImageView两边的间距

 @param string 条形码内容, 只能输入ASCII字符
 @param imageSpace 与UIImageView两边的距离
 @param completion 回调
 */
+ (void)cl_asyncCreate128BarcodeImageWithString:(NSString *)string
                                     imageSpace:(CGFloat)imageSpace
                                     completion:(CLImage)completion;

#pragma mark - 获取指定Bundle文件里的图片
/**
 从指定的Bundle包里获取对应的UIImage

 @param bundle 资源包
 @param imageName 图片名
 @return UIImage
 */
+ (UIImage *)cl_getImageWithBundleName:(NSString *)bundle
                             imageName:(NSString *)imageName;

/**
 获取本地视频的预览图

 @param videoURL NSURL
 @param completion 回调
 */
+ (void)cl_asyncGetVideoPreViewImageWithVideoURL:(NSURL *)videoURL
                                      completion:(CLImage)completion;

#pragma mark - 图片高斯模糊处理
/**
 输入一张UIImage, 返回一张带高斯模糊的UIImage

 @param blur 模糊值
 @param image 指定的图片
 @param completion 回调
 */
+ (void)cl_asyncBlurImageWithBlur:(CGFloat)blur
                            image:(UIImage *)image
                       completion:(CLImage)completion;

#pragma mark - 图片圆角处理
/**
 给指定的UIImage添加圆角效果

 @param radius 弧度
 @param image 指定的图片
 @param completion 回调
 */
+ (void)cl_asyncCornerImageWithRadius:(CGFloat)radius
                                image:(UIImage *)image
                           completion:(CLImage)completion;

/**
 给指定的UIImage增加圆角,边框, 边框的颜色.

 @param radius 弧度
 @param image 指定的图片
 @param borderWidth 边框的宽度
 @param borderColor 边框的颜色
 @param completion 回调
 */
+ (void)cl_asyncCornerImageWithRadius:(CGFloat)radius
                                image:(UIImage *)image
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor
                           completion:(CLImage)completion;

#pragma mark - 图片处理
/**
 重置UIImage的Size

 @param image UIImage
 @param size CGSize
 @param completion 回调
 */
+ (void)cl_resetSizeWithImage:(UIImage *)image
                         size:(CGSize)size
                   completion:(CLImage)completion;

/**
 通过图片的最长边获取同等比例的UIImage Size

 @param image UIImage
 @param length CGFloat
 @return CGSize
 */
+ (CGSize)cl_getScaleImageWithImage:(UIImage *)image
                             length:(CGFloat)length;

@end
