//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIFont+CLFont.m
//
//  Created by Cain Luo on 2017/12/18.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "UIFont+CLFont.h"
#import "UIScreen+CLScreen.h"

@implementation UIFont (CLFont)

+ (UIFont *)cl_fitSystemFontOfSize:(CGFloat)fontSize {
    
    return [UIFont systemFontOfSize:[UIScreen cl_fitScreen:fontSize]];
}

+ (UIFont *)cl_fitBoldSystemFontOfSize:(CGFloat)fontSize {
    
    return [UIFont boldSystemFontOfSize:[UIScreen cl_fitScreen:fontSize]];
}

+ (UIFont *)cl_fitItalicSystemFontOfSize:(CGFloat)fontSize {
    
    return [UIFont italicSystemFontOfSize:[UIScreen cl_fitScreen:fontSize]];
}

+ (UIFont *)cl_fitSystemFontOfSize:(CGFloat)fontSize
                            weight:(UIFontWeight)weight NS_AVAILABLE_IOS(8_2) {

    return [UIFont systemFontOfSize:[UIScreen cl_fitScreen:fontSize]
                             weight:[UIScreen cl_fitScreen:weight]];
}

+ (UIFont *)cl_fitMonospacedDigitSystemFontOfSize:(CGFloat)fontSize
                                           weight:(UIFontWeight)weight NS_AVAILABLE_IOS(9_0) {
    
    return [UIFont monospacedDigitSystemFontOfSize:[UIScreen cl_fitScreen:fontSize]
                                            weight:[UIScreen cl_fitScreen:weight]];
}

@end
