//
//  MainZintuigViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Eva Pieters on 11/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "MainZintuigViewController.h"

@interface MainZintuigViewController ()

@end

@implementation MainZintuigViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.labels = [[NSMutableArray alloc] init];
        
        LabelData *lbl_1 = [LabelDataFactory createLabelWithText:@"Het is 10u, tijd voor een speciale opdracht." width:200 height:50 xPos:79 yPos:130];
        LabelData *lbl_2 = [LabelDataFactory createLabelWithText:@"Ga aan de hand van de kaart naar een kruispunt of rondpunt." width:265 height:50 xPos:36 yPos:lbl_1.yPos + lbl_1.height + 92];
        
        [self.labels addObjectsFromArray:@[lbl_1,lbl_2]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.mapVC = [[MapViewController alloc] initWithNibName:nil bundle:nil];
    self.uitleg2 = [[Uitleg2ViewController alloc] initMetSoortOpdracht:@"horen"];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wegdoen:) name:@"OP2_BTN_BACK" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showUitleg2:) name:@"OP2_AFRONDEN" object:nil];

    [self.view.navBar.btnBack addTarget:self action:@selector(btnBackTapped :) forControlEvents:UIControlEventTouchUpInside];
    [self.view.uitleg.btn_start addTarget:self action:@selector(btnStartTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnBackTapped:(id)sender{
    NSLog(@"btn back tapped");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)btnStartTapped:(id)sender{
    NSLog(@"btn start tapped");
//    [self.navigationController pushViewController:self.mapVC animated:YES];
}

-(void)showUitleg2:(id)sender{
    NSLog(@"uitleg 2 tonen");
    
    // hier moet er uit de database komen welke opdracht deze groep moet krijgen
    // en deze geven we hier mee
    
    
    //[self.navigationController popToViewController:self animated:YES];
    [self.navigationController pushViewController:self.uitleg2 animated:YES];
    
}

-(void)wegdoen:(id)sender{
    [self.navigationController popToViewController:self animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[MainZintuigView alloc] initWithFrame:bounds andLabels:self.labels];
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
