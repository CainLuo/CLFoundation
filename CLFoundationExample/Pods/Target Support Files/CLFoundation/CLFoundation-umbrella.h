#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "CLFoundation.h"
#import "CLLocaleManager.h"
#import "CLSpeechSynthesizer.h"
#import "NSArray+CLArray.h"
#import "NSAttributedString+CLAttributedString.h"
#import "NSBundle+CLBundle.h"
#import "NSData+CLData.h"
#import "NSDate+CLDate.h"
#import "NSDictionary+CLDictionary.h"
#import "NSFileManager+CLFileManager.h"
#import "NSMutableArray+CLMutableArray.h"
#import "NSMutableAttributedString+CLMutableAttributedString.h"
#import "NSMutableDictionary+CLMutableDictionary.h"
#import "NSNotificationCenter+CLNotificationCenter.h"
#import "NSNumber+CLNumber.h"
#import "NSObject+CLObject.h"
#import "NSString+CLString.h"
#import "NSTimer+CLTimer.h"
#import "NSURL+CLURL.h"

FOUNDATION_EXPORT double CLFoundationVersionNumber;
FOUNDATION_EXPORT const unsigned char CLFoundationVersionString[];

