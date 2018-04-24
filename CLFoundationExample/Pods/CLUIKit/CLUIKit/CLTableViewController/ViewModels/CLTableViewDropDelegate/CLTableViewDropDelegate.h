//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLTableViewDropDelegate.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/3/30.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLTableViewViewModel.h"

@interface CLTableViewDropDelegate : NSObject <UITableViewDropDelegate>

/**
 只读的CLTableViewViewModel
 */
@property (nonatomic, weak, readonly) CLTableViewViewModel *cl_viewModel;

/**
 初始化CLTableViewDragDelegate
 
 @param viewModel CLTableViewViewModel
 @return self
 */
- (instancetype)initTableViewDropDelegateWithViewModel:(CLTableViewViewModel *)viewModel;

@end
