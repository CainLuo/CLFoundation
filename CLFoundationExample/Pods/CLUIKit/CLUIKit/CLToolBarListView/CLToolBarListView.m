//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLToolBarListView.m
//
//  Created by Cain on 22/7/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import "CLToolBarListView.h"

#define SELECTED_LINE_LAYER_HEIGHT 3

@interface CLToolBarListView()

@property (nonatomic, strong) CALayer  *cl_bottomLineLayer;
@property (nonatomic, strong) CALayer  *cl_selectedLineLayer;
@property (nonatomic, strong) UIButton *cl_currentButton;

@property (nonatomic, strong) NSMutableArray *cl_buttonArray;

@end

@implementation CLToolBarListView

#pragma mark - 初始化ToolBar
- (instancetype)initToolBarWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        _cl_deselectColor   = [UIColor blackColor];
        _cl_selectedColor   = [UIColor redColor];
        _cl_bottomLineColor = [UIColor grayColor];
        _cl_buttonSpacing   = 10.f;
        _cl_textFont        = 16;
        _cl_toolBarStyle    = CLToolBarNormalStyle;

        _cl_titleAdjustsFontSizeToFitWidth = NO;
        
        _cl_separationColor = [UIColor grayColor];
        _cl_separationWidth = 1;
        
        [self.layer addSublayer:self.cl_bottomLineLayer];
        [self.layer addSublayer:self.cl_selectedLineLayer];

        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

#pragma mark - 设置ToolBar显示的样式
- (void)setCl_toolBarStyle:(CLToolBarStyle)cl_toolBarStyle {
    _cl_toolBarStyle = cl_toolBarStyle;
}

#pragma mark - 设置未选中的按钮颜色
- (void)setCl_deselectColor:(UIColor *)cl_deselectColor {
    _cl_deselectColor = cl_deselectColor;
}

#pragma mark - 设置选中的按钮颜色
- (void)setCl_SelectedColor:(UIColor *)cl_selectedColor {
    _cl_selectedColor = cl_selectedColor;
}

#pragma mark - 设置ToolBar的背景颜色
- (void)setCl_barBakcgroundColor:(UIColor *)cl_barBakcgroundColor {
    self.backgroundColor = cl_barBakcgroundColor;
}

#pragma mark - 设置底部线条的颜色
- (void)setCl_bottomLineColor:(UIColor *)cl_bottomLineColor {
    
    _cl_bottomLineColor = cl_bottomLineColor;
    
    _cl_bottomLineLayer.backgroundColor = cl_bottomLineColor.CGColor;
}

#pragma mark - 设置选中提示条的颜色
- (void)setCl_selectedLineColor:(UIColor *)cl_selectedLineColor {
    
    _cl_selectedLineColor = cl_selectedLineColor;
    
    _cl_selectedLineLayer.backgroundColor = cl_selectedLineColor.CGColor;
}

#pragma mark - 设置按钮文字大小
- (void)setCl_textFont:(NSInteger)cl_textFont {
    _cl_textFont = cl_textFont;
}

#pragma mark - 设置标题文字是否自动缩小
- (void)setCl_titleAdjustsFontSizeToFitWidth:(BOOL)cl_titleAdjustsFontSizeToFitWidth {
    _cl_titleAdjustsFontSizeToFitWidth = cl_titleAdjustsFontSizeToFitWidth;
}

#pragma mark - 设置按钮之间的间距
- (void)setCl_ButtonSpacing:(CGFloat)cl_buttonSpacing {
    _cl_buttonSpacing = cl_buttonSpacing;
}

#pragma mark - 是否需要底部线
- (void)setCl_isNeedLine:(BOOL)cl_isNeedLine {
    _cl_isNeedLine = cl_isNeedLine;
}

#pragma mark - 是否需要选中提示线
- (void)setCl_isNeedSelectedLine:(BOOL)cl_isNeedSelectedLine {
    _cl_isNeedSelectedLine = cl_isNeedSelectedLine;
}

