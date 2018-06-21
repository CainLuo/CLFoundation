//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLWebViewViewModel.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/5/23.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLWebViewViewModel.h"

@interface CLWebViewViewModel ()

@property (nonatomic, weak, readwrite) CLWebViewController *cl_webViewController;

@end

@implementation CLWebViewViewModel

- (instancetype)initWebViewModelWithController:(CLWebViewController *)controller {
    
    self = [super init];
    
    if (self) {
        
        self.cl_webViewController = controller;
    }
    
    return self;
}

@end
