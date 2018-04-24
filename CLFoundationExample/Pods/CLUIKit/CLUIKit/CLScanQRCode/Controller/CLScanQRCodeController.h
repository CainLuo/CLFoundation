//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLScanQRCodeController.h
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/21.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLViewController.h"
#import "CLScanQRCodeView.h"

@protocol CLScanQRCodeControllerDelegate <NSObject>

@optional

/**
 获取扫描后的元数据

 @param metadataObjects NSArray
 */
- (void)cl_scanQRCodeGetMetadataObjectsWithMetadataObjects:(NSArray *)metadataObjects;

/**
 获取扫描后的String Value数据

 @param stringValue NSString
 */
- (void)cl_scanQRCodeGetMetadataStringValue:(NSString *)stringValue;

@end

@interface CLScanQRCodeController : CLViewController

/**
 扫描所覆盖的Mark视图, 可定义更换
 */
@property (nonatomic, strong) UIView *cl_scanQRCodeView;

/**
 是否自动停止扫描
 */
@property (nonatomic, assign) BOOL cl_autoStopCaptureSessionRunning;

/**
 CLScanQRCodeControllerDelegate
 */
@property (nonatomic, weak) id <CLScanQRCodeControllerDelegate> cl_scanQRCodeControllerDelegate;


#pragma mark - Block

/**
 获取扫描后的元数据Block
 */
@property (nonatomic, copy) void(^cl_scanQRCodeGetMetadataObjectsBlock)(NSArray *metadataObjects);

/**
 获取扫描后的String Value数据
 */
@property (nonatomic, copy) void(^cl_scanQRCodeGetMetadataStringValue)(NSString *stringValue);

/**
 开始扫描, 默认自动实现
 */
- (void)cl_startCaptureSessionRunning;

/**
 停止扫描, 如果cl_autoStopCaptureSessionRunning为YES则不需要手动, 否则就要手动停止
 */
- (void)cl_stopCaptureSessionRunning;

@end
