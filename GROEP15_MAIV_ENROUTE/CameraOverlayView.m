//
//  CameraOverlayView.m
//  Camera
//
//  Created by Eva Pieters on 10/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "CameraOverlayView.h"
#import "AFNetworking.h"
#define kUpdateInterval (0.1f)

@implementation CameraOverlayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImage *frame = [UIImage imageNamed:@"frame"];
        UIImageView *frameView = [[UIImageView alloc] initWithImage:frame];
        frameView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        
        [self addSubview:frameView];
        
        UIImage *camera = [UIImage imageNamed:@"btn_record"];
        self.btn_camera = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btn_camera setBackgroundImage:camera forState:UIControlStateNormal];
        [self.btn_camera setFrame:CGRectMake(frame.size.width/2 - camera.size.width/2, frame.size.height-camera.size.height-40, camera.size.width, camera.size.height)];
        [self addSubview:self.btn_camera];
        
        self.mainImage = [[UIImageView alloc] init];
        self.mainImage.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [self addSubview:self.mainImage];
        
        self.yPosition = 0;
        self.lastPoint = CGPointMake(frame.size.width/2, 0);
        self.currentPoint = CGPointMake(frame.size.width/2, 0);
        //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endDrawing:) name:@"END_ACCELEROMETER" object:nil];
    }
    return self;
}

- (void)lines{
    self.lastUpdateTime = [[NSDate alloc] init];
    
    self.motionManager = [[CMMotionManager alloc]  init];
    self.queue = [[NSOperationQueue alloc] init];
    
    self.motionManager.accelerometerUpdateInterval = kUpdateInterval;
    
    [self.motionManager startAccelerometerUpdatesToQueue:self.queue withHandler:
     ^(CMAccelerometerData *accelerometerData, NSError *error) {
         [(id) self setAcceleration:accelerometerData.acceleration];
         [self performSelectorOnMainThread:@selector(update) withObject:nil waitUntilDone:NO];
     }];
    
    self.drawingImage = [[UIImageView alloc] initWithFrame:self.frame];
    self.drawingImage.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self addSubview:self.drawingImage];
    
    self.arrPoints = [NSMutableArray array];
    
}

- (void)update {
//    
//    [NSTimeInterval ]
    
//    self.currentPoint = CGPointMake(self.currentPoint.x + (self.acceleration.x * 10),
//                                    self.currentPoint.y - (self.acceleration.y* 10));
    self.currentPoint = CGPointMake(self.currentPoint.x + (self.acceleration.x * 10),
                                    self.yPosition);
    
    //NSLog(@"y acceleration = %f",(self.acceleration.y*10));
    
    [self drawLines];
    [self collisionWithBoundaries];
    
    self.lastUpdateTime = [NSDate date];
    // 10 is de tijd van het filmpje
    self.yPosition += (self.frame.size.height*kUpdateInterval/10);
}



- (void)drawLines{
    
    [self.arrPoints addObject:[NSValue valueWithCGPoint:self.currentPoint]];
    
    if(self.arrPoints.count > 2){
        NSValue *value = [self.arrPoints objectAtIndex:self.arrPoints.count - 2];
        self.lastPoint = [value CGPointValue];
        NSValue *currentValue = [self.arrPoints objectAtIndex:self.arrPoints.count - 1];
        self.currentValue = [currentValue CGPointValue];
    }
    
    UIGraphicsBeginImageContext(self.frame.size);
    [self.drawingImage.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    //shape van de lijn
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    
    //line width
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 5);
    
    //kleur van de lijn
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 247/255.0f, 147/255.0f, 16/255.0f, 1);
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), self.lastPoint.x, self.lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), self.currentPoint.x, self.currentPoint.y);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeNormal);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.drawingImage.image = UIGraphicsGetImageFromCurrentImageContext();
    
    [self.drawingImage setAlpha:1];
    
}

- (void)endDrawing{
    NSLog(@"END ACCELEROMETER");
    [self.motionManager stopAccelerometerUpdates];
    
    UIGraphicsBeginImageContext(self.mainImage.frame.size);
    [self.mainImage.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) blendMode:kCGBlendModeNormal alpha:1.0];
    [self.drawingImage.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) blendMode:kCGBlendModeNormal alpha:1];
    self.mainImage.image = UIGraphicsGetImageFromCurrentImageContext();
    self.drawingImage.image = nil;
    UIGraphicsEndImageContext();
    
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    [userInfo setObject:self.mainImage.image forKey:@"drawnImage"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SHOW_DRAWING" object:self userInfo:userInfo];
    
    //[self uploadPost];
}

- (void)collisionWithBoundaries{
    
    if (self.currentPoint.x < 10) {
        _currentPoint.x = 10;
    }
    
    if (self.currentPoint.y < 0) {
        _currentPoint.y = 0;
    }
    
    if (self.currentPoint.x > self.frame.size.width) {
        _currentPoint.x = self.frame.size.width;
    }
    
    if (self.currentPoint.y > self.frame.size.height) {
        _currentPoint.y = self.frame.size.height;
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
