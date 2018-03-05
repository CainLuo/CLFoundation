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

#pragma mark - NSArray+CLArray
#import "NSArray+CLArray.h"

#pragma mark - NSAttributedString+CLAttributedString
#import "NSAttributedString+CLAttributedString.h"

#pragma mark - NSBundle+CLBundle
#import "NSBundle+CLBundle.h"

#pragma mark - NSData+CLData
#import "NSData+CLData.h"

#pragma mark - NSDate+CLDate
#import "NSDate+CLDate.h"

#pragma mark - NSDictionary+CLDictionary
#import "NSDictionary+CLDictionary.h"

#pragma mark - NSFileManager+CLFileManager
#import "NSFileManager+CLFileManager.h"

#pragma mark - NSFileManager+CLFileManager
#import "NSFileManager+CLFileManager.h"

#pragma mark - NSMutableArray+CLMutableArray
#import "NSMutableArray+CLMutableArray.h"

#pragma mark - NSMutableAttributedString+CLMutableAttributedString
#import "NSMutableAttributedString+CLMutableAttributedString.h"

#pragma mark - NSMutableDictionary+CLMutableDictionary
#import "NSMutableDictionary+CLMutableDictionary.h"

#pragma mark - NSNumber+CLNumber
#import "NSNumber+CLNumber.h"

#pragma mark - NSObject+CLObject
#import "NSObject+CLObject.h"

#pragma mark - NSString+CLString
#import "NSString+CLString.h"

#pragma mark - NSTimer+CLTimer
#import "NSTimer+CLTimer.h"

#pragma mark - NSURL+CLURL
#import "NSURL+CLURL.h"

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
