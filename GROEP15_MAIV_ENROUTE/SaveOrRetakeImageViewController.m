//
//  SaveOrRetakeImageViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Eva Pieters on 12/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "SaveOrRetakeImageViewController.h"

@interface SaveOrRetakeImageViewController ()

@end

@implementation SaveOrRetakeImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"SaveOrRetake VC init -- photo =  %@",self.photo);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view.btn_retake addTarget:self action:@selector(retakeTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.btn_use addTarget:self action:@selector(useTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.navBar.btnBack addTarget:self action:@selector(btnBackTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnBackTapped:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"OP7_BTN_BACK_TO_FIRST" object:nil];
}

- (void)retakeTapped:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"OP7_RETAKE_TAPPED" object:nil];
}

- (void)useTapped:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"OP7_USE_TAPPED" object:nil];
}

-(id)initWithImage:(UIImage *)photo{
    self.photo = photo;
    return [self initWithNibName:nil bundle:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[SaveOrRetakeImageView alloc] initWithFrame:bounds andImage:self.photo];
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
