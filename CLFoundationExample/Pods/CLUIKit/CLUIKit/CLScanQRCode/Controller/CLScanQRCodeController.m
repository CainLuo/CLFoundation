//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLScanQRCodeController.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/21.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLScanQRCodeController.h"
#import "UIScreen+CLScreen.h"
#import "UIImage+CLImage.h"
#import "UIViewController+CLViewController.h"

#import <AVFoundation/AVFoundation.h>

@interface CLScanQRCodeController () <AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic, strong) AVCaptureDevice            *captureDevice;
@property (nonatomic, strong) AVCaptureDeviceInput       *captureDeviceInput;
@property (nonatomic, strong) AVCaptureMetadataOutput    *captureMetadataOutPut;
@property (nonatomic, strong) AVCaptureSession           *captureSession;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *captureVideoPreviewLayer;

@end

@implementation CLScanQRCodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#if TARGET_IPHONE_SIMULATOR
    self.view.backgroundColor = [UIColor blackColor];
    
    [self cl_showAlertViewControllerWithTitle:@"模拟器没有摄像头功能"
                                      message:@"请使用真机测试"
                                  buttonTitle:@"好的"];
    
#elif TARGET_OS_IPHONE
    
    [self performSelector:@selector(cl_configCaptureVideoPreviewLayer)
               withObject:nil
               afterDelay:1.0];
    
#endif
}

- (void)cl_configCaptureVideoPreviewLayer {
    
    if (!self.cl_scanQRCodeView) {
        
        self.cl_scanQRCodeView = [[CLScanQRCodeView alloc] initWithFrame:self.view.bounds];
    }

    [self.view addSubview:self.cl_scanQRCodeView];

    [self.view.layer insertSublayer:self.captureVideoPreviewLayer
                                         atIndex:0];
    
    [self cl_startCaptureSessionRunning];
}

- (AVCaptureDevice *)captureDevice {
    
    if (!_captureDevice) {

        _captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    }
    
    return _captureDevice;
}

- (AVCaptureDeviceInput *)captureDeviceInput {
    
    if (!_captureDeviceInput) {

        _captureDeviceInput = [AVCaptureDeviceInput deviceInputWithDevice:self.captureDevice
                                                                    error:nil];
        
    }
    
    return _captureDeviceInput;
}

- (AVCaptureMetadataOutput *)captureMetadataOutPut {
    
    if (!_captureMetadataOutPut) {
    
        _captureMetadataOutPut                = [[AVCaptureMetadataOutput alloc] init];
        _captureMetadataOutPut.rectOfInterest = CGRectMake(0,
                                                           0,
                                                           [UIScreen cl_getScreenWidth],
                                                           [UIScreen cl_getScreenHeight]);
        
        [_captureMetadataOutPut setMetadataObjectsDelegate:self
                                                     queue:dispatch_get_main_queue()];
    }
    
    return _captureMetadataOutPut;
}

- (AVCaptureSession *)captureSession {
    
    if (!_captureSession) {
        
        _captureSession = [[AVCaptureSession alloc] init];
        
        [_captureSession setSessionPreset:AVCaptureSessionPresetHigh];
        
        if ([_captureSession canAddInput:self.captureDeviceInput]) {
            [_captureSession addInput:self.captureDeviceInput];
        }
        
        if ([_captureSession canAddOutput:self.captureMetadataOutPut]) {
            [_captureSession addOutput:self.captureMetadataOutPut];
            
            self.captureMetadataOutPut.metadataObjectTypes = @[AVMetadataObjectTypeUPCECode,
                                                               AVMetadataObjectTypeCode39Code,
                                                               AVMetadataObjectTypeCode39Mod43Code,
                                                               AVMetadataObjectTypeEAN13Code,
                                                               AVMetadataObjectTypeEAN8Code,
                                                               AVMetadataObjectTypeCode93Code,
                                                               AVMetadataObjectTypeCode128Code,
                                                               AVMetadataObjectTypePDF417Code,
                                                               AVMetadataObjectTypeQRCode,
                                                               AVMetadataObjectTypeAztecCode,
                                                               AVMetadataObjectTypeInterleaved2of5Code,
                                                               AVMetadataObjectTypeITF14Code,
                                                               AVMetadataObjectTypeDataMatrixCode];
        }
    }
    
    return _captureSession;
}

- (AVCaptureVideoPreviewLayer *)captureVideoPreviewLayer {
    
    if (!_captureVideoPreviewLayer) {
    
        _captureVideoPreviewLayer              = [AVCaptureVideoPreviewLayer layerWithSession:self.captureSession];
        _captureVideoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        _captureVideoPreviewLayer.frame        = self.view.bounds;
    }
    
    return _captureVideoPreviewLayer;
}

#pragma mark - AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput
didOutputMetadataObjects:(NSArray *)metadataObjects
       fromConnection:(AVCaptureConnection *)connection {
    
    if ([metadataObjects count] > 0) {
        
        if (self.cl_autoStopCaptureSessionRunning) {
            
            [self cl_stopCaptureSessionRunning];
        }

        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        
        if (self.cl_scanQRCodeGetMetadataObjectsBlock) {
            self.cl_scanQRCodeGetMetadataObjectsBlock(metadataObjects);
        }
        
        if (self.cl_scanQRCodeGetMetadataStringValue) {
            self.cl_scanQRCodeGetMetadataStringValue(metadataObject.stringValue);
        }
        
        if ([self.cl_scanQRCodeControllerDelegate respondsToSelector:@selector(cl_scanQRCodeGetMetadataObjectsWithMetadataObjects:)]) {
            
            [self.cl_scanQRCodeControllerDelegate cl_scanQRCodeGetMetadataObjectsWithMetadataObjects:metadataObjects];
        }
        
        if ([self.cl_scanQRCodeControllerDelegate respondsToSelector:@selector(cl_scanQRCodeGetMetadataStringValue:)]) {
            
            [self.cl_scanQRCodeControllerDelegate cl_scanQRCodeGetMetadataStringValue:metadataObject.stringValue];
        }
    }
}

#pragma mark - Controller Capture Session
- (void)cl_startCaptureSessionRunning {
    
    [self.captureSession startRunning];
}

- (void)cl_stopCaptureSessionRunning {
    
    [self.captureSession stopRunning];
}

@end