#pragma mark - 获取当前点中的Button
- (NSInteger)cl_currentIndex {
    return _cl_currentIndex;
}

#pragma mark - 默认选中指定的按钮
- (void)cl_didSelectedButton:(NSInteger)index {
    
    if (self.cl_buttonArray.count > 0) {
        
        self.cl_currentButton.selected = NO;

        UIButton *selecteButton = self.cl_buttonArray[index];
        
        self.cl_currentIndex = index;
        
        self.cl_currentButton = selecteButton;
        
        self.cl_currentButton.selected = YES;
        
        [UIView animateWithDuration:0.3f animations:^{
            
            self.cl_selectedLineLayer.frame = CGRectMake(selecteButton.frame.origin.x,
                                                         self.frame.size.height - SELECTED_LINE_LAYER_HEIGHT,
                                                         selecteButton.frame.size.width,
                                                         SELECTED_LINE_LAYER_HEIGHT);
        }];
    }
}

#pragma mark - 刷新整个BarList
- (void)cl_reloadData {
    
    NSAssert(self.cl_titleArray.count, @"你所传入的数组为空");

    for (UIView *subView in self.subviews) {
        
        if ([subView isKindOfClass:[UIButton class]]) {
            
            [subView removeFromSuperview];
        }
        
        if ([subView isKindOfClass:[UIView class]]) {
            
            [subView removeFromSuperview];
        }
    }
    
    UIView *layerBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    layerBackgroundView.backgroundColor = [UIColor colorWithWhite:1 alpha:0];

    [self addSubview:layerBackgroundView];
    
    for (NSInteger i = 0; i < self.cl_titleArray.count; i++) {
        
        CGFloat buttonWidth = self.frame.size.width / _cl_titleArray.count;
        
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        CGFloat buttonX = i == 0 ? i * buttonWidth + (_cl_buttonSpacing / 2) : i * buttonWidth + _cl_buttonSpacing - (_cl_buttonSpacing / 2);
        
        titleButton.frame = CGRectMake(buttonX,
                                       0,
                                       buttonWidth - _cl_buttonSpacing,
                                       self.frame.size.height - SELECTED_LINE_LAYER_HEIGHT);
        titleButton.tag   = i;
        
        titleButton.titleLabel.font = [UIFont systemFontOfSize:self.cl_textFont];
        titleButton.titleLabel.adjustsFontSizeToFitWidth = _cl_titleAdjustsFontSizeToFitWidth;
        
        titleButton.backgroundColor = [UIColor clearColor];
        
        [titleButton setTintColor:[UIColor clearColor]];
        
        [titleButton setTitle:_cl_titleArray[i] forState:UIControlStateNormal];
        [titleButton setTitle:_cl_titleArray[i] forState:UIControlStateSelected];
        
        [titleButton setTitleColor:_cl_deselectColor forState:UIControlStateNormal];
        [titleButton setTitleColor:_cl_selectedColor forState:UIControlStateSelected];
        
        [titleButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 0) {
            
            titleButton.selected = YES;
            self.cl_currentButton = titleButton;
        }
        
        [self addSubview:titleButton];
        [self.cl_buttonArray addObject:titleButton];
        
        if (_cl_toolBarStyle == CLToolBarSeparationStyle) {
            
            CALayer *separationLayer = [CALayer layer];
            
            separationLayer.backgroundColor = _cl_separationColor.CGColor;
            
            CGFloat separationLayerH = titleButton.frame.size.height - 15;

            separationLayer.frame = CGRectMake(i * buttonWidth - 0.5, (titleButton.frame.size.height - separationLayerH) / 2, _cl_separationWidth, separationLayerH);
            
            if (i != 0) {
                [layerBackgroundView.layer addSublayer:separationLayer];
            }
        }
    }
    
    _cl_selectedLineLayer.frame = CGRectMake(_cl_buttonSpacing / 2,
                                          self.frame.size.height - SELECTED_LINE_LAYER_HEIGHT,
                                          self.frame.size.width / self.cl_titleArray.count - _cl_buttonSpacing,
                                          SELECTED_LINE_LAYER_HEIGHT);
}

