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
        
        UIImage *bgImage = [UIImage imageNamed:@"resultaat_bg"];
        UIImageView *bg = [[UIImageView alloc] initWithImage:bgImage];
        [bg setFrame:CGRectMake(0, 7, bgImage.size.width, bgImage.size.height)];
        [self addSubview:bg];
        
        self.drawnImage = image;
//        
//        UIImage *buttonsIndicator = [UIImage imageNamed:@"buttons_indicator"];
//        self.indicator = [[UIImageView alloc] initWithImage:buttonsIndicator];
//        self.indicator.frame = CGRectMake(0, 418, buttonsIndicator.size.width, buttonsIndicator.size.height);
//        [self addSubview:self.indicator];
        
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
    imageView.frame = CGRectMake(self.frame.size.width /2 - (image.size.width/2)/2, 155, image.size.width/2, image.size.height/2);
    [self addSubview:imageView];

}

- (void)addLabel{
    
    UIFont *dosis = [UIFont fontWithName:TIDY_HAND size:17];
    self.lblJouwTekening = [[UILabel alloc] init];
    self.lblJouwTekening.text = @"Dit is jouw tekening";
    self.lblJouwTekening.frame = CGRectMake(72, 130, 215, 30);
    self.lblJouwTekening.font = dosis;
    self.lblJouwTekening.textColor = [UIColor blackColor];
    [self addSubview:self.lblJouwTekening];
}

- (void)addButtons{
    
    UIImage *againImage = [UIImage imageNamed:@"btn_opnieuw"];
    self.btnAgain = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnAgain.frame = CGRectMake(32, self.frame.size.height-againImage.size.height - 20, againImage.size.width, againImage.size.height);
    [self.btnAgain setBackgroundImage:againImage forState:UIControlStateNormal];
    [self addSubview:self.btnAgain];
    
    UIImage *okImage = [UIImage imageNamed:@"btn_bewaar"];
    self.btnOk = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnOk.frame = CGRectMake(self.btnAgain.frame.origin.x + againImage.size.width + 122, self.frame.size.height - okImage.size.height - 20, okImage.size.width, okImage.size.height);
    [self.btnOk setBackgroundImage:okImage forState:UIControlStateNormal];
    [self addSubview:self.btnOk];
}

-(void)removeButtons{
    // bewaar button weghalen
    //[self.btn_retake removeFromSuperview];
    [self.btnOk removeFromSuperview];
    [self.btnAgain removeFromSuperview];
}

-(void)changeButton{
    [self.btnOk setBackgroundImage:[UIImage imageNamed:@"btn_wait_kleiner"] forState:UIControlStateNormal];
}

- (void) navigationBar{
    UIImage *titel = [UIImage imageNamed:@"opdracht7_titel"];
    self.navBar = [[NavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 108) andTitleImage:titel andAddBtn:YES];
    [self addSubview:self.navBar];
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
