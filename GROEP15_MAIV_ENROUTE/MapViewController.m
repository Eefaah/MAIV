//
//  MapViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 09/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

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
    self.view = [[MapView alloc] initWithFrame:bounds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view.endTrackingButton addTarget:self action:@selector(endTrackingTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view.
     startTrackingBtn addTarget:self action:@selector(startTrackingTapped :) forControlEvents:UIControlEventTouchUpInside];

}

- (void)startTrackingTapped:(id)sender{
    
    [self.view.startTrackingBtn removeTarget:self action:@selector(startTrackingTapped :) forControlEvents:UIControlEventTouchUpInside];
    [self.view.startTrackingBtn removeFromSuperview];
    
    self.view.startPoint = self.view.mapView.userLocation.location.coordinate;
    
    self.view.arrPoints = [NSMutableArray array];
    [self.view.arrPoints addObject:[[CLLocation alloc] initWithLatitude:self.view.startPoint.latitude longitude:self.view.startPoint.longitude]];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(doSometingOnTimeInterval) userInfo:nil repeats:YES];
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(self.view.mapView.userLocation.coordinate.latitude, self.view.mapView.userLocation.coordinate.longitude);
    
    // dit is in feite het zoom level van de map //
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000);
    [self.view.mapView setRegion:region animated:true];
    self.view.mapView.scrollEnabled = NO;
    self.view.mapView.zoomEnabled = NO;
    self.view.mapView.rotateEnabled = NO;
    
    [self.view addSubview:self.view.endTrackingButton];
}

- (void)doSometingOnTimeInterval{
    
    CLLocation *updatedLocation = [[CLLocation alloc] initWithLatitude:self.view.mapView.userLocation.coordinate.latitude longitude:self.view.mapView.userLocation.coordinate.longitude];
    [self.view.arrPoints addObject:updatedLocation];
    [self.view drawPolyline];
}

- (void)endTrackingTapped:(id)sender{
    NSLog(@"end tracking tapped - vc");
    
    [self.view endTracking];
    
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    [userInfo setObject:self.view.arrDrawingPoints forKey:@"arrDrawingPoints"];
    [userInfo setObject:self.view.tempDrawImage.image forKey:@"drawnImage"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SHOW_DRAWN_SHAPE" object:self userInfo:userInfo];
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
