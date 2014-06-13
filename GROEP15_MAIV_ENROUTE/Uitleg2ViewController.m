//
//  Uitleg2ViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Eva Pieters on 11/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "Uitleg2ViewController.h"

@interface Uitleg2ViewController ()

@end

@implementation Uitleg2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.labels = [[NSMutableArray alloc] init];
        
        LabelData *lbl_1 = [LabelDataFactory createLabelWithText:@"Jullie groep kreeg het zintuig" width:250 height:50 xPos:32 yPos:100];
        LabelData *lbl_2 = [LabelDataFactory createLabelWithText:@"Neem nu de geluiden van het verkeer aan dit kruispunt of rondpunt op." width:252 height:72 xPos:32 yPos:lbl_1.yPos + lbl_1.height + 120];
        
        [self.labels addObjectsFromArray:@[lbl_1,lbl_2]];
    }
    return self;
}

-(id)initMetSoortOpdracht:(NSString *)opdracht{
    self.opdracht = opdracht;
    return [self initWithNibName:nil bundle:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view.navBar.btnBack addTarget:self action:@selector(btnBackTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    // btn start opvangen

}

// functoe van btn start
// checken welke view controller en view moeten worden getoond (juiste opdrahct)

-(void)btnBackTapped:(id)sender{
    // notification uitzende naar MainZintuigVC
    [[NSNotificationCenter defaultCenter] postNotificationName:@"OP2_BTN_BACK" object:self userInfo:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[Uitleg2View alloc] initWithFrame:bounds andLabels:self.labels andOpdracht:self.opdracht];
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
