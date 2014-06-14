//
//  RecordingViewController.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 10/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecordingView.h"
#import <AVFoundation/AVFoundation.h>
#import "LabelDataFactory.h"

@interface RecordingViewController : UIViewController <AVAudioRecorderDelegate, AVAudioRecorderDelegate, AVAudioPlayerDelegate, NSURLConnectionDelegate>

@property (nonatomic, strong) RecordingView *view;
@property (nonatomic) int buttonId;
@property (nonatomic) NSInteger buttonIdInteger;
@property (nonatomic) NSInteger playButtonIInteger;
@property (nonatomic) NSInteger removeButtonInteger;
@property (nonatomic, strong) AVAudioRecorder *recorder;
@property (strong, nonatomic) AVAudioPlayer *player;
@property (nonatomic, strong) UIButton *currentButton;
@property (nonatomic, strong) UIButton *currentPlayButton;
@property (nonatomic, strong) UIButton *currentRemoveButton;
@property (nonatomic, strong) NSString *audioURL;
@property (nonatomic, strong) NSMutableArray *arrInts;
@property (nonatomic, strong) NSString *audioUrl;
@property (nonatomic,strong) NSMutableArray *labels;
@property (nonatomic, strong) NSMutableDictionary *dictDeleteSounds;

@property (nonatomic) NSInteger testInt;

@end
