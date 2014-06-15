//
//  MapView.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 09/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "MapView.h"

@implementation MapView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        NSLog(@"map view");
        
        self.mapView = [[MKMapView alloc] initWithFrame:frame];
        self.mapView.showsUserLocation = YES;
        self.mapView.delegate = self;
        [self addSubview:self.mapView];
        
        self.tempDrawImage = [[UIImageView alloc] init];
        self.tempDrawImage.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [self addSubview:self.tempDrawImage];
        
        [self startTracking];
    }
    return self;
}

- (void)startTracking{
    
    UIImage *startTrackingBtn = [UIImage imageNamed:@"btn_startTracking"];
    
    self.startTrackingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.startTrackingBtn setBackgroundImage:startTrackingBtn forState:UIControlStateNormal];
    self.startTrackingBtn.frame = CGRectMake(self.frame.size.width/2 - startTrackingBtn.size.width/2, self.frame.size.height - 100, startTrackingBtn.size.width, startTrackingBtn.size.height);
    [self addSubview:self.startTrackingBtn];
    
    UIImage *endTrackingBtn = [UIImage imageNamed:@"btn_stopTracking"];
    
    self.endTrackingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.endTrackingButton setBackgroundImage:endTrackingBtn forState:UIControlStateNormal];
    self.endTrackingButton.frame = CGRectMake(self.frame.size.width/2 - endTrackingBtn.size.width/2, self.frame.size.height - 100, endTrackingBtn.size.width, endTrackingBtn.size.height);
}

- (void)drawPolyline{
    
    CLLocationCoordinate2D coordinates [[self.arrPoints count]];
    self.arrDrawingPoints = [NSMutableArray array];
    
    int i = 0;
    for(CLLocation *location in self.arrPoints){
        
        coordinates[i] = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude);
        
        CGPoint point = [self.mapView convertCoordinate:location.coordinate toPointToView:self];
        [self.arrDrawingPoints addObject:[NSValue valueWithCGPoint:point]];
        
        if(i < 1){
            i ++;
        }else{
            i = 0;
        }
    }
    
    [self drawGraphics];
    
    MKPolyline *polyline = [MKPolyline polylineWithCoordinates:coordinates count:2];
    [self.mapView addOverlay:polyline level:MKOverlayLevelAboveLabels];
}

- (void)drawGraphics{
    
    if(self.arrDrawingPoints.count > 2){
        NSValue *value = [self.arrDrawingPoints objectAtIndex:self.arrDrawingPoints.count - 2];
        self.lastPoint = [value CGPointValue];
        NSValue *currentValue = [self.arrDrawingPoints objectAtIndex:self.arrDrawingPoints.count - 1];
        self.currentPoint = [currentValue CGPointValue];
    }
    
    UIGraphicsBeginImageContext(self.frame.size);
    [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 5);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0/255.0f, 0/255.0f, 0/255.0f, 1);
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), self.lastPoint.x, self.lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), self.currentPoint.x, self.currentPoint.y);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeNormal);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    
    ////// deze op alpha 1 zetten om lijnen te zien ///////
    [self.tempDrawImage setAlpha:0.5];
    
    UIGraphicsEndImageContext();
    
    self.lastPoint = self.currentPoint;

}

- (MKOverlayRenderer*)mapView:(MKMapView*)mapView rendererForOverlay:(id <MKOverlay>)overlay{
    
    MKPolylineRenderer *polylineView = [[MKPolylineRenderer alloc] initWithPolyline:overlay];
    
    polylineView.strokeColor =  [UIColor orangeColor];
    polylineView.lineWidth = 5.0;
    polylineView.alpha = 1;
    
    return polylineView;
}

- (void)endTracking{
    NSLog(@"end tracking tapped - mapview");
    NSValue *startPoint = [self.arrDrawingPoints objectAtIndex:self.arrDrawingPoints.count - self.arrDrawingPoints.count + 1];
    CGPoint startPointPoint = [startPoint CGPointValue];
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    
    [aPath moveToPoint:startPointPoint];
    for(NSValue *point in self.arrDrawingPoints){
        self.aPoint = [point CGPointValue];
        
        [aPath addLineToPoint:self.aPoint];
        
        self.shapeLayer = [[CAShapeLayer alloc] initWithLayer:self.layer];
        self.shapeLayer.lineWidth = 5;
        self.shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
        self.shapeLayer.path = aPath.CGPath;
        self.shapeLayer.fillColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0].CGColor;
        [self.layer addSublayer:self.shapeLayer];
        
        self.mapView.alpha = 0;
    }
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
