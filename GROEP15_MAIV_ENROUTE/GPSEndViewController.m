//
//  EndViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 09/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "GPSEndViewController.h"
#import "AFNetworking/AFNetworking.h"

@interface GPSEndViewController ()

@end

@implementation GPSEndViewController

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
    self.view = [[GPSEndView alloc] initWithFrame:bounds andArr:self.arrDrawingPoints];
    
    [self.view.btnSave addTarget:self action:@selector(saveButtonTapped :) forControlEvents:UIControlEventTouchUpInside];
}

- (void)saveButtonTapped:(id)sender{
    
    [self uploadPost];
}

- (void)showDrawnShape:(NSMutableArray *)arr andImage:(UIImage *)image{
    
    self.arrDrawingPoints = arr;
    self.drawnImage = image;
    [self addPointToDB];
    
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

- (void)addPointToDB{
    self.pointsAsString = [[NSMutableString alloc] initWithString:@""];
    for(NSValue *p in self.arrDrawingPoints){
        CGPoint point = [p CGPointValue];
        
        NSString *xpos = [NSString stringWithFormat:@"%f",point.x];
        NSString *ypos = [NSString stringWithFormat:@"%f",point.y];

        NSString *tempstring = [NSString stringWithFormat:@"%@,%@",xpos,ypos];
        
        [self.pointsAsString appendString:[NSString stringWithFormat:@"%@;",tempstring]];
        
    }
}

- (void)uploadPost{
    
    UIImage *image = self.drawnImage;
    NSData *data = UIImagePNGRepresentation(image);
    
    NSLog(@"%@", image);
    NSLog(@"%@", data);
    NSLog(@"%@", self.pointsAsString);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSLog(@"user defaukts dag groep id = %@",[[NSUserDefaults standardUserDefaults] objectForKey:@"dag_groep_id"]);
    NSLog(@"user defaults groep id =  %@",[[NSUserDefaults standardUserDefaults] objectForKey:@"groep_id"]);

    //alle extra info die in de database komt kan hierin...
    NSDictionary *parameters = @{@"dag_groep_id": [[NSUserDefaults standardUserDefaults] objectForKey:@"dag_groep_id"],
                                 @"groep_id" : [[NSUserDefaults standardUserDefaults] objectForKey:@"groep_id"],
                                 @"opdracht_id" : @5,
                                 @"opdracht_onderdeel_id" : @0,
                                 @"tekst": self.pointsAsString
                                 };
    NSLog(@"hier komt hij nog");
    
    [manager POST:@"http://student.howest.be/tim.beeckmans/20132014/MAIV/ENROUTE/uploads/index.php" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:data name:@"file" fileName:@"fileName" mimeType:@"image/png"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"BTN_SAVE_TAPPED" object:nil];
        NSLog(@"Success: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
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
