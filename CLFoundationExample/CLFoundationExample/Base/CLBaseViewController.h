//
//  CLBaseViewController.h
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/14.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLBaseViewController : UIViewController

@property (nonatomic, strong, readonly) UITextView *cl_textView;

@property (nonatomic, strong) NSMutableString *cl_textViewString;

- (void)cl_reloadTextView;

@end
