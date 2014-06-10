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
        
        [self.view.btnStart addTarget:self action:@selector(btnStartTapped :) forControlEvents:UIControlEventTouchUpInside];
        [self.view.btnBack addTarget:self action:@selector(btnBackTapped :) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)btnStartTapped:(id)sender{
    
    [self showCamera];
}

- (void)showCamera{
    
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
        
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.mediaTypes = availableMediaTypes;

    }else{
        
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:imagePicker animated:YES completion:^{}];
    imagePicker.delegate = self;
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    self.photo = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:YES completion:^{}];
    
    self.secondInfoVC = [[SecondInfoViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:self.secondInfoVC animated:YES];
}

- (void)btnBackTapped:(id)sender{    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[WerkenView alloc] initWithFrame:bounds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addEndDrawVC :) name:@"CALL_END_DRAW_VIEW_CONTROLLER" object:self.drawnImage];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(btnAgainTapped :) name:@"BTN_AGAIN_TAPPED" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(btnSaveTapped :) name:@"BTN_SAVE_TAPPED" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addDrawing :) name:@"ADD_DRAWING" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(btnTekenenTapped :) name:@"BTN_TEKENEN_TAPPED" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backToMenu :) name:@"BACK_TO_MENU" object:nil];
    
}

- (void)backToMenu:(id)sender{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    //MainViewController *mainVC = [[MainViewController alloc] initWithNibName:nil bundle:nil];
    //[self.navigationController pushViewController:mainVC animated:YES];
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
        [self.navigationController pushViewController:self.endDrawVC animated:YES];
    }
}

- (void)btnAgainTapped:(id)sender{
    self.drawingVC = [[DrawingViewController alloc] initWithNibName:nil bundle:nil];
    [self.drawingVC updateWithImage:self.photo];
    [self.navigationController pushViewController:self.drawingVC animated:YES];
}

- (void)btnSaveTapped:(id)sender{
    NSLog(@"Werken view controller - btn save tapped");
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
