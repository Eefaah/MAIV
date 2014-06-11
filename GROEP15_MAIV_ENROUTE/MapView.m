//
//  MapView.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Eva Pieters on 11/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "MapView.h"

@implementation MapView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // map aanmaken
        self.mapView = [[MKMapView alloc] initWithFrame:frame];
        [self addSubview:self.mapView];
        
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(50.823512,3.260430);
        
        self.mapView.region = MKCoordinateRegionMakeWithDistance(coordinate, 2500, 2500);
        
        // current location aanduiden
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = 1;
        self.locationManager.activityType = CLActivityTypeOther;
        [self.locationManager startUpdatingLocation];
        
        // annotation voor het buda
        AnnotationObject *buda = [[AnnotationObject alloc] init];
        buda.title = @"Buda";
        buda.subtitle = @"Verzamelplaats";
        buda.coordinate = CLLocationCoordinate2DMake(50.830608, 3.26477);
        [self.mapView addAnnotation:buda];
        
        // button naar de volgende opdracht
        UIImage *wezijnerImage = [UIImage imageNamed:@"btn_wezijner"];
        
        self.btn_wezijner = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btn_wezijner setBackgroundImage:wezijnerImage forState:UIControlStateNormal];
        self.btn_wezijner.frame = CGRectMake(self.frame.size.width/2 - wezijnerImage.size.width/2, 450, wezijnerImage.size.width, wezijnerImage.size.height);
        [self addSubview:self.btn_wezijner];
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    NSLog(@"StoreView [did update location]");
    self.mapView.showsUserLocation = YES;
    //NSLog(@"locatie = %@",locations);
    
    CLLocation *loc = [locations lastObject];
    
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(loc.coordinate, 500, 500) animated:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
