//
//  EndView.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 11/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "EndView.h"

@implementation EndView

- (id)initWithFrame:(CGRect)frame videoUrl:(NSURL *)url
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        self.videoUrl = url;
        //self.drawnImage = image;
        
        UIImage *bgImage = [UIImage imageNamed:@"opdracht1_path2"];
        
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
        bgImageView.frame = CGRectMake(0, 0, bgImage.size.width, bgImage.size.height);
        [self addSubview:bgImageView];
        [self sendSubviewToBack:bgImageView];
        
        UIImage *buttonsIndicator = [UIImage imageNamed:@"buttons_indicator"];
        self.indicator = [[UIImageView alloc] initWithImage:buttonsIndicator];
        self.indicator.frame = CGRectMake(0, 418, buttonsIndicator.size.width, buttonsIndicator.size.height);
        [self addSubview:self.indicator];
        
        self.lblFilmpje = [[UILabel alloc] init];
        self.lblFilmpje.text = @"Dit is het filmpje";
        self.lblFilmpje.frame = CGRectMake(frame.size.width/2-147/2, 114, 147, 30);
        self.lblFilmpje.font = [UIFont fontWithName:TIDY_HAND size:17];
        self.lblFilmpje.textColor = [UIColor blackColor];
        [self addSubview:self.lblFilmpje];
        
        [self navigationBar];
        [self footer];
        [self addBtns];
        //[self drawImage];
    }
    return self;
}

- (void) navigationBar{
    UIImage *titel = [UIImage imageNamed:@"opdracht1_titel"];
    self.navBar = [[NavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 108) andTitleImage:titel andAddBtn:YES];
    [self addSubview:self.navBar];
}


- (void)addBtns{
    
    UIImage *retakeImage = [UIImage imageNamed:@"btn_opnieuw"];
    self.btnRetake = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnRetake setBackgroundImage:retakeImage forState:UIControlStateNormal];
    self.btnRetake.frame = CGRectMake(48, self.frame.size.height-retakeImage.size.height - 82, retakeImage.size.width, retakeImage.size.height);
    [self addSubview:self.btnRetake];
    
    UIImage *saveImage = [UIImage imageNamed:@"btn_bewaar"];
    
    self.btnSave = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnSave setBackgroundImage:saveImage forState:UIControlStateNormal]; 
    self.btnSave.frame = CGRectMake(self.btnRetake.frame.origin.x + retakeImage.size.width + 91, self.frame.size.height - saveImage.size.height - 82, saveImage.size.width, saveImage.size.height);
    [self addSubview:self.btnSave];
}


-(void)removeButtons{
    // bewaar button weghalen
    //[self.btn_retake removeFromSuperview];
    [self.btnSave setBackgroundImage:[UIImage imageNamed:@"btn_wait_kleiner"] forState:UIControlStateNormal];
}

-(void)changeButton{
    [self.btnSave removeFromSuperview];
    [self.btnRetake removeFromSuperview];
    
    UIImage *backToStory = [UIImage imageNamed:@"btn_backToStory"];
    self.btn_story = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn_story setBackgroundImage:backToStory forState:UIControlStateNormal];
    self.btn_story.frame = CGRectMake(self.frame.size.width/2 - backToStory.size.width/2, self.frame.size.height - backToStory.size.height - 60, backToStory.size.width, backToStory.size.height);
    [self addSubview:self.btn_story];
    
    UIImage *backToStoryIndicator = [UIImage imageNamed:@"backToStory_indicator"];
    //self.indicator = [[UIImageView alloc] initWithImage:backToStoryIndicator];
    self.indicator.image = backToStoryIndicator;
    self.indicator.frame = CGRectMake(0, 418, backToStoryIndicator.size.width, backToStoryIndicator.size.height);
    //[self addSubview:self.indicator];
}


- (void)drawImage:(UIImage *)image{
    UIImageView *drawnImageView = [[UIImageView alloc] initWithImage:image];
    NSLog(@"breedte van de image = %f",image.size.width);
    NSLog(@"hoogte van de image = %f",image.size.height);
    
    drawnImageView.frame = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    
    //set point of rotation
    drawnImageView.center = CGPointMake(160, 284);
    
    //rotate rect
    drawnImageView.transform = CGAffineTransformMakeRotation(-(M_PI_2));
    
    [self addSubview:drawnImageView];
}


- (void) footer{
    UIImage *footerImage = [UIImage imageNamed:@"opdracht1_skyline"];
    UIImageView *footerImageView = [[UIImageView alloc] initWithImage:footerImage];
    footerImageView.frame = CGRectMake(0, self.frame.size.height - footerImage.size.height, footerImage.size.width, footerImage.size.height);
    [self addSubview:footerImageView];
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
