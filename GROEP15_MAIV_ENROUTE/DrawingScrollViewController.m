//
//  DrawingScrollViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 06/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "DrawingScrollViewController.h"
#import "DrawingViewController.h"
#import "AFNetworking/AFNetworking.h"

@interface DrawingScrollViewController ()

@end

@implementation DrawingScrollViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.arrDrawings = [[NSMutableArray alloc] init];
        [self getAPI];
        //[self getAPIAFNetworking];
    }
    return self;
}

- (void)getAPI{
    
    self.arrImagePaths = [NSMutableArray array];
    
    NSString *groep_id = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"groep_id"]];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://student.howest.be/tim.beeckmans/20132014/MAIV/ENROUTE/api/uploads/opdracht/%@/%i", groep_id, 7]]];
    NSError *error = nil;
    NSArray *loadedData = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    
    if (!error){
        
        for (NSDictionary *dict in loadedData){
            
            [self.arrImagePaths addObject:dict[@"url"]];
        }
    }
    
    [self getImagePaths];
}

- (void)getImagePaths{
    
    for(NSString *path in self.arrImagePaths){
        self.imagePath = path;
        
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:[NSString stringWithFormat:@"http://student.howest.be/tim.beeckmans/20132014/MAIV/ENROUTE/uploads/%@", self.imagePath]]];
        
        NSLog(@"imagedata = %@",imageData);
        NSLog(@"image path : %@", self.imagePath);
        
        UIImage *image = [UIImage imageWithData: imageData];
        
        NSLog(@"image : %@", image);
        
        [self.arrDrawings addObject:image];
        
        //[self.view getImagesFromServer:image];
    }
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[DrawingScrollView alloc] initWithFrame:bounds andArray:self.arrDrawings];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view.navBar.btnBack addTarget:self action:@selector(btnBackTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.btnAdd addTarget:self action:@selector(btnOkTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.btnOk addTarget:self action:@selector(btnAddTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnBackTapped:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"OP7_BTN_BACK_TO_FIRST" object:nil];
}

- (void)btnAddTapped:(id)sender{
    
    //[self dismissViewControllerAnimated:YES completion:^{}];
    //[self.navigationController popViewControllerAnimated:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ADD_DRAWING" object:nil];
}

- (void)btnOkTapped:(id)sender{
    
    //[self dismissViewControllerAnimated:YES completion:^{}];
    //[self.navigationController popViewControllerAnimated:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BACK_TO_MENU" object:self userInfo:nil];
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
