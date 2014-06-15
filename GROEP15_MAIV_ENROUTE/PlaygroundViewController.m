//
//  PlaygroundViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 09/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "PlaygroundViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "AFNetworking.h"
#import <AVFoundation/AVFoundation.h>

@interface PlaygroundViewController ()

@end

@implementation PlaygroundViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.labels = [[NSMutableArray alloc] init];
        
        LabelData *lbl_1 = [LabelDataFactory createLabelWithText:@"Geef de iphone door naar de persoon \nhet dichts bij jou!" width:180 height:65 xPos:102 yPos:135];
        LabelData *lbl_2 = [LabelDataFactory createLabelWithText:@"Ga naar een speeltuin of park in de buurt." width:252 height:50 xPos:27 yPos:318];
        LabelData *lbl_3 = [LabelDataFactory createLabelWithText:@"Kies een speeltuig uit dat je op een leuke manier in beweging brengt." width:186 height:90 xPos:96 yPos:lbl_2.yPos + lbl_2.height + 30];
        LabelData *lbl_4 = [LabelDataFactory createLabelWithText:@"Terwijl je op het speeltuig zit maak je een filmpje." width:205 height:68 xPos:97 yPos:lbl_3.yPos + lbl_3.height + 76];
        LabelData *lbl_5 = [LabelDataFactory createLabelWithText:@"Tijdens het filmen worden je bewegingen geregistreerd." width:255 height:64 xPos:56 yPos:693];
        LabelData *lbl_6 = [LabelDataFactory createLabelWithText:@"Je kan jezelf filmen, of de lucht, of je vrienden die je duwen op de schommel,..." width:278 height:71 xPos:15 yPos:812];
        LabelData *lbl_7 = [LabelDataFactory createLabelWithText:@"Wees origineel!" width:128 height:71 xPos:100 yPos:lbl_6.yPos+lbl_6.height+10];
        
        [self.labels addObjectsFromArray:@[lbl_1,lbl_2,lbl_3,lbl_4,lbl_5,lbl_6,lbl_7]];
    }
    return self;
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    //NSLog(@"self.labels = %@",self.labels);
    self.view = [[PlaygroundView alloc] initWithFrame:bounds andLabels:self.labels];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.view.btn_start addTarget:self action:@selector(btnBeginnenTapped :) forControlEvents:UIControlEventTouchUpInside];
    [self.view.navBar.btnBack addTarget:self action:@selector(btnBackTapped :) forControlEvents:UIControlEventTouchUpInside];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(btnBackTapped:) name:@"PLAY_BACK" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(retakeTapped :) name:@"RETAKE_TAPPED" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showDrawing :) name:@"SHOW_DRAWING" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backToUitleg:) name:@"OP1_BACK_TAPPED" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backToMenu:) name:@"OP1_BACK_TO_MENU" object:nil];

    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                        selector:@selector(orientationChanged:)
                                        name:UIDeviceOrientationDidChangeNotification
                                        object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sessionStopped:) name:AVCaptureSessionDidStopRunningNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sessionStarted:) name:AVCaptureSessionDidStartRunningNotification object:nil];
}

- (void)sessionStopped:(id)sender {
    NSLog(@"Sessie stopped");
}

- (void)sessionStarted:(id)sender {
    NSLog(@"CAMERA IS READY");
    
}

- (void)backToMenu:(id)sender{
    NSLog(@"back to menu");
    self.endVC = nil;
    self.endVC.view = nil;
    self.cameraView = nil;
    self.imagePicker = nil;
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)orientationChanged:(NSNotification *)notification
{
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    NSLog(@"device orientation = %ld",deviceOrientation);
    
    switch (deviceOrientation) {
        case 1:
            break;
        case 2:
            break;
        case 3:
            //imagepicker tonen
            // testderdest
            [self showCamera];
            [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
            break;
        case 4:
            //[self showCamera];
            break;
    
        default:
            break;
    }
}

- (void)backToUitleg:(id)sender{
    //NSLog(@"pop view controller");
    [self.navigationController popToViewController:self animated:YES];
    self.cameraView = nil;
    self.imagePicker = nil;
    self.endVC = nil;
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
}

- (void)btnBackTapped:(id)sender{
    //NSLog(@"pop view controller");
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)btnBeginnenTapped:(id)sender{
    NSLog(@"Begin tapped");
    [self showCamera];
}

- (void)showCamera{
    //NSLog(@"show camera");
    
    NSLog(@"Show cameraCamera view %@", self.cameraView);
    NSLog(@"show camera image picker %@", self.imagePicker);
    
    self.imagePicker = [[UIImagePickerController alloc] init];
    
    NSLog(@"Show camera --- na init Camera view %@", self.cameraView);
    NSLog(@"show camera --- na init  image picker %@", self.imagePicker);
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        
        NSLog(@"checking source type");
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.imagePicker.mediaTypes = [NSArray arrayWithObject:@"public.movie"];
        self.imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
        self.imagePicker.allowsEditing = YES;
        self.imagePicker.showsCameraControls = NO;
        self.imagePicker.videoMaximumDuration = 10;
        self.imagePicker.delegate = self;
        self.cameraView = [[CameraOverlayView alloc] initWithFrame:self.imagePicker.view.frame];
        self.imagePicker.cameraOverlayView = self.cameraView;
        [self.cameraView.btn_camera addTarget:self action:@selector(toggleVideoRecording) forControlEvents:UIControlEventTouchUpInside];
        
//        self.cameraView = [[CameraOverlayView alloc] initWithFrame:self.imagePicker.view.frame];
//        self.imagePicker.cameraOverlayView = self.cameraView;
        //NSLog(@"%@", sourceTypes);
        
    }else{
        
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
        [self presentViewController:self.imagePicker animated:NO completion:^{
            NSLog(@"Show imagepicker");
        }];
}

- (void)toggleVideoRecording {
    NSLog(@"PlaygroundVC -- toggleVideoRecording -- self.recording = %d",self.recording);
    if (!self.recording) {
        self.recording = YES;
        UIImage *camera = [UIImage imageNamed:@"btn_stop"];
        [self.cameraView.btn_camera setBackgroundImage:camera forState:UIControlStateNormal];
        [self.cameraView lines];

        [self startRecording];
    } else {
        self.recording = NO;
        UIImage *camera = [UIImage imageNamed:@"btn_record"];
        [self.cameraView.btn_camera setBackgroundImage:camera forState:UIControlStateNormal];
        
        [self stopRecording];
    }
}

- (void)startRecording {
    
    void (^hideControls)(void);
    hideControls = ^(void) {
        //        self.btn_camera.alpha = 0;
    };
    
    void (^recordMovie)(BOOL finished);
    recordMovie = ^(BOOL finished) {
        [self.imagePicker startVideoCapture];
    };
    
    // Hide controls
    [UIView  animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:hideControls completion:recordMovie];
}

- (void)stopRecording {
    [self.imagePicker stopVideoCapture];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSLog(@"gestop met filmen");
    
    // hier wss de boolean instellen op 0 -- voor als het filmpje na 10 sec zelfs stopt met recorden :)
    self.recording = 0;
    
    NSURL *videoURL = [info valueForKey:UIImagePickerControllerMediaURL];
    NSString *pathToVideo = [videoURL path];
    
    BOOL okToSaveVideo = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(pathToVideo);
    
    if (okToSaveVideo) {
        
        [self.imagePicker dismissViewControllerAnimated:NO completion:^{
            
            
            // end view controller tonen
            self.endVC = [[EndViewController alloc] initWithNibName:nil bundle:nil];

            // oproepen na aanmaken endVC zodat showDrawing de functie getDrawingImage kan oproepen
            [self.cameraView endDrawing];
            //self.imagePicker.delegate = nil;
            self.cameraView = nil;
            self.imagePicker = nil;
            
            NSLog(@"Camera view %@", self.cameraView);
            NSLog(@"image picker %@", self.imagePicker);
            [self.navigationController pushViewController:self.endVC animated:NO];
            [self.endVC getVideoWithUrl:videoURL];

        }];
        
        
    } else {
        
    }
}

- (void)retakeTapped:(id)sender{
    NSLog(@"retake tapped");
    //self.endVC = nil;
    
    [self.navigationController popViewControllerAnimated:NO];
    self.endVC = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(next:) name:@"TIS_WEG" object:nil];
    [self showCamera];
    
}


- (void)showDrawing:(NSNotification *) notification
{
    NSLog(@"end draw");
    
    if ([notification.name isEqualToString:@"SHOW_DRAWING"])
    {
        NSDictionary* userInfo = notification.userInfo;
        self.drawnImage = [userInfo objectForKey:@"drawnImage"];
        [self.endVC getDrawingImage:self.drawnImage];
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

-(void)dealloc{
    NSLog(@"Speeltuin -- dealloc -- AM I CALLED?");
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
