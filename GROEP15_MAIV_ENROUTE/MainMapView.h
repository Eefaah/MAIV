//
//  MainMapView.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Eva Pieters on 15/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AnnotationObject.h"

@interface MainMapView : UIView <MKMapViewDelegate,CLLocationManagerDelegate>

@property (nonatomic,strong) MKMapView *mapView;
@property (nonatomic,strong) CLLocationManager *locationManager;

@end
