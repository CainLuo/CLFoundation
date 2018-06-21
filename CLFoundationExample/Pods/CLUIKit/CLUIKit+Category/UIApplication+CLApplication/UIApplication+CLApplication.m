//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIApplication+CLApplication.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/3/5.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "UIApplication+CLApplication.h"
#import "UIScreen+CLScreen.h"
#import "NSURL+CLURL.h"

#import <CoreLocation/CoreLocation.h>
#import <Photos/Photos.h>
#import <Contacts/Contacts.h>
#import <AddressBook/AddressBook.h>
#import <EventKit/EventKit.h>

@implementation UIApplication (CLApplication)

#pragma mark - 权限查询
+ (BOOL)cl_getApplicationLocationPermit {
    
    BOOL cl_authorizedAlways    = [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways;
    BOOL cl_authorizedWhenInUse = [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse;

    if (cl_authorizedAlways || cl_authorizedWhenInUse) {
        
        return YES;
    }

    return NO;
}

+ (BOOL)cl_getApplicationAddressBookPermit {
    
    if (@available(iOS 9.0, *)) {
        
        BOOL cl_authorizationStatusAuthorized = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts] == CNAuthorizationStatusAuthorized;
        
        return cl_authorizationStatusAuthorized;
        
    } else {
    
        BOOL cl_authorizationStatusAuthorized = ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized;
        
        return cl_authorizationStatusAuthorized;
    }
}

+ (BOOL)cl_getApplicationCameraPermit {
    
    BOOL cl_authorizationStatusAuthorized = [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent] == EKAuthorizationStatusAuthorized;
    
    return cl_authorizationStatusAuthorized;
}

+ (BOOL)cl_getApplicationRemindersPermit {
    
    BOOL cl_authorizationStatusAuthorized = [EKEventStore authorizationStatusForEntityType:EKEntityTypeReminder] == EKAuthorizationStatusAuthorized;
    
    return cl_authorizationStatusAuthorized;
}

+ (BOOL)cl_getApplicationPhotosLibraryPermit {
    
    BOOL cl_authorizationStatusAuthorized = [PHPhotoLibrary authorizationStatus] == PHAuthorizationStatusAuthorized;
    
    return cl_authorizationStatusAuthorized;
}

+ (void)cl_getApplicationMicrophonePermitWithBlock:(CLPermissionBlock)block {

    [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
        
        if (block) {
            block(granted);
        }
    }];
}

#pragma mark - Open URL
+ (void)cl_callPhoneWithPhoneNumber:(NSString *)phoneNumber {
    
    NSString *cl_tellPhoneNumber = [NSString stringWithFormat:@"tel:%@", phoneNumber];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:cl_tellPhoneNumber]];
}

+ (void)cl_sendEmailWithEmailAddress:(NSString *)emailAddress {
    
    NSString *cl_emailAddress = [NSString stringWithFormat:@"mailto://:%@", emailAddress];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:cl_emailAddress]];
}

+ (void)cl_goToAppSetting {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
}

#pragma mark - App相关
+ (UIImage *)cl_getApplicationLaunchImage {
    
    UIImage *__block cl_launchImage;
    NSString *cl_interfaceOrientation;
    
    CGSize cl_screenSize = [UIScreen cl_getScreenSize];
    
    UIInterfaceOrientation cl_interfaceProentation = [[self sharedApplication] statusBarOrientation];
    
    if (cl_interfaceProentation == UIInterfaceOrientationLandscapeLeft || cl_interfaceProentation == UIInterfaceOrientationLandscapeRight) {
        
        cl_interfaceOrientation = @"Landscape";
    } else {
        
        cl_interfaceOrientation = @"Portrait";
    }
    
    NSArray<NSDictionary *> *cl_applicationImages = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    
    [cl_applicationImages enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGSize cl_imageSize = CGSizeFromString(obj[@"UILaunchImageSize"]);
        
        if (CGSizeEqualToSize(cl_imageSize, cl_screenSize) && [cl_interfaceOrientation isEqualToString:obj[@"UILaunchImageOrientation"]]) {
            
            cl_launchImage = [UIImage imageNamed:obj[@"UILaunchImageName"]];
        }
    }];
    
    return cl_launchImage;
}


#pragma mark - 获取UIStatusBar的高度
+ (CGFloat)cl_getStatusBarHeight {
    
    return [[self sharedApplication] statusBarFrame].size.height;
}

@end
