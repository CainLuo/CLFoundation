//
//  EXAttributeStringController.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/14.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "EXAttributeStringController.h"

@interface EXAttributeStringController ()

@end

@implementation EXAttributeStringController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableAttributedString *cl_mutableAttributedString = [[NSMutableAttributedString alloc] init];
    
    [cl_mutableAttributedString appendAttributedString:[self ex_textViewAttributedTextWithString]];
    [cl_mutableAttributedString appendAttributedString:[self ex_textViewMutableAttributedTextWithString]];

    self.ex_textView.attributedText = cl_mutableAttributedString;
}

- (NSMutableAttributedString *)ex_textViewAttributedTextWithString {
    
    NSString *cl_string = @"Hello Word\n\n";
    
    NSAttributedString *cl_attributedString = [NSAttributedString cl_attributeStringWithString:cl_string
                                                                                          font:[UIFont systemFontOfSize:40]
                                                                                         range:NSMakeRange(0, 3)];
    
    NSAttributedString *cl_colorAttributedString = [NSAttributedString cl_attributeStringWithAttributedString:cl_attributedString
                                                                                                        color:[UIColor redColor]
                                                                                                        range:[cl_string rangeOfString:@"Word"]];
    
    NSString *cl_attributeHeightString = [NSString stringWithFormat:@"----------NSAttributedString----------\n富文本的高度为: %f\n", [cl_colorAttributedString cl_attributedStringHeightWithContainWidth:cl_colorAttributedString.length]];
    
    NSMutableAttributedString *cl_mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:cl_attributeHeightString];
    
    [cl_mutableAttributedString appendAttributedString:cl_colorAttributedString];
    
    return cl_mutableAttributedString;
}

- (NSMutableAttributedString *)ex_textViewMutableAttributedTextWithString {
    
    NSAttributedString *cl_enterString = [[NSAttributedString alloc] initWithString:@"\n"];

    NSMutableAttributedString *cl_mutableAttributedString = [[NSMutableAttributedString alloc] init];
    
//    NSMutableAttributedString *cl_prefixImageAttributedString = [NSMutableAttributedString cl_attributeStringWithPrefixString:@"----------NSMutableAttributedString----------\n图片在文字的后面"
//                                                                                                                  prefixImage:[UIImage imageNamed:@"icon1"]];
    NSMutableAttributedString *cl_prefixImageAttributedString = [NSMutableAttributedString cl_attributeStringWithPrefixString:@"----------NSMutableAttributedString----------\n图片在文字的后面"
                                                                                                                   imageFrame:CGRectMake(0, 30, 30, 30)
                                                                                                                  prefixImage:[UIImage imageNamed:@"icon1"]];

//    NSMutableAttributedString *cl_subffixImageAttributedString = [NSMutableAttributedString cl_attributeStringWithSubffixString:@"图片在文字的前面"
//                                                                                                                   subffixImage:[UIImage imageNamed:@"icon1"]];
    
    NSMutableAttributedString *cl_subffixImageAttributedString = [NSMutableAttributedString cl_attributeStringWithSubffixString:@"图片在文字的前面"
                                                                                                                     imageFrame:CGRectMake(0, -40, 30, 30)
                                                                                                                   subffixImage:[UIImage imageNamed:@"icon1"]];

    NSMutableAttributedString *cl_lineAttributedString = [NSMutableAttributedString cl_attributedStringWithString:@"设置字符串的行距\nHello Word"
                                                                                                      lineSpacing:5];


    [cl_mutableAttributedString appendAttributedString:cl_prefixImageAttributedString];
    [cl_mutableAttributedString appendAttributedString:cl_enterString];
    [cl_mutableAttributedString appendAttributedString:cl_subffixImageAttributedString];
    [cl_mutableAttributedString appendAttributedString:cl_enterString];
    [cl_mutableAttributedString appendAttributedString:cl_enterString];
    [cl_mutableAttributedString appendAttributedString:cl_lineAttributedString];

    return cl_mutableAttributedString;
}
@end
