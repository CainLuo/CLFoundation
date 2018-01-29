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

#import <UIKit/UIKit.h>

//! Project version number for CLFoundation.
FOUNDATION_EXPORT double CLFoundationVersionNumber;

//! Project version string for CLFoundation.
FOUNDATION_EXPORT const unsigned char CLFoundationVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <CLFoundation/PublicHeader.h>

#pragma mark - NSString+CLRegular
#import <CLFoundation/NSString+CLRegular.h>
#import <CLFoundation/NSString+CLString.h>
#import <CLFoundation/NSString+CLEncryption.h>

#pragma mark - NSBundle+CLBundle
#import <CLFoundation/NSBundle+CLBundle.h>

#pragma mark - NSDate+CLDate
#import <CLFoundation/NSDate+CLDate.h>

#pragma mark - NSData+CLData
#import <CLFoundation/NSData+CLData.h>

#pragma mark - NSURL+CLURL
#import <CLFoundation/NSURL+CLURL.h>

#pragma mark - CLDefine
#import <CLFoundation/CLDefine.h>

#pragma mark - CLAttributedString
#import <CLFoundation/NSAttributedString+CLAttributedString.h>
#import <CLFoundation/NSMutableAttributedString+CLMutableAttributedString.h>

#pragma mark - CLArray
#import <CLFoundation/NSArray+CLArray.h>
#import <CLFoundation/NSMutableArray+CLMutableArray.h>

#pragma mark - CLDictionary
#import <CLFoundation/NSDictionary+CLDictionary.h>
#import <CLFoundation/NSMutableDictionary+CLMutableDictionary.h>
