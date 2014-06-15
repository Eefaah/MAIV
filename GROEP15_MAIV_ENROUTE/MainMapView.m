//
//  MainMapView.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Eva Pieters on 15/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "MainMapView.h"

@implementation MainMapView

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
