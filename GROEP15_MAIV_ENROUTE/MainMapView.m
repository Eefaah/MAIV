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
        self.mapView.delegate = self;
        
        // btn om terug nr het verhaal te gaan
        UIImage *btn_backToMap = [UIImage imageNamed:@"btn_backToMap"];
        
        self.btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btnBack setBackgroundImage:btn_backToMap forState:UIControlStateNormal];
        self.btnBack.frame = CGRectMake(9, 20, btn_backToMap.size.width, btn_backToMap.size.height);
        [self addSubview:self.btnBack];
        
    }
    return self;
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    NSLog(@"mapView viewForAnnotation delegate");
    
    NSString static *identifier = @"PinAnnotationView";
    
    NSLog(@"annotation die binnenkomt = %@", annotation);
    
    MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    if(!annotationView){
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.canShowCallout = YES;
    }
    
    if([annotation isKindOfClass:[MKUserLocation class]]){
        self.userloc = annotation;
        NSLog(@"self.userloc.coordinate = %f",self.userloc.coordinate.latitude);
        annotationView.image = [UIImage imageNamed:@"currentLocationAnnotation"];
        annotationView.annotation = annotation;
        
        // overlay current location
        MKCircle *circleOverlay = [MKCircle circleWithCenterCoordinate:self.userloc.coordinate radius:70];
        [self.mapView addOverlay:circleOverlay];
    }else{
        annotationView.image = [UIImage imageNamed:@"pinAnnotation"];
        annotationView.annotation = annotation;
    }
    
    return annotationView;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    NSLog(@"StoreView [did update location]");
    self.mapView.showsUserLocation = YES;
    //NSLog(@"locatie = %@",locations);
    
    CLLocation *loc = [locations lastObject];
    
    //CLLocationCoordinate2D *coordinate = (__bridge CLLocationCoordinate2D *)loc;
    
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(loc.coordinate, 500, 500) animated:YES];
}

-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    MKCircleRenderer *renderer = [[MKCircleRenderer alloc] initWithCircle:overlay];
    //renderer.alpha = 0.1;
    renderer.fillColor = [UIColor colorWithRed:240/255.0f green:131/255.0f blue:64/255.0f alpha:0.2];
    return renderer;
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
