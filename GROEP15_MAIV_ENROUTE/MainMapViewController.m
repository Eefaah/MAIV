//
//  MainMapViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Eva Pieters on 15/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "MainMapViewController.h"

@interface MainMapViewController ()

@end

@implementation MainMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view.btnBack addTarget:self action:@selector(backToStory:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)backToStory:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MAP_BACK_TO_STORY" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[MainMapView alloc] initWithFrame:bounds];
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
