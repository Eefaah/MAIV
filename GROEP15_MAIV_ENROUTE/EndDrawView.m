//
//  EndDrawView.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 06/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "EndDrawView.h"

@implementation EndDrawView

- (id)initWithFrame:(CGRect)frame andImage:(UIImage *)image
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        self.drawnImage = image;
        
        [self navigationBar];
        [self imageController];
        [self addButtons];
        [self addLabel];
    }
    
    return self;
}

- (void)imageController{
    
    UIImage *image = self.drawnImage;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(self.frame.size.width /2 - (image.size.width/2)/2, 175, image.size.width/2, image.size.height/2);
    [self addSubview:imageView];


    
}

- (void)addLabel{
    
    UIFont *dosis = [UIFont fontWithName:TIDY_HAND size:17];
    self.lblJouwTekening = [[UILabel alloc] init];
    self.lblJouwTekening.text = @"Dit is jouw tekening";
    self.lblJouwTekening.frame = CGRectMake(self.frame.size.width/2 - 120, 130, 300, 30);
    self.lblJouwTekening.font = dosis;
    self.lblJouwTekening.textColor = [UIColor blackColor];
    [self addSubview:self.lblJouwTekening];
}

- (void)addButtons{
    
    UIImage *againImage = [UIImage imageNamed:@"btn_opnieuw"];
    self.btnAgain = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnAgain.frame = CGRectMake(35, 460, againImage.size.width, againImage.size.height);
    [self.btnAgain setBackgroundImage:againImage forState:UIControlStateNormal];
    [self addSubview:self.btnAgain];
    
    UIImage *okImage = [UIImage imageNamed:@"btn_bewaar"];
    self.btnOk = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnOk.frame = CGRectMake(self.frame.size.width - okImage.size.width - 30, 470, okImage.size.width, okImage.size.height);
    [self.btnOk setBackgroundImage:okImage forState:UIControlStateNormal];
    [self addSubview:self.btnOk];
}

- (void) navigationBar{
    UIImage *navBarImage = [UIImage imageNamed:@"navigationbar"];
    UIImageView *navBarImageView = [[UIImageView alloc] initWithImage:navBarImage];
    navBarImageView.frame = CGRectMake(0, 0, navBarImage.size.width, navBarImage.size.height);
    [self addSubview:navBarImageView];
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
