//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLWebViewViewModel.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/5/23.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLWebViewController.h"

@interface CLWebViewViewModel : NSObject

/**
 只读的CLWebViewController
 */
@property (nonatomic, weak, readonly) CLWebViewController *cl_webViewController;

/**
 初始化CLWebViewViewModel

 @param controller CLWebViewController
 @return CLWebViewViewModel
 */
- (instancetype)initWebViewModelWithController:(CLWebViewController *)controller;

@end
