//
//  CLSpeechSynthesizer.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/4/20.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "CLSpeechSynthesizer.h"
#import <AVFoundation/AVFoundation.h>

@interface CLSpeechSynthesizer ()  <AVSpeechSynthesizerDelegate>

@property (nonatomic, strong) AVSpeechSynthesizer *cl_speechSynthesizer;
@property (nonatomic, strong) AVSpeechUtterance   *cl_avSpeechUtterance;

@end

@implementation CLSpeechSynthesizer

+ (instancetype)sharedSpeechSynthesizer {
    
    static CLSpeechSynthesizer *cl_sharedInstance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        cl_sharedInstance = [[CLSpeechSynthesizer alloc] init];
    });
    
    return cl_sharedInstance;
}

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        AVAudioSession *cl_avAudioSession = [AVAudioSession sharedInstance];
        
        [cl_avAudioSession setCategory:AVAudioSessionCategoryPlayback
                           withOptions:AVAudioSessionCategoryOptionDuckOthers
                                 error:NULL];
        
        self.cl_speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
        
        [self.cl_speechSynthesizer setDelegate:self];
    }
    
    return self;
}

- (BOOL)cl_isSpeaking {
    
    return self.cl_speechSynthesizer.isSpeaking;
}

- (void)cl_speakString:(NSString *)string {
    
    if (self.cl_speechSynthesizer) {
        
        self.cl_avSpeechUtterance = [AVSpeechUtterance speechUtteranceWithString:string];
        
        self.cl_avSpeechUtterance.rate  = 0.5;
        self.cl_avSpeechUtterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
        
        if (self.cl_speechSynthesizer.isSpeaking) {
            
            [self.cl_speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryWord];
        }
        
        [self.cl_speechSynthesizer speakUtterance:self.cl_avSpeechUtterance];
    }
}

- (void)cl_stopSpeak {
    
    if (self.cl_speechSynthesizer) {
        
        [self.cl_speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    }
}

- (void)cl_chooseVoiceWithLanguage:(NSString *)language
                        speakSpeed:(CGFloat)speakSpeed {
    
    self.cl_avSpeechUtterance.rate  = speakSpeed;
    self.cl_avSpeechUtterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:language];
}

@end
