//
//  WerkenViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 05/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "WerkenViewController.h"
#import "MainViewController.h"

@interface WerkenViewController ()

@end

@implementation WerkenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.labels = [[NSMutableArray alloc] init];
        
        LabelData *lbl_1 = [LabelDataFactory createLabelWithText:@"Geef de iPhone door naar links!" width:200 height:50 xPos:93 yPos:132];
        LabelData *lbl_2 = [LabelDataFactory createLabelWithText:@"Ga op zoek naar een bouwwerf in de stad en fotografeer ze" width:185 height:70 xPos:109 yPos:lbl_1.yPos + lbl_1.height + 111];
        
        [self.labels addObjectsFromArray:@[lbl_1,lbl_2]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view.uitleg.btn_start addTarget:self action:@selector(btnStartTapped :) forControlEvents:UIControlEventTouchUpInside];
    [self.view.navBar.btnBack addTarget:self action:@selector(btnBackTapped :) forControlEvents:UIControlEventTouchUpInside];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addEndDrawVC :) name:@"CALL_END_DRAW_VIEW_CONTROLLER" object:self.drawnImage];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(btnAgainTapped :) name:@"BTN_AGAIN_TAPPED" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(btnSaveTapped :) name:@"OP7_BTN_SAVE" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(btnAgainTapped:) name:@"ADD_DRAWING" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(btnTekenenTapped :) name:@"OP7_BTN_TEKENEN" object:nil];
    
    // terug knop uit EndDraw
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backToSecond:) name:@"OP7_BTN_BACK" object:nil];
    
    // terug knop uit Second en scrollview
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backToFirst:) name:@"OP7_BTN_BACK_TO_FIRST" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backToMenu:) name:@"BACK_TO_MENU" object:nil];
    
    // knoppen uit save or retake scherm
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteRetakeScreen:) name:@"OP7_RETAKE_TAPPED" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showSecondScreen:) name:@"OP7_USE_TAPPED" object:nil];

}

-(void)backToSecond:(id)sender{
    [self.navigationController popToViewController:self.secondInfoVC animated:YES];
}

-(void)backToFirst:(id)sender{
    [self.navigationController popToViewController:self animated:YES];
    if(self.saveOrRetakeVC){
        self.saveOrRetakeVC = nil;
    }
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[WerkenView alloc] initWithFrame:bounds andLabels:self.labels];
}

- (void)btnStartTapped:(id)sender{
    
    [self showCamera];
}

- (void)showCamera{
    
    self.imagePicker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        //NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
        self.imagePicker.view.frame = self.view.frame;
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.imagePicker.mediaTypes = [NSArray arrayWithObject:@"public.image"];
        self.photoPickerView = [[CustomPhotoPicker alloc] initWithFrame:self.imagePicker.view.frame andFaceOverlay:NO];
        self.imagePicker.cameraOverlayView = self.photoPickerView;
        
        CGSize screenSize = [[UIScreen mainScreen] bounds].size;   // 320 x 568
        
        float scale = screenSize.height / screenSize.width*3/4;  // screen height divided by the pickerController height
        
        CGAffineTransform translate=CGAffineTransformMakeTranslation(0,(screenSize.height - screenSize.width*4/3)*0.5);
        CGAffineTransform fullScreen=CGAffineTransformMakeScale(scale, scale);
        self.imagePicker.cameraViewTransform =CGAffineTransformConcat(fullScreen, translate);
        
//        // Device's screen size (ignoring rotation intentionally):
//        CGSize screenSize = [[UIScreen mainScreen] bounds].size;
//        
//        // iOS is going to calculate a size which constrains the 4:3 aspect ratio
//        // to the screen size. We're basically mimicking that here to determine
//        // what size the system will likely display the image at on screen.
//        // NOTE: screenSize.width may seem odd in this calculation - but, remember,
//        // the devices only take 4:3 images when they are oriented *sideways*.
//        float cameraAspectRatio = 4.0 / 3.0;
//        float imageWidth = floorf(screenSize.width * cameraAspectRatio);
//        float scale = ceilf((screenSize.height / imageWidth) * 10.0) / 10.0;
//        
//        self.imagePicker.cameraViewTransform = CGAffineTransformMakeScale(scale, scale);
        
        //self.imagePicker.cameraViewTransform = CGAffineTransformMakeRotation(M_PI);
//        self.photoPickerView = [[CustomPhotoPicker alloc] initWithFrame:self.imagePicker.view.frame];
        
        self.imagePicker.allowsEditing = YES;
        self.imagePicker.showsCameraControls = NO;
//        self.imagePicker.cameraOverlayView = self.photoPickerView;
        
//        [self.photoPickerView.btn_foto addTarget:self action:@selector(takePicture:) forControlEvents:UIControlEventTouchUpInside];
        
    }else{
        
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:self.imagePicker animated:YES completion:^{
        
        [self.photoPickerView.btn_foto addTarget:self action:@selector(takePicture:) forControlEvents:UIControlEventTouchUpInside];
        if(self.saveOrRetakeVC){
            NSLog(@"we zijn in de self");
            [self.navigationController popViewControllerAnimated:NO];
            self.saveOrRetakeVC = nil;
        }
    }];
    self.imagePicker.delegate = self;
    
}

