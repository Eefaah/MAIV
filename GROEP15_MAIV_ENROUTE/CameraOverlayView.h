//
//  CameraOverlayView.h
//  Camera
//
//  Created by Eva Pieters on 10/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface CameraOverlayView : UIView
@property (nonatomic,strong) UIButton *btn_camera;

@property (nonatomic, strong) NSMutableArray *arrPoints;
@property (nonatomic) CGPoint lastPoint;
@property (nonatomic) CGPoint currentValue;
@property (nonatomic, strong) UIImageView *drawingImage;
@property (assign, nonatomic) CGPoint currentPoint;
@property (assign, nonatomic) CGPoint previousPoint;
@property (strong, nonatomic) CMMotionManager  *motionManager;
@property (strong, nonatomic) NSOperationQueue *queue;
@property (strong, nonatomic) NSDate *lastUpdateTime;
@property (assign, nonatomic) CMAcceleration acceleration;
@property (nonatomic, strong) UIImageView *mainImage;
@property (nonatomic) float yPosition;

- (void)lines;
- (void)endDrawing;

@end
