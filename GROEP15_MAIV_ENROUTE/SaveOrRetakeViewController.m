//
//  SaveOrRetakeViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Eva Pieters on 10/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "SaveOrRetakeViewController.h"

@interface SaveOrRetakeViewController ()

@end

@implementation SaveOrRetakeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        // hier de video tonen en vragen om te retaken of op te slaan
        
        // bij opslaan pas de code die nu gewoon hier staat uitvoeren
        
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"VIDEO_SAVED" object:self];
        
                AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
                NSDictionary *parameters = @{@"dag_groep_id": @1,
                                             @"groep_id" : @1,
                                             @"opdracht_id" : @2,
                                             @"opdracht_onderdeel_id" : @0
                                             };
        
                [manager POST:@"http://student.howest.be/tim.beeckmans/20132014/MAIV/ENROUTE/uploads/index.php" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                    [formData appendPartWithFileData:self.videoData name:@"file" fileName:@"testvideoupload" mimeType:@"video/quicktime"];

                } success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    
                    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
                    [userInfo setObject:responseObject forKey:@"videoURL"];
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"VIDEO_SAVED" object:self userInfo:userInfo];
                    
                    //NSLog(@"Success: %@", responseObject);
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    NSLog(@"Error: %@", error);
                }];
    }
    return self;
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

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[SaveOrRetakeView alloc] initWithFrame:bounds];
}

-(id)initWithData:(NSData *)videoData{
    self.videoData = videoData;
    NSLog(@"videodata in save vc = %@",self.videoData);
    
    return [self initWithNibName:nil bundle:nil];
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
