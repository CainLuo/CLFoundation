//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLWebViewController.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/5/23.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLViewController.h"
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface CLWebViewController : CLViewController

/**
 只读的WKWebView
 */
@property (nonatomic, strong, readonly) WKWebView *cl_webView;

/**
 设置WKWebView的WKUIDelegate于WKNavigationDelegate

 @param UIDelegate WKUIDelegate
 @param navigationDelegate WKNavigationDelegate
 */
- (void)cl_setWebViewUIDelegate:(_Nullable id <WKUIDelegate>)UIDelegate
             navigationDelegate:(_Nullable id <WKNavigationDelegate>)navigationDelegate;


@end
NS_ASSUME_NONNULL_END
