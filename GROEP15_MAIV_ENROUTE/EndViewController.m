//
//  EndViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 11/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "EndViewController.h"

@interface EndViewController ()

@end

@implementation EndViewController

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
    [self.view.btnRetake addTarget:self action:@selector(retakeTapped :) forControlEvents:UIControlEventTouchUpInside];
    [self.view.btnSave addTarget:self action:@selector(saveTapped :) forControlEvents:UIControlEventTouchUpInside];
    [self.view.navBar.btnBack addTarget:self action:@selector(btnBackTapped :) forControlEvents:UIControlEventTouchUpInside];

    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showDrawing :) name:@"SHOW_DRAWING" object:nil];
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[EndView alloc] initWithFrame:bounds videoUrl:self.videoUrl];
}

- (void)btnBackTapped:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"OP1_BACK_TAPPED" object:nil];
}

- (void)getVideo{
    
    self.moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:self.videoUrl];
    self.moviePlayerController.scalingMode = MPMovieScalingModeNone;
    
    //[self.moviePlayerController prepareToPlay];
    self.moviePlayerController.repeatMode = MPMovieRepeatModeOne;
    self.moviePlayerController.shouldAutoplay = YES;
    self.moviePlayerController.controlStyle = MPMovieControlStyleNone;
    //[self.moviePlayerController.view setFrame:self.view.frame];
    
    [self.moviePlayerController.view setFrame:CGRectMake(self.view.frame.size.width/2 - ((480/1.7)/2), 168, 480/1.7, 360/1.7)];
    
    //[self.moviePlayerController.view setBackgroundColor:[UIColor whiteColor]];
    
    self.moviePlayerController.backgroundView.backgroundColor = [UIColor clearColor];
    
    self.moviePlayerController.view.backgroundColor = [UIColor clearColor];
    
    for(UIView *aSubView in self.moviePlayerController.view.subviews) {
        aSubView.backgroundColor = [UIColor clearColor];
    }

    [self.view addSubview:self.moviePlayerController.view];
    [self.view sendSubviewToBack:self.moviePlayerController.view];
    
    [self.moviePlayerController play];
}

- (void)retakeTapped:(id)sender{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RETAKE_TAPPED" object:nil];
}

- (void)saveTapped:(id)sender{
    
    NSLog(@"save tapped");
    [self postVideoToDatabase];
    [self uploadDrawing];
}

- (void)postVideoToDatabase{
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSData *videoData = [NSData dataWithContentsOfURL:self.videoUrl];
    
    NSDictionary *parameters = @{@"dag_groep_id": [[NSUserDefaults standardUserDefaults] objectForKey:@"dag_groep_id"],
                                 @"groep_id" : [[NSUserDefaults standardUserDefaults] objectForKey:@"groep_id"],
                                 @"opdracht_id" : @6,
                                 @"opdracht_onderdeel_id" : @2
                                 };
    // buttons weghalen en vervangen
    [self.view removeButtons];
    [self.view.btnSave removeTarget:self action:@selector(saveTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.btnRetake removeTarget:self action:@selector(retakeTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [manager POST:@"http://student.howest.be/tim.beeckmans/20132014/MAIV/ENROUTE/uploads/index.php" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:videoData name:@"file" fileName:@"testvideoupload" mimeType:@"video/quicktime"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
        // bewaar en retake buttons weghalen & terug naar story button toevoegen
        [self.view changeButton];
        
        if(self.view.btn_story){
            [self.view.btn_story addTarget:self action:@selector(backToStory:) forControlEvents:UIControlEventTouchUpInside];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

-(void)backToStory:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"OP1_BACK_TO_MENU" object:self userInfo:nil];
}

- (void)uploadDrawing{
    UIImage *image = self.drawnImage;
    NSData *data = UIImagePNGRepresentation(image);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //manager.requestSerializer = [AFJSONRequestSerializer serializer];
    NSString *filename = @"IMG_2108.jpg";
    
    //alle extra info die in de database komt kan hierin...
    NSDictionary *parameters = @{@"dag_groep_id": [[NSUserDefaults standardUserDefaults] objectForKey:@"dag_groep_id"],
                                 @"groep_id" : [[NSUserDefaults standardUserDefaults] objectForKey:@"groep_id"],
                                 @"opdracht_id" : @6,
                                 @"opdracht_onderdeel_id" : @1
                                 };
    
    [manager POST:@"http://student.howest.be/tim.beeckmans/20132014/MAIV/ENROUTE/uploads/index.php" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:data name:@"file" fileName:filename mimeType:@"image/png"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

-(void)getVideoWithUrl:(NSURL *)videoURL{
    self.videoUrl = videoURL;
    [self getVideo];
}

- (void)getDrawingImage:(UIImage *)image{
    
    self.drawnImage = image;
    [self.view drawImage:image];
}

- (void)showDrawing:(NSNotification *) notification
{
    NSLog(@"end draw");
    
    if ([notification.name isEqualToString:@"SHOW_DRAWING"])
    {
        NSDictionary* userInfo = notification.userInfo;
        self.drawnImage = [userInfo objectForKey:@"drawnImage"];
        [self.view drawImage:self.drawnImage];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)viewWillDisappear:(BOOL)animated{
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"TIS_WEG" object:nil];
//}

//-(void)viewDidDisappear:(BOOL)animated{
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"TIS_WEG" object:nil];
//}


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
