//
//  CustomPhotoPicker.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Eva Pieters on 11/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "CustomPhotoPicker.h"

@implementation CustomPhotoPicker

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImage *frame = [UIImage imageNamed:@"frame_fotoNemen"];
        UIImageView *frameView = [[UIImageView alloc] initWithImage:frame];
        frameView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        
        [self addSubview:frameView];
        
        UIImage *camera = [UIImage imageNamed:@"btn_foto"];
        self.btn_foto = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btn_foto setBackgroundImage:camera forState:UIControlStateNormal];
        [self.btn_foto setFrame:CGRectMake(frame.size.width/2 - camera.size.width/2, frame.size.height-camera.size.height-30, camera.size.width, camera.size.height)];
        [self addSubview:self.btn_foto];

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
