//
//  SecondInfoViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 06/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "SecondInfoViewController.h"

@interface SecondInfoViewController ()

@end

@implementation SecondInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.labels = [[NSMutableArray alloc] init];
        
        LabelData *lbl_1 = [LabelDataFactory createLabelWithText:@"Bespreek de werken met je vrienden." width:190 height:50 xPos:97 yPos:120];
        LabelData *lbl_2 = [LabelDataFactory createLabelWithText:@"“Waarom moest het oude gebouw weg?”" width:185 height:70 xPos:107 yPos:lbl_1.yPos + lbl_1.height + 97];
        LabelData *lbl_3 = [LabelDataFactory createLabelWithText:@"“Wat zouden ze aan het bouwen zijn?”" width:185 height:70 xPos:107 yPos:lbl_2.yPos + lbl_2.height + 5];
        LabelData *lbl_4 = [LabelDataFactory createLabelWithText:@"Teken nu al jullie ideeen op de foto" width:185 height:70 xPos:43 yPos:lbl_3.yPos + lbl_3.height + 92];
        
        [self.labels addObjectsFromArray:@[lbl_1,lbl_2,lbl_3,lbl_4]];
    }
    return self;
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[SecondInfoView alloc] initWithFrame:bounds andLabels:self.labels];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view.navBar.btnBack addTarget:self action:@selector(btnBackTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.uitleg.btn_start addTarget:self action:@selector(btnTekenenTapped:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

- (void)btnBackTapped:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"OP7_BTN_BACK_TO_FIRST" object:nil];
}

- (void)btnTekenenTapped:(id)sender{
    
    //[self.navigationController popViewControllerAnimated:YES ];
    //[self dismissViewControllerAnimated:YES completion:^{}];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"OP7_BTN_TEKENEN" object:nil];
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