- (void)buttonAction:(UIButton *)sender {
    
    if (self.cl_toolBarSelectedBlock) {
        
        self.cl_currentButton.selected = NO;
        
        self.cl_currentButton = sender;
        self.cl_currentIndex  = sender.tag;
        
        self.cl_currentButton.selected = YES;

        self.cl_toolBarSelectedBlock(sender.tag);

        [self selectedLineLayerAnimaction];
    }
}

#pragma mark - Button Width Calculation
//- (CGFloat)caculateButtonWidthWithTitleArray:(NSArray *)titleArray {
//    
//    NSInteger titleCount = (NSInteger)titleArray.count;
//    
//    NSString *totalStr = @"";
//    for (NSInteger i = 0; i < titleCount; i++) {
//        
//        if ([titleArray[i] isKindOfClass:[NSString class]] &&
//            [titleArray[i] length]) {
//            
//            totalStr = [totalStr stringByAppendingString:titleArray[i]];
//        }
//    }
//    
//    CGFloat totalWidth = (CGFloat)(NSInteger)[totalStr boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:self.textFont]} context:nil].size.width + titleCount / 2;
//    
//    return totalWidth;
//}

#pragma mark - Init Bottom Line Layer
- (CALayer *)cl_bottomLineLayer {
    
    if (!_cl_bottomLineLayer) {

        _cl_bottomLineLayer = [CALayer layer];
        
        _cl_bottomLineLayer.frame = CGRectMake(0, self.frame.size.height - 0.5, self.frame.size.width, 0.5);
        
        _cl_bottomLineLayer.backgroundColor = [UIColor grayColor].CGColor;
    }

    return _cl_bottomLineLayer;
}

#pragma mark - Init Selected Line Layer
- (CALayer *)cl_selectedLineLayer {
    
    if (!_cl_selectedLineLayer) {

        _cl_selectedLineLayer = [CALayer layer];
        
        _cl_selectedLineLayer.frame = CGRectMake(_cl_buttonSpacing / 2,
                                                 self.frame.size.height - SELECTED_LINE_LAYER_HEIGHT,
                                                 self.frame.size.width / _cl_titleArray.count - _cl_buttonSpacing,
                                                 SELECTED_LINE_LAYER_HEIGHT);
        
        _cl_selectedLineLayer.backgroundColor = [UIColor blueColor].CGColor;
    }

    return _cl_selectedLineLayer;
}

- (void)selectedLineLayerAnimaction {
    
    [UIView animateWithDuration:0.3f
                     animations:^{
        
                         self.cl_selectedLineLayer.frame = CGRectMake(self.cl_currentButton.frame.origin.x,
                                                                      self.frame.size.height - SELECTED_LINE_LAYER_HEIGHT,
                                                                      self.frame.size.width / _cl_titleArray.count - _cl_buttonSpacing,
                                                                      SELECTED_LINE_LAYER_HEIGHT);
                     }];
}

#pragma mark - Init Button Array
- (NSMutableArray *)cl_buttonArray {
    
    if (!_cl_buttonArray) {

        _cl_buttonArray = [NSMutableArray array];
    }

    return _cl_buttonArray;
}

#pragma mark -  CALToolBarSeparationStyle
#pragma mark - 设置Separation Color
- (void)setCl_separationColor:(UIColor *)cl_separationColor {
    _cl_separationColor = cl_separationColor;
}

#pragma mark - 设置Separation Width
- (void)setCl_SeparationWidth:(CGFloat)cl_separationWidth {
    _cl_separationWidth = cl_separationWidth;
}

@end
