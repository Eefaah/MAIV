//
//  RecordingViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 10/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "RecordingViewController.h"
#import "AFNetworking/AFNetworking.h"

@interface RecordingViewController ()

@end

@implementation RecordingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.labels = [[NSMutableArray alloc] init];
        
        LabelData *lbl_1 = [LabelDataFactory createLabelWithText:@"Ook geluid is dynamiek,\nen de stad kent veel\ngeluiden. Aan jullie om ze te registreren." width:204 height:95 xPos:90 yPos:110];
        LabelData *lbl_2 = [LabelDataFactory createLabelWithText:@"hard geluid" width:100 height:50 xPos:34 yPos:275];
        LabelData *lbl_3 = [LabelDataFactory createLabelWithText:@"rustig geluid" width:186 height:50 xPos:184 yPos:lbl_2.yPos + lbl_2.height + 100];
        LabelData *lbl_4 = [LabelDataFactory createLabelWithText:@"menselijk geluid" width:140 height:50 xPos:15 yPos:lbl_3.yPos + lbl_3.height + 137];
        LabelData *lbl_5 = [LabelDataFactory createLabelWithText:@"dierlijk geluid" width:255 height:64 xPos:188 yPos:lbl_4.yPos + lbl_4.height + 65];
        
        LabelData *lbl_6 = [LabelDataFactory createLabelWithText:@"een voertuig" width:278 height:71 xPos:15 yPos:lbl_5.yPos + lbl_5.height + 120];
        LabelData *lbl_7 = [LabelDataFactory createLabelWithText:@"de wind" width:128 height:71 xPos:212 yPos:lbl_6.yPos+lbl_6.height+107];
        LabelData *lbl_8 = [LabelDataFactory createLabelWithText:@"Je kan altijd later terugkomen om meer geluiden op te nemen." width:265 height:98/2 xPos:32 yPos:lbl_7.yPos+lbl_7.height+133];
        
        [self.labels addObjectsFromArray:@[lbl_1,lbl_2,lbl_3,lbl_4,lbl_5,lbl_6,lbl_7,lbl_8]];
        
        self.dictDeleteSounds = [NSMutableDictionary dictionary];
        
        self.testInt = 16;
        
    }
    return self;
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[RecordingView alloc] initWithFrame:bounds andLabels:self.labels];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view.navBar.btnBack addTarget:self action:@selector(backToStory:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.btn_story addTarget:self action:@selector(backToStory:) forControlEvents:UIControlEventTouchUpInside];
    
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
    
    for (UIButton *removeButton in self.view.arrRemoveButtons){
        
        NSLog(@"remove btns");
        removeButton.alpha = 0;
        [removeButton addTarget:self action:@selector(removeButtonTapped :) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self getAllAudioFromServer];
    
}

- (void)removeButtonTapped:(id)sender{
    self.removeButtonInteger = [sender tag];
    self.currentRemoveButton = sender;
    [self removeAudioFromServerWithSectionId];
}

-(void)backToStory:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)buttonTapped:(id)sender{
    self.buttonIdInteger = [sender tag];
    self.currentButton = sender;
    [self recordButtonTapped];
}

- (void)playButtonTapped:(id)sender{
    self.playButtonIInteger = [sender tag];
    //moet deze in commentaar staan?
    //self.currentPlayButton = sender;
    [self getAudioFromServerWithSectionId:self.playButtonIInteger];

}

- (void)removeAudioFromServerWithSectionId{
    
    // code om audio te verwijderen volgens button id
    //NSLog(@"%@", [self.dictDeleteSounds objectForKey:[NSNumber numberWithInt:self.removeButtonInteger]]);
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSData *data = [def objectForKey:@"dictDeleteSounds"];
    NSDictionary *retrievedDictionary = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSNumber *soundId = [retrievedDictionary objectForKey:[NSNumber numberWithInt:self.removeButtonInteger]];
    NSLog(@"%@", soundId);
    NSLog(@"%@", retrievedDictionary);
    
    if([self.currentRemoveButton tag] == self.removeButtonInteger){
        self.currentRemoveButton = [self.view.arrRemoveButtons objectAtIndex:self.removeButtonInteger-1];
        self.currentRemoveButton.alpha = 0;
        self.currentPlayButton = [self.view.arrPlayButtons objectAtIndex:self.removeButtonInteger-1];
        self.currentPlayButton.alpha = 0;
        self.currentButton = [self.view.arrButtons objectAtIndex:self.removeButtonInteger-1];
        [self.currentButton setBackgroundImage:[UIImage imageNamed:@"btn_record"] forState:UIControlStateNormal];
        self.currentButton.alpha = 1;
    }
    
    NSString *urlAsString= [NSString stringWithFormat:@"http://student.howest.be/tim.beeckmans/20132014/MAIV/ENROUTE/api/uploads/%@", soundId];
    NSURL *url=[NSURL URLWithString:urlAsString];
    NSMutableURLRequest *urlRequest=[NSMutableURLRequest requestWithURL:url];
    [urlRequest setTimeoutInterval:30.0f];
    [urlRequest setHTTPMethod:@"DELETE"];
    NSOperationQueue *queue=[[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if(error){
            NSLog(@"error deleting %@", error);
        }else{
            NSLog(@"success deleting");
            [self.dictDeleteSounds removeObjectForKey:[NSNumber numberWithInt:self.removeButtonInteger]];
            [[NSUserDefaults standardUserDefaults] synchronize];
            NSLog(@"dict after delete %@", self.dictDeleteSounds);
            
            NSLog(@"remove button int = %i", self.removeButtonInteger);
        }
    }];
}

