//
//  WerkenViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 05/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "WerkenViewController.h"

@interface WerkenViewController ()

@end

@implementation WerkenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        [self.view.btnStart addTarget:self action:@selector(btnStartTapped :) forControlEvents:UIControlEventTouchUpInside];
        [self.view.navBar.btnBack addTarget:self action:@selector(btnBackTapped :) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)btnStartTapped:(id)sender{
    
    [self showCamera];
}

- (void)showCamera{
    
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
        
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.mediaTypes = availableMediaTypes;

    }else{
        
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:imagePicker animated:YES completion:^{}];
    imagePicker.delegate = self;
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:YES completion:^{}];
    
    self.drawingVC = [[DrawingViewController alloc] initWithNibName:nil bundle:nil andImage:image];
    [self.navigationController pushViewController:self.drawingVC animated:YES];
    
    NSLog(@"klaaaar");
}

- (void)btnBackTapped:(id)sender{    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[WerkenView alloc] initWithFrame:bounds];
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
