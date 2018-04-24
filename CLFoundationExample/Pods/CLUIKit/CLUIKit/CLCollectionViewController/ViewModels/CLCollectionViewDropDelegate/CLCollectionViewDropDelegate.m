//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLCollectionViewDropDelegate.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/3/30.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLCollectionViewDropDelegate.h"

@interface CLCollectionViewDropDelegate ()

@property (nonatomic, weak, readwrite) CLCollectionViewViewModel *cl_viewModel;

@end

@implementation CLCollectionViewDropDelegate

- (instancetype)initCollectionViewDropDelegateWithViewModel:(CLCollectionViewViewModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.cl_viewModel = viewModel;
    }
    
    return self;
}

- (void)collectionView:(nonnull UICollectionView *)collectionView
performDropWithCoordinator:(nonnull id<UICollectionViewDropCoordinator>)coordinator  API_AVAILABLE(ios(11.0)){
    
}

@end
