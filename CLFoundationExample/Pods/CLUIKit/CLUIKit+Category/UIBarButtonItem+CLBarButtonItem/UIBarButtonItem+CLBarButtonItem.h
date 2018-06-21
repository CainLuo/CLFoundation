//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIBarButtonItem+CLBarButtonItem.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/4/28.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CLBarButtonItemAction)(UIBarButtonItem *sender);

NS_ASSUME_NONNULL_BEGIN
@interface UIBarButtonItem (CLBarButtonItem)

@property (nullable, nonatomic, copy) CLBarButtonItemAction cl_barButtonItemAction;


@end
NS_ASSUME_NONNULL_END