-(void)takePicture:(id)sender{
    NSLog(@"take picture");
    [self.imagePicker takePicture];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    self.photo = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    // use photo of retake
    
    // zorgen dat het scherm er achter al klaar staat :)
    self.saveOrRetakeVC = [[SaveOrRetakeImageViewController alloc] initWithImage:self.photo];
    [self.navigationController pushViewController:self.saveOrRetakeVC animated:NO];
    
    [self.imagePicker dismissViewControllerAnimated:YES completion:^{}];
    
//    self.secondInfoVC = [[SecondInfoViewController alloc] initWithNibName:nil bundle:nil];
//    [self.navigationController pushViewController:self.secondInfoVC animated:YES];
}

-(void)deleteRetakeScreen:(id)sender{
    //[self.navigationController popViewControllerAnimated:YES];
    NSLog(@"deleteRetakeScreen -- na poppen retakeVC = %@",self.saveOrRetakeVC);
    //self.saveOrRetakeVC = nil;
    [self showCamera];
}

-(void)showSecondScreen:(id)sender{
    // remove save or retake
    //[self.navigationController popViewControllerAnimated:YES];
    
    self.imagePicker = nil;
    self.photoPickerView = nil;
    
    self.secondInfoVC = [[SecondInfoViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:self.secondInfoVC animated:YES];
    
    self.saveOrRetakeVC = nil;
    NSLog(@"[WerkenVC] show second screen -- na poppen retakeVC = %@",self.saveOrRetakeVC);
}

- (void)btnBackTapped:(id)sender{
    NSLog(@"btnBackTapped");
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)backToMenu:(id)sender{
    NSLog(@"back to menu");
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)btnTekenenTapped:(id)sender{
    NSLog(@"add drawing screen");
    self.drawingVC = [[DrawingViewController alloc] initWithNibName:nil bundle:nil];
    [self.drawingVC updateWithImage:self.photo];
    [self.navigationController pushViewController:self.drawingVC animated:YES];
}

- (void)addEndDrawVC:(NSNotification *) notification
{
    NSLog(@"end draw");

    if ([notification.name isEqualToString:@"CALL_END_DRAW_VIEW_CONTROLLER"])
    {
        NSDictionary* userInfo = notification.userInfo;
        self.drawnImage = [userInfo objectForKey:@"drawnImage"];
        self.endDrawVC = [[EndDrawViewController alloc] initWithNibName:nil bundle:nil andImage:self.drawnImage];
        //[self.navigationController popViewControllerAnimated:YES];
        [self.navigationController pushViewController:self.endDrawVC animated:YES];
    }
}

- (void)btnAgainTapped:(id)sender{
    //self.drawingVC = [[DrawingViewController alloc] initWithNibName:nil bundle:nil];
    //[self.drawingVC updateWithImage:self.photo];
    //[self.navigationController pushViewController:self.drawingVC animated:YES];
    self.drawingVC = [[DrawingViewController alloc] initWithNibName:nil bundle:nil];
    [self.drawingVC updateWithImage:self.photo];
    [self.navigationController pushViewController:self.drawingVC animated:NO];
    [self.navigationController popToViewController:self.drawingVC animated:YES];
}

- (void)btnSaveTapped:(id)sender{
    NSLog(@"Werken view controller - save succes");
    self.drawingScrollVC = [[DrawingScrollViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:self.drawingScrollVC animated:YES];
}

- (void)addDrawing:(id)sender{
    self.drawingVC = [[DrawingViewController alloc] initWithNibName:nil bundle:nil];
    [self.drawingVC updateWithImage:self.photo];
    [self.navigationController pushViewController:self.drawingVC animated:YES];
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
