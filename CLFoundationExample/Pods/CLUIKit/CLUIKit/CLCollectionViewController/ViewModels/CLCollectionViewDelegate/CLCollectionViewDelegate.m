//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLCollectionViewDelegate.m
//
//  Created by Cain on 2016/12/1.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "CLCollectionViewDelegate.h"

@interface CLCollectionViewDelegate ()

@property (nonatomic, weak, readwrite) CLCollectionViewViewModel *cl_viewModel;

@end

@implementation CLCollectionViewDelegate

- (instancetype)initCollectionViewDelegateWithViewModel:(CLCollectionViewViewModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        self.cl_viewModel = viewModel;
    }
    
    return self;
}

@end
