//
//  GPSViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 09/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//
#import "GPSViewController.h"
#import "GPSEndViewController.h"
#import "AFNetworking.h"

@interface GPSViewController ()

@end

@implementation GPSViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.labels = [[NSMutableArray alloc] init];
        // labels aanmaken en pushen in array
        LabelData *lbl_1 = [LabelDataFactory createLabelWithText:@"Geef de iPhone door aan de persoon het verst van jou" width:170 height:100 xPos:100 yPos:100];
        LabelData *lbl_2 = [LabelDataFactory createLabelWithText:@"Tijd voor een beetje beweging!" width:250 height:40 xPos:40 yPos:275];
        LabelData *lbl_3 = [LabelDataFactory createLabelWithText:@"Laat de stad jou in beweging brengen door iedere richtingsaanwijzer die je ziet te volgen" width:200 height:100 xPos:40 yPos:330];
        LabelData *lbl_4 = [LabelDataFactory createLabelWithText:@"draai een rondje" width:130 height:30 xPos:65 yPos:535];
        LabelData *lbl_5 = [LabelDataFactory createLabelWithText:@"ga naar rechts" width:130 height:30 xPos:80 yPos:605];
        LabelData *lbl_6 = [LabelDataFactory createLabelWithText:@"wandel naar links" width:150 height:30 xPos:67 yPos:671];
        LabelData *lbl_7 = [LabelDataFactory createLabelWithText:@"Terwijl je wandelt, tekent de app jouw route. Hoe verder je wandelt hoe beter je dit zal zien!" width:280 height:100 xPos:20 yPos:813];
        
        
        [self.labels addObjectsFromArray:@[lbl_1, lbl_2, lbl_3, lbl_4, lbl_5, lbl_6, lbl_7]];
        
    }
    return self;
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[GPSView alloc] initWithFrame:bounds andLabels:self.labels];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.arrDrawingPoints = [NSMutableArray array];
    [self.view.uitleg.btn_start addTarget:self action:@selector(btnBeginnenTapped:) forControlEvents:UIControlEventTouchUpInside];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showShape :) name:@"SHOW_DRAWN_SHAPE" object:nil];    
}

- (void)showShape:(NSNotification *) notification{
    
    if ([notification.name isEqualToString:@"SHOW_DRAWN_SHAPE"])
    {
        NSLog(@"show shape");
        NSDictionary* userInfo = notification.userInfo;
        self.arrDrawingPoints = [userInfo objectForKey:@"arrDrawingPoints"];
        self.drawnImage = [userInfo objectForKey:@"drawnImage"];
        GPSEndViewController *endVC = [[GPSEndViewController alloc] initWithNibName:nil bundle:nil];
        [endVC showDrawnShape:self.arrDrawingPoints andImage:self.drawnImage];
        [self.navigationController pushViewController:endVC animated:YES];
    }
}

- (void)btnBeginnenTapped:(id)sender{

    NSLog(@"tap");
    MapViewController *mapVC = [[MapViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:mapVC animated:YES completion:^{}];
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
