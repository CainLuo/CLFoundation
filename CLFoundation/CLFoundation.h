//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLFoundation.h
//  CLFoundation
//
//  Created by Cain on 2016/12/7.
//  Copyright © 2016年 Cain. All rights reserved.
//

#pragma mark - NSObject+CLObject
#import "NSObject+CLObject.h"

#pragma mark - NSString+CLString
#import "NSString+CLString.h"

#pragma mark - NSBundle+CLBundle
#import "NSBundle+CLBundle.h"

#pragma mark - NSDate+CLDate
#import "NSDate+CLDate.h"

#pragma mark - NSData+CLData
#import "NSData+CLData.h"

#pragma mark - NSURL+CLURL
#import "NSURL+CLURL.h"

#pragma mark - CLAttributedString
#import "NSAttributedString+CLAttributedString.h"
#import "NSMutableAttributedString+CLMutableAttributedString.h"

#pragma mark - CLArray
#import "NSArray+CLArray.h"
#import "NSMutableArray+CLMutableArray.h"

#pragma mark - CLDictionary
#import "NSDictionary+CLDictionary.h"
#import "NSMutableDictionary+CLMutableDictionary.h"

#pragma mark - Define

#define CL_WEAK_SELF(type)  __weak __typeof(&*self)weakSelf = self
#define CL_STRONG_SELF(type)  __strong __typeof(&*self)weakSelf = self

#define CL_GET_METHOD_RETURN_OBJC(objc) if (objc) return objc

#define CL_ANGLE_TO_RADIAN(x) (M_PI * (x) / 180.0)
#define CL_RADIAN_TO_ANGLE(radian) (radian * 180.0) / (M_PI)

#ifdef DEBUG
#define NSLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif
