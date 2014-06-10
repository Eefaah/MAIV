//
//  PlaygroundViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 09/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "PlaygroundViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AFNetworking.h>

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
    NSLog(@"self.labels = %@",self.labels);
    self.view = [[PlaygroundView alloc] initWithFrame:bounds andLabels:self.labels];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view.btn_start addTarget:self action:@selector(btnBeginnenTapped :) forControlEvents:UIControlEventTouchUpInside];
    [self.view.navBar.btnBack addTarget:self action:@selector(btnBackTapped :) forControlEvents:UIControlEventTouchUpInside];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(btnBackTapped:) name:@"PLAY_BACK" object:nil];

        [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(orientationChanged:)
                                                     name:UIDeviceOrientationDidChangeNotification
                                                   object:nil];
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
            break;
        case 4:

            break;
            
        default:
            break;
    }
}


- (void)btnBackTapped:(id)sender{
    NSLog(@"pop view controller");
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)btnBeginnenTapped:(id)sender{
    
    [self showCamera];
}

- (void)showCamera{
    NSLog(@"show camera");
    self.imagePicker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        NSArray *sourceTypes = [UIImagePickerController availableMediaTypesForSourceType:self.imagePicker.sourceType];
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        //imagePicker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
        self.imagePicker.mediaTypes = [NSArray arrayWithObject:@"public.movie"];
        self.imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
        self.imagePicker.allowsEditing = YES;
        self.imagePicker.showsCameraControls = NO;
        
        self.cameraView = [[CameraOverlayView alloc] initWithFrame:self.imagePicker.view.frame];
        
        
        NSLog(@"%@", sourceTypes);
        
    }else{
        
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:self.imagePicker animated:YES completion:^{}];
    self.imagePicker.cameraOverlayView = self.cameraView;
    [self.cameraView.btn_camera addTarget:self action:@selector(toggleVideoRecording) forControlEvents:UIControlEventTouchUpInside];
    
    self.imagePicker.delegate = self;
}

- (void)toggleVideoRecording {
    if (!self.recording) {
        self.recording = YES;
        UIImage *camera = [UIImage imageNamed:@"btn_stop"];
        [self.cameraView.btn_camera setBackgroundImage:camera forState:UIControlStateNormal];
        
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
    
    NSURL *videoURL = [info valueForKey:UIImagePickerControllerMediaURL];
    NSString *pathToVideo = [videoURL path];
    BOOL okToSaveVideo = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(pathToVideo);
    if (okToSaveVideo) {
        
//        UISaveVideoAtPathToSavedPhotosAlbum(pathToVideo, self, @selector(video:didFinishSavingWithError:contextInfo:), NULL);
        NSURL *videoURL = [info objectForKey:UIImagePickerControllerMediaURL];
        NSData *videoData = [NSData dataWithContentsOfURL:videoURL];
        
        // nieuwe view controller tonen
        self.saveVC = [[SaveOrRetakeViewController alloc] initWithData:videoData];
        [self.imagePicker dismissViewControllerAnimated:NO completion:^{
        [self presentViewController:self.saveVC animated:NO completion:^{}];
        }];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissRetake:) name:@"VIDEO_SAVED" object:nil];
        
        
        
//        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//        
//        NSDictionary *parameters = @{@"dag_groep_id": @1,
//                                     @"groep_id" : @1,
//                                     @"opdracht_id" : @2,
//                                     @"opdracht_onderdeel_id" : @0
//                                     };
//        
//        [manager POST:@"http://student.howest.be/tim.beeckmans/20132014/MAIV/ENROUTE/uploads/index.php" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//            [formData appendPartWithFileData:videoData name:@"file" fileName:@"testvideoupload" mimeType:@"video/quicktime"];
//        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"BTN_SAVE_TAPPED" object:nil];
//            //NSLog(@"Success: %@", responseObject);
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"Error: %@", error);
//        }];
        
        
        //[self dismissViewControllerAnimated:YES completion:^{}];
        
        
    } else {
        
        [self video:pathToVideo didFinishSavingWithError:nil contextInfo:NULL];
    }
}

-(void)dismissRetake:(NSNotification *)notification{
    [self.saveVC dismissViewControllerAnimated:YES completion:^{}];
    
    NSDictionary *userInfo = notification.userInfo;
    
    // resultaat tonen
    self.resultVC = [[ResultViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:self.resultVC animated:YES];
}

//- (void)uploadPost{
//    UIImage *image = self.view.drawnImage;
//    NSData *data = UIImageJPEGRepresentation(image, 0.5);
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    NSString *filename = @"IMG_2108.jpg";
//    
//    //alle extra info die in de database komt kan hierin...
//    NSDictionary *parameters = @{@"dag_groep_id": @1,
//                                 @"groep_id" : @1,
//                                 @"opdracht_id" : @1,
//                                 @"opdracht_onderdeel_id" : @0
//                                 };
//    
//    [manager POST:@"http://student.howest.be/tim.beeckmans/20132014/MAIV/ENROUTE/uploads/index.php" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        [formData appendPartWithFileData:data name:@"file" fileName:filename mimeType:@"image/jpeg"];
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"BTN_SAVE_TAPPED" object:nil];
//        NSLog(@"Success: %@", responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
//}

- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    
    // Show controls
    //[UIView  animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:showControls completion:NULL];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
//    UIImage *toolBarIMG = [UIImage imageNamed: @"navigationbar"];
//    
//    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
//        [self.navigationController.navigationBar setBackgroundImage:toolBarIMG forBarMetrics:0];
//    }
//    
//    UIImage *back = [UIImage imageNamed:@"btn_backToMap"];
//    
//    //self.navigationController.navigationBar.backIndicatorImage = back;
//    
//    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:back forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    
//    [self.navigationController.navigationBar setFrame:CGRectMake(0, 0, 320, 107)];
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
