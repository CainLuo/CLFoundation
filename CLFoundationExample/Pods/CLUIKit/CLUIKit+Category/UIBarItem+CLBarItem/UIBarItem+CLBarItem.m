//
//  UIBarItem+CLBarItem.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/9/19.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "UIBarItem+CLBarItem.h"

@implementation UIBarItem (CLBarItem)

- (UIView *)cl_barItemView {
    return [self valueForKey:@"view"];
}

@end
