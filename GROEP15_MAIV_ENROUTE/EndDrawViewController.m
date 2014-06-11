//
//  EndDrawViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 06/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "EndDrawViewController.h"
#import <AFNetworking.h>

@interface EndDrawViewController ()

@end

@implementation EndDrawViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andImage:(UIImage *)drawnImage
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.drawnImage = drawnImage;
        
        self.arrDrawings = [NSMutableArray array];
    }
    return self;
}

- (void)btnAgainTapped:(id)sender{
    
    //[self dismissViewControllerAnimated:YES completion:^{}];
    //[self.navigationController popViewControllerAnimated:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BTN_AGAIN_TAPPED" object:nil];
}

- (void)btnSaveTapped:(id)sender{
    
    //added this; might cause problems
    //[self dismissViewControllerAnimated:YES completion:^{}];
    //[self.navigationController popViewControllerAnimated:YES];
    [self uploadPost];
}

- (void)uploadPost{
    UIImage *image = self.view.drawnImage;
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *filename = @"IMG_2108.jpg";
    
    //alle extra info die in de database komt kan hierin...
    NSDictionary *parameters = @{@"dag_groep_id": @1,
                                 @"groep_id" : @1,
                                 @"opdracht_id" : @7,
                                 @"opdracht_onderdeel_id" : @0
                                };
    
    [manager POST:@"http://student.howest.be/tim.beeckmans/20132014/MAIV/ENROUTE/uploads/index.php" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:data name:@"file" fileName:filename mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"BTN_SAVE_TAPPED" object:nil];
        NSLog(@"Success: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[EndDrawView alloc] initWithFrame:bounds andImage:self.drawnImage];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view.navBar.btnBack addTarget:self action:@selector(btnBackTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.btnAgain addTarget:self action:@selector(btnAgainTapped :) forControlEvents:UIControlEventTouchUpInside];
    [self.view.btnOk addTarget:self action:@selector(btnSaveTapped :) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnBackTapped:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"OP7_BTN_BACK" object:nil];
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
