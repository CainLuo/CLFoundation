//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLButton.h
//
//  Created by Cain on 2017/8/31.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CLButtonStyle) {
    
    CLButtonImageTopStyle = 0,
    CLButtonImageLeftStyle,
    CLButtonImageBottomStyle,
    CLButtonImageRightStyle
};

@interface CLButton : UIButton

/**
 设置图片显示的样式
 */
@property (nonatomic, assign) CLButtonStyle cl_buttomImageStyle;

/**
 图片与文字之间的间距, 默认: 10
 */
@property (nonatomic, assign) CGFloat cl_imageSpacing;

/**
 设置图片的尺寸
 */
@property (nonatomic, assign) CGSize cl_imageSize;

@end
