//
//  EXBaseViewController.h
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/14.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EXBaseViewController : UIViewController

@property (nonatomic, strong, readonly) UITextView *ex_textView;

@property (nonatomic, strong) NSMutableString *ex_textViewString;

- (void)ex_reloadTextView;

@end
