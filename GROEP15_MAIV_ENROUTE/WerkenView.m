//
//  WerkenView.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 05/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "WerkenView.h"

@implementation WerkenView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];

        [self navigationBar];
        [self addSteps];
        [self addButton];
        [self footer];
        [self addBackButton];

    }
    return self;
}

- (void) navigationBar{
    UIImage *navBarImage = [UIImage imageNamed:@"navigationbar"];
    UIImageView *navBarImageView = [[UIImageView alloc] initWithImage:navBarImage];
    navBarImageView.frame = CGRectMake(0, 0, navBarImage.size.width, navBarImage.size.height);
    [self addSubview:navBarImageView];
}

- (void) footer{
    UIImage *footerImage = [UIImage imageNamed:@"skyline"];
    UIImageView *footerImageView = [[UIImageView alloc] initWithImage:footerImage];
    footerImageView.frame = CGRectMake(0, self.frame.size.height - footerImage.size.height, footerImage.size.width, footerImage.size.height);
    [self addSubview:footerImageView];
}

- (void)addSteps{
    
    UIFont *tidyHand = [UIFont fontWithName:TIDY_HAND size:17];

    UIImage *iPhone = [UIImage imageNamed:@"image_1_iphone"];
    UIImageView *iPhoneView = [[UIImageView alloc] initWithImage:iPhone];
    iPhoneView.frame = CGRectMake(30, 140, iPhone.size.width, iPhone.size.height);
    [self addSubview:iPhoneView];
    
    UILabel *phoneLabel = [[UILabel alloc] init];
    phoneLabel.frame = CGRectMake(iPhone.size.width + 60, 130, 170, 100);
    phoneLabel.text = @"Geef de iPhone door naar links!";
    phoneLabel.numberOfLines = 0;
    phoneLabel.font = tidyHand;
    [self addSubview:phoneLabel];

    UIImage *camera = [UIImage imageNamed:@"image_2_camera"];
    UIImageView *cameraView = [[UIImageView alloc] initWithImage:camera];
    cameraView.frame = CGRectMake(30, 300, camera.size.width, camera.size.height);
    [self addSubview:cameraView];
    
    UILabel *cameraLabel = [[UILabel alloc] init];
    cameraLabel.frame = CGRectMake(phoneLabel.frame.origin.x, 275, 170, 100);
    cameraLabel.text = @"Ga opzoek naar een bouwwerf in de stad en fotografeer deze";
    cameraLabel.numberOfLines = 0;
    cameraLabel.font = tidyHand;
    [self addSubview:cameraLabel];
}

- (void) addButton{
    
    UIImage *startBtnGroen = [UIImage imageNamed:@"btn_start_groen"];
    self.btnStart = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnStart setBackgroundImage:startBtnGroen forState:UIControlStateNormal];
    self.btnStart.frame = CGRectMake(self.frame.size.width / 2 - startBtnGroen.size.width /2, self.frame.size.height - 160, startBtnGroen.size.width, startBtnGroen.size.height);
    [self.btnStart setTitle:@"START" forState:UIControlStateNormal];
    self.btnStart.titleLabel.font = [UIFont fontWithName:CASUAL_HARDCORE size:40];
    [self addSubview:self.btnStart];
}

- (void)addBackButton{
    self.btnBack = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btnBack.frame = CGRectMake(30, 30, 70, 40);
    [self.btnBack setTitle:@"back" forState:UIControlStateNormal];
    [self addSubview:self.btnBack];
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
