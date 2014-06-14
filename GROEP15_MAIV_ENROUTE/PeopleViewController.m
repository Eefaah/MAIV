//
//  PeopleViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 07/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "PeopleViewController.h"

@interface PeopleViewController ()


@end

@implementation PeopleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.labels = [[NSMutableArray alloc] init];
        
        LabelData *lbl_1 = [LabelDataFactory createLabelWithText:@"Geef de iPhone door naar de persoon rechts van jou" width:180 height:100 xPos:95 yPos:100];
        LabelData *lbl_2 = [LabelDataFactory createLabelWithText:@"Ga opzoek naar mensen van verschillende origine in de stad" width:240 height:45 xPos:40 yPos:lbl_1.yPos + lbl_1.height + 138];
        
        LabelData *lbl_3 = [LabelDataFactory createLabelWithText:@"en vraag hen of je een foto mag nemen." width:199 height:45 xPos:93 yPos:lbl_2.yPos + lbl_2.height + 19];
        
        LabelData *lbl_4 = [LabelDataFactory createLabelWithText:@"Fotografeer zo vier mensen van een verschillende origine." width:177 height:67 xPos:108 yPos:lbl_3.yPos + lbl_3.height + 98];
        
        [self.labels addObjectsFromArray:@[lbl_1,lbl_2,lbl_3,lbl_4]];
    }
    return self;
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[PeopleView alloc] initWithFrame:bounds andLabels:self.labels];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view.uitleg.btn_start addTarget:self action:@selector(btnStartTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.navBar.btnBack addTarget:self action:@selector(btnBackTapped:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnStartTapped:(id)sender{
    self.photoOverviewVC = [[PhotoOverviewViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:self.photoOverviewVC animated:YES];
}

-(void)btnBackTapped:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
