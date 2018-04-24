//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLTableViewDelegate.h
//
//  Created by Cain on 2016/11/30.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CLTableViewViewModel.h"

@interface CLTableViewDelegate : NSObject <UITableViewDelegate>

/**
 只读的CLTableViewViewModel
 */
@property (nonatomic, weak, readonly) CLTableViewViewModel *cl_viewModel;

/**
 初始化CLTableViewDelegate

 @param viewModel CLTableViewViewModel
 @return self
 */
- (instancetype)initTableViewDelegateWithViewModel:(CLTableViewViewModel *)viewModel;

@end