- (void)getAudioFromServerWithSectionId:(NSInteger)integer{
    
    // zorgen dat ze nu ni kunnen klikken op d eknoppen

    NSLog(@"get audio from server with section id");
    
    NSString *group_id = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"groep_id"]];
    NSLog(@"group id = %@", group_id);

    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://student.howest.be/tim.beeckmans/20132014/MAIV/ENROUTE/api/uploads/onderdeel/%@/%i/%li",group_id, 3, (long)integer]]];

    NSError *error = nil;
    NSArray *loadedData = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    
    if (!error){
    
        NSLog(@"get audio for button = NO ERROR");
    
        for (NSDictionary *dict in loadedData){
    
            self.audioURL = dict[@"url"];
        }
    }else{
        NSLog(@"get audio for button = ERROR");
    }
    
    [self getSpecificSound];
    
}

- (void)getSpecificSound{
    
    NSString *resourcePath = [NSString stringWithFormat:@"http://student.howest.be/tim.beeckmans/20132014/MAIV/ENROUTE/uploads/%@.m4a", self.audioURL];
    NSData *objectData = [NSData dataWithContentsOfURL:[NSURL URLWithString:resourcePath]];
    NSError *error;
    self.player = [[AVAudioPlayer alloc] initWithData:objectData error:&error];
    [self.player setVolume:10.0];
    self.player.numberOfLoops = 0;
    [self.player prepareToPlay];
    
    if (self.player == nil)
        NSLog(@"%@", [error description]);
    else
        [self.player play];
}

- (void)recordButtonTapped{
    
    if(!self.recorder.recording){
        NSLog(@"recording started");
        NSLog(@"%ld", (long)self.buttonIdInteger);
        
        NSError *error;
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setActive:YES error:&error];
        
        if(error){
            NSLog(@"%@", error);
        }
        
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
            [self.currentPlayButton setBackgroundImage:[UIImage imageNamed:@"btn_wait"] forState:UIControlStateNormal];
            [self.currentPlayButton removeTarget:self action:@selector(playButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
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
    
    NSLog(@"dagroep id = %@",[[NSUserDefaults standardUserDefaults] objectForKey:@"dag_groep_id"]);
    NSLog(@"groep id = %@",[[NSUserDefaults standardUserDefaults] objectForKey:@"groep_id"]);
    
    
    NSDictionary *parameters = @{@"dag_groep_id": [[NSUserDefaults standardUserDefaults] objectForKey:@"dag_groep_id"],
                                 @"groep_id" : [[NSUserDefaults standardUserDefaults] objectForKey:@"groep_id"],
                                 @"opdracht_id" : @3,
                                 @"opdracht_onderdeel_id" : [NSNumber numberWithInteger:self.buttonIdInteger]
                                 };
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:audioData name:@"file" fileName:@"file" mimeType:@"audio/mp4a-latm"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", operation.responseObject);
        NSLog(@"id = %@", operation.responseObject[@"id"]);
        
        // vanaf hier mag je op de knop tappen
        [self.currentPlayButton setBackgroundImage:[UIImage imageNamed:@"btn_startTracking"] forState:UIControlStateNormal];
        [self.currentPlayButton addTarget:self action:@selector(playButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        self.currentRemoveButton = [self.view.arrRemoveButtons objectAtIndex:self.buttonIdInteger - 1];
        self.currentRemoveButton.alpha = 1;
        
        //id opslaan in dictionary
        [self.dictDeleteSounds setObject:operation.responseObject[@"id"] forKey:[NSNumber numberWithInteger:self.buttonIdInteger]];
        NSLog(@"dictionary vlak na de upload %@", [self.dictDeleteSounds objectForKey:[NSNumber numberWithInt:self.buttonIdInteger]]);
        NSLog(@"dictionary na upload %@", self.dictDeleteSounds);
        
        [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:self.dictDeleteSounds] forKey:@"dictDeleteSounds"];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", operation.error);
    }];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}



- (void)getAllAudioFromServer{
    
    self.arrInts = [NSMutableArray array];
    
    NSLog(@"get all audio by assignment id");
    
    NSString *group_id = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"groep_id"]];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://student.howest.be/tim.beeckmans/20132014/MAIV/ENROUTE/api/uploads/opdracht/%@/%i",group_id ,3]]];

    NSError *error = nil;
    NSArray *loadedData = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    
    if (!error){
        
        NSLog(@"getAllAudoFromServer -- NO ERROR");
        
        for (NSDictionary *dict in loadedData){
            
            [self.arrInts addObject:dict[@"opdracht_onderdeel_id"]];
        }
    }else{
        NSLog(@"ERROR loading audio from server %@",error);
    }
    
    for(NSNumber *i in self.arrInts){
        
        self.currentPlayButton = [self.view.arrPlayButtons objectAtIndex:[i intValue]-1];
        self.currentPlayButton.alpha = 1;
        self.currentButton = [self.view.arrButtons objectAtIndex:[i intValue]-1];
        self.currentButton.alpha = 0;
        
        self.currentRemoveButton = [self.view.arrRemoveButtons objectAtIndex:[i intValue]-1];
        self.currentRemoveButton.alpha = 1;
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
