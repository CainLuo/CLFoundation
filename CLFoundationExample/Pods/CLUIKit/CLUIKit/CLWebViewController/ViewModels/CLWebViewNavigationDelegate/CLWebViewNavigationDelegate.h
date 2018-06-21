//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLWebViewNavigationDelegate.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/5/23.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
#import "CLWebViewViewModel.h"

@interface CLWebViewNavigationDelegate : NSObject <WKNavigationDelegate>

/**
 只读的CLWebViewViewModel
 */
@property (nonatomic, weak, readonly) CLWebViewViewModel *cl_viewModel;

/**
 初始化CLWebViewNavigationDelegate

 @param viewModel CLWebViewViewModel
 @return CLWebViewNavigationDelegate
 */
- (instancetype)initWebViewNavigationDelegateWithViewModel:(CLWebViewViewModel *)viewModel;

@end
