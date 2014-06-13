//
//  RecordingViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 10/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "RecordingViewController.h"
#import "AFNetworking.h"

@interface RecordingViewController ()

@end

@implementation RecordingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[RecordingView alloc] initWithFrame:bounds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *pathComponents = [NSArray arrayWithObjects:
                               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],
                               @"audio.m4a",
                               nil];
    NSURL *outputFileURL = [NSURL fileURLWithPathComponents:pathComponents];
    
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];
    
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
    
    NSError *error;
    self.recorder = [[AVAudioRecorder alloc] initWithURL:outputFileURL settings:recordSetting error:&error];
    self.recorder.delegate = self;
    
    if (self.recorder) {
  		[self.recorder prepareToRecord];
  		self.recorder.meteringEnabled = YES;
  	} else
  		NSLog(@"%@", [error description]);
    
    for (UIButton *button in self.view.arrButtons){
        
        [button addTarget:self action:@selector(buttonTapped :) forControlEvents:UIControlEventTouchUpInside];
    }
    
    for (UIButton *playButton in self.view.arrPlayButtons){
        
        playButton.alpha = 0;
        [playButton addTarget:self action:@selector(playButtonTapped :) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self getAllAudioFromServer];
}

- (void)buttonTapped:(id)sender{
    self.buttonIdInteger = [sender tag];
    self.currentButton = sender;
    [self recordButtonTapped];
}

- (void)playButtonTapped:(id)sender{
    self.playButtonIInteger = [sender tag];
    //self.currentPlayButton = sender;
    [self getAudioFromServerWithSectionId:self.playButtonIInteger];

}

- (void)getAudioFromServerWithSectionId:(NSInteger)integer{
    
    NSLog(@"get audio from server with section id");

    //// aangepast van %i integer naar %li (long)integer dus misschien levert dit problemen op
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://student.howest.be/tim.beeckmans/20132014/MAIV/ENROUTE/api/uploads/onderdeel/%i/%i/%li", 1, 3, (long)integer]]];
    NSError *error = nil;
    NSArray *loadedData = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    
    if (!error){
    
        NSLog(@"NO ERROR");
    
        for (NSDictionary *dict in loadedData){
    
            self.audioURL = dict[@"url"];

        }
    }else{
        NSLog(@"ERROR");
    }
    
    [self getSpecificSound];
    
}

- (void)getSpecificSound{
    
    NSString *resourcePath = [NSString stringWithFormat:@"http://student.howest.be/tim.beeckmans/20132014/MAIV/ENROUTE/uploads/%@.m4a", self.audioURL];
    NSData *objectData = [NSData dataWithContentsOfURL:[NSURL URLWithString:resourcePath]];
    NSError *error;
    self.player = [[AVAudioPlayer alloc] initWithData:objectData error:&error];
    self.player.numberOfLoops = 0;
    self.player.volume = 1.0f;
    [self.player prepareToPlay];
    
    if (self.player == nil)
        NSLog(@"%@", [error description]);
    else
        [self.player play];
}

- (void)recordButtonTapped{
    
    if(!self.recorder.recording){
        NSLog(@"recording started");
        
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setActive:YES error:nil];
        
        [self.recorder record];
        // background image van button aanpassen
        if([self.currentButton tag] == self.buttonIdInteger){
            [self.currentButton setBackgroundImage:[UIImage imageNamed:@"btn_stop"] forState:UIControlStateNormal];
        }
        
    }else{
        NSLog(@"recording stopped");
        [self.recorder stop];
        
        if([self.currentButton tag] == self.buttonIdInteger){
            //[self.currentButton setBackgroundImage:[UIImage imageNamed:@"opdracht4_btnAfspelen"] forState:UIControlStateNormal];
            self.currentPlayButton = [self.view.arrPlayButtons objectAtIndex:self.buttonIdInteger -1];
            self.currentPlayButton.alpha = 1;
            self.currentButton.alpha = 0;
        }
        
        [self uploadAudioToServer];
    }
}

- (void)playButtonTapped{
    NSLog(@"[RecordAudioVC] Play/pause button tapped");
    
    //[self getAudioFromServerWithSectionId:self.playButtonIInteger];
}

-(void)uploadAudioToServer{
    NSLog(@"[OverviewVC] Upload audio to server");
    
    NSData *audioData = [NSData dataWithContentsOfFile:[self.recorder.url path]];
    
    NSString *url = @"http://student.howest.be/tim.beeckmans/20132014/MAIV/ENROUTE/uploads/index.php";
    
    NSDictionary *parameters = @{@"dag_groep_id": @1,
                                 @"groep_id" : @1,
                                 @"opdracht_id" : @3,
                                 @"opdracht_onderdeel_id" : [NSNumber numberWithInteger:self.buttonIdInteger]
                                 };
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:audioData name:@"file" fileName:@"file" mimeType:@"audio/mp4a-latm"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", operation.responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", operation.error);
    }];
}



- (void)getAllAudioFromServer{
    
    self.arrInts = [NSMutableArray array];
    
    NSLog(@"get all audio by assignment id");
    
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://student.howest.be/tim.beeckmans/20132014/MAIV/ENROUTE/api/uploads/byOpdrachtId/%i", 3]]];
    NSError *error = nil;
    NSArray *loadedData = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    
    if (!error){
        
        NSLog(@"NO ERROR");
        
        for (NSDictionary *dict in loadedData){
            
            [self.arrInts addObject:dict[@"opdracht_onderdeel_id"]];
        }
    }else{
        NSLog(@"ERROR");
    }
    
    for(NSNumber *i in self.arrInts){
        
        self.currentPlayButton = [self.view.arrPlayButtons objectAtIndex:[i intValue]-1];
        self.currentPlayButton.alpha = 1;
        self.currentButton = [self.view.arrButtons objectAtIndex:[i intValue]-1];
        self.currentButton.alpha = 0;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
