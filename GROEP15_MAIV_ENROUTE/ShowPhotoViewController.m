//
//  ShowPhotoViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 07/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "ShowPhotoViewController.h"

@interface ShowPhotoViewController ()

@end

@implementation ShowPhotoViewController

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
    self.view = [[ShowPhotoView alloc] initWithFrame:bounds andImage:self.takenPhoto];
}

- (void)initWithImage:(UIImage *)image andId:(NSInteger)index{
    self.takenPhoto = image;
    self.buttonIndex = index;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view.btnTerugNaarVerhaal addTarget:self action:@selector(terugNaarVerhaalTapped :) forControlEvents:UIControlEventTouchUpInside];
    [self.view.btnRetake addTarget:self action:@selector(btnRetakeTapped :) forControlEvents:UIControlEventTouchUpInside];
}

- (void)terugNaarVerhaalTapped:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TERUG_NAAR_VERHAAL" object:nil];
}

- (void)btnRetakeTapped:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RETAKE_PHOTO" object:nil];
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
