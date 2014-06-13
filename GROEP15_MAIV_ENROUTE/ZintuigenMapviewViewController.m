//
//  ZintuigenMapviewViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 13/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "ZintuigenMapviewViewController.h"

@interface ZintuigenMapviewViewController ()

@end

@implementation ZintuigenMapviewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[ZintuigenMapviewView alloc] initWithFrame:bounds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.view.btn_wezijner addTarget:self action:@selector(btnWeZijnErTapped :) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnWeZijnErTapped:(id)sender{
    
    if([[NSUserDefaults standardUserDefaults]  objectForKey:@"gekozenPunt"]){
        [self.view placeAnnotationForUserDefaults];
    }else{
        [self.view placeAnnotationOnCurrentLocation];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:[[CLLocation alloc] initWithLatitude:self.view.mapView.userLocation.coordinate.latitude longitude:self.view.mapView.userLocation.coordinate.longitude] forKey:@"gekozenPunt"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"OP2_AFRONDEN" object:self userInfo:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
