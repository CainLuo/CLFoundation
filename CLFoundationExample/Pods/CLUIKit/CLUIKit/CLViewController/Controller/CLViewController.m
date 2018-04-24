//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLViewController.m
//
//  Created by Cain on 2017/7/12.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "CLViewController.h"

@interface CLViewController ()

@end

@implementation CLViewController

- (instancetype)initCLViewControllerWith:(CLViewControllerStyle)style {
    
    self = [super init];
    
    if (self) {
        
        if (style == CLChildViewController) {
            
            self.hidesBottomBarWhenPushed = YES;
        }
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
