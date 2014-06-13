//
//  RegisterViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 04/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "RegisterViewController.h"
#import "AFNetworking.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

//        [self getColorsForDay];
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
        NSDictionary *parameters = @{@"kleur_id": [NSString stringWithFormat:@"%i", self.colorId],
                                     @"dagGroepId": [NSNumber numberWithInt:self.dagGroepId]
                                     };
        
        NSString *api = @"http://student.howest.be/tim.beeckmans/20132014/MAIV/ENROUTE/api/groepen/";
        
        [manager POST:api parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"JSON: %@", responseObject);
            [[NSUserDefaults standardUserDefaults] setObject:responseObject[@"dag_groep_id"] forKey:@"dag_groep_id"];
            [[NSUserDefaults standardUserDefaults] setObject:responseObject[@"id"] forKey:@"groep_id"];
            [[NSUserDefaults standardUserDefaults] setObject:responseObject[@"kleur_id"] forKey:@"kleur_id"];
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isUserRegistered"];
            [self dismissViewControllerAnimated:YES completion:^{}];

        }failure:^(AFHTTPRequestOperation *operation, NSError *error){
            NSLog(@"Error: %@", error);
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isUserRegistered"];
        }];
        
            [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)colorButtonTapped:(id)sender{
    
    self.colorId = [sender tag];
}

- (void)getColorsForDay{
    NSLog(@"get colors for day");
    
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://student.howest.be/tim.beeckmans/20132014/MAIV/ENROUTE/api/dagGroepen/care/vandaag"]]];
    NSError *error = nil;
    NSDictionary *loadedData = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];

    NSDictionary *correctData = [loadedData objectForKey:@"groepen"];
    self.dagGroepId = [[loadedData objectForKey:@"id"] integerValue];
    
    for (NSDictionary *dict in correctData){
        [self.arrKleurIds addObject:dict[@"kleur_id"]];
    }
    
    for(NSNumber *i in self.arrKleurIds){
        UIButton *colorButton = [self.view.arrColorButtons objectAtIndex:[i integerValue]-1];
        colorButton.enabled = NO;
    }
}

- (void)loadView{
    NSLog(@"loadview");
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[RegisterView alloc] initWithFrame:bounds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"view did load");
    
    for(UIButton *colorBtn in self.view.arrColorButtons){
        
        [colorBtn addTarget:self action:@selector(colorButtonTapped :) forControlEvents:UIControlEventTouchUpInside];
    }
    
    self.arrKleurIds = [NSMutableArray array];
    
    // Do any additional setup after loading the view.
    //[[NSUserDefaults standardUserDefaults] synchronize];
    [self getColorsForDay];
    [self.view.btn_start addTarget:self action:@selector(btnStartTapped :) forControlEvents:UIControlEventTouchUpInside];

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
