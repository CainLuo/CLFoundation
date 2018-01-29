//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  NSURL+CLURL.m
//
//  Created by Cain on 2017/7/10.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "NSURL+CLURL.h"

@implementation NSURL (CLURL)

+ (void)cl_openBrowserWithURL:(NSString *)urlString {
    
    [[UIApplication sharedApplication] openURL:[self URLWithString:urlString]];
}

@end
