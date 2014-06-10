//
//  RegisterViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 04/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "RegisterViewController.h"
#import <AFNetworking.h>

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        for(UIButton *colorBtn in self.view.arrColorButtons){
            
            [colorBtn addTarget:self action:@selector(colorButtonTapped :) forControlEvents:UIControlEventTouchUpInside];
        }
        
        [self.view.btn_start addTarget:self action:@selector(btnStartTapped :) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (instancetype)initWithBounds:(CGRect)bounds{
    
    self.bounds = bounds;
    
    return [self initWithNibName:nil bundle:nil];
}

- (void)btnStartTapped:(id)sender{
    
    NSLog(@"funct");
    if(self.colorId){
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        NSDictionary *parameters = @{@"kleur_id": [NSString stringWithFormat:@"%i", self.colorId], @"dagGroepId": @"1"};
        NSString *api = @"http://student.howest.be/tim.beeckmans/20132014/MAIV/ENROUTE/api/groepen/";
        
        [manager POST:api parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"JSON: %@", responseObject);
        }failure:^(AFHTTPRequestOperation *operation, NSError *error){
            NSLog(@"Error: %@", error);
        }];
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isUserRegistered"];
        [self dismissViewControllerAnimated:YES completion:^{}];
    

    }
}

- (void)colorButtonTapped:(id)sender{
    
    self.colorId = [sender tag];
    
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[RegisterView alloc] initWithFrame:bounds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
