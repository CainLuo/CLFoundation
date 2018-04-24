//
//  CLSpeechSynthesizer.h
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/4/20.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface CLSpeechSynthesizer : NSObject

+ (instancetype)sharedSpeechSynthesizer;

/**
 是否正在进行语音播报

 @return BOOL
 */
- (BOOL)cl_isSpeaking;

/**
 输入指定的语音播报内容

 @param string 语音播报内容
 */
- (void)cl_speakString:(NSString *)string;

/**
 停止语音播报
 */
- (void)cl_stopSpeak;

/**
 选择语音播报的语言和播报速度

 @param language 语言, 默认中文
 @param speakSpeed 播报速度, 默认0.5
 */
- (void)cl_chooseVoiceWithLanguage:(NSString *)language
                        speakSpeed:(CGFloat)speakSpeed;

@end
