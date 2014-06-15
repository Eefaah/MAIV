//
//  MapView.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 09/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapView : UIView <MKMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, strong) MKMapView *mapView;
@property (nonatomic, strong) UIImageView *tempDrawImage;
@property (nonatomic, strong) UIButton *startTrackingBtn;
@property (nonatomic, strong) UIButton *endTrackingButton;
@property (nonatomic) CLLocationCoordinate2D startPoint;
@property (nonatomic, strong) NSMutableArray *arrPoints;
@property (nonatomic, strong) NSMutableArray *arrDrawingPoints;
@property (nonatomic) CGPoint aPoint;
@property (nonatomic) CGPoint lastPoint;
@property (nonatomic) CGPoint currentPoint;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;

- (void)drawPolyline;
- (void)endTracking;

@end
