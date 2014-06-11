//
//  MapView.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Eva Pieters on 11/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AnnotationObject.h"

@interface MapView : UIView <CLLocationManagerDelegate>

@property (nonatomic,strong) MKMapView  *mapView;
@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic,strong) UIButton *btn_wezijner;

@end
