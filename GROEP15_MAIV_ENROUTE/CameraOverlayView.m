//
//  CameraOverlayView.m
//  Camera
//
//  Created by Eva Pieters on 10/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "CameraOverlayView.h"

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
        
        //self.backgroundColor = [UIColor greenColor];
    }
    return self;
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
