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
    }
    return self;
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[SecondInfoView alloc] initWithFrame:bounds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view.btnTekenen addTarget:self action:@selector(btnTekenenTapped :) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnTekenenTapped:(id)sender{
    
    //deze zou nog gepopped moeten worden maar dit blijkt momenteel niet ter werken ...
    //[self.navigationController popViewControllerAnimated:YES ];
    //[self dismissViewControllerAnimated:YES completion:^{}];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BTN_TEKENEN_TAPPED" object:nil];
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
