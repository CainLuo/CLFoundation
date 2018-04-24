//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIApplication+CLApplication.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/3/5.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CLPermissionBlock)(BOOL granted);

@interface UIApplication (CLApplication)

#pragma mark - 权限查询
/**
 获取UIApplication的定位是否授权

 @return BOOL
 */
+ (BOOL)cl_getApplicationLocationPermit;

/**
 获取UIApplication的通信录是否授权

 @return BOOL
 */
+ (BOOL)cl_getApplicationAddressBookPermit;

/**
 获取UIApplication的相机是否授权
 
 @return BOOL
 */
+ (BOOL)cl_getApplicationCameraPermit;

/**
 获取UIApplication的推送功能是否授权
 
 @return BOOL
 */
+ (BOOL)cl_getApplicationRemindersPermit;

/**
 获取UIApplication的相册是否授权

 @return BOOL
 */
+ (BOOL)cl_getApplicationPhotosLibraryPermit;

/**
 获取UIApplication的麦克风是否开启

 @param block CLPermissionBlock
 */
+ (void)cl_getApplicationMicrophonePermitWithBlock:(CLPermissionBlock)block;

#pragma mark - Open URL
/**
 给指定的手机号码拨打电话

 @param phoneNumber NSString
 */
+ (void)cl_callPhoneWithPhoneNumber:(NSString *)phoneNumber;

/**
 给指定的邮箱地址发邮件

 @param emailAddress NSString
 */
+ (void)cl_sendEmailWithEmailAddress:(NSString *)emailAddress;

#pragma mark - App相关
/**
 获取App启动图

 @return UIImage
 */
+ (UIImage *)cl_getApplicationLaunchImage;

@end
