//
//  EndView.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 09/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "GPSEndView.h"

@implementation GPSEndView

- (id)initWithFrame:(CGRect)frame andArr:(NSMutableArray *)arr
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        self.arrDrawnPoints = [NSMutableArray array];
        self.arrDrawnPoints = arr;
        
        UIImage *buttonsIndicator = [UIImage imageNamed:@"buttons_indicator"];
        self.indicator = [[UIImageView alloc] initWithImage:buttonsIndicator];
        self.indicator.frame = CGRectMake(0, 398, buttonsIndicator.size.width, buttonsIndicator.size.height);
        [self addSubview:self.indicator];
        
        NSLog(@"view did load");
        
        [self showResult];
        [self navigationBar];
        [self footer];
        [self addBtns];
    }
    return self;
}

- (void)addBtns{
    
    UIImage *btn_retake = [UIImage imageNamed:@"btn_opnieuw"];
    self.btn_retake = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn_retake setBackgroundImage:btn_retake forState:UIControlStateNormal];
    self.btn_retake.frame = CGRectMake(32, self.frame.size.height-btn_retake.size.height - 104, btn_retake.size.width, btn_retake.size.height);
    [self addSubview:self.btn_retake];
    
    UIImage *saveImage = [UIImage imageNamed:@"btn_bewaar"];
    self.btnSave = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnSave setBackgroundImage:saveImage forState:UIControlStateNormal];
    self.btnSave.frame = CGRectMake(self.btn_retake.frame.origin.x + btn_retake.size.width + 122, self.frame.size.height - saveImage.size.height - 104, saveImage.size.width, saveImage.size.height);
    [self addSubview:self.btnSave];
}

-(void)changeButton{
    // bewaar button weghalen
    [self.btn_retake removeFromSuperview];
    [self.btnSave removeFromSuperview];
    
    UIImage *backToStory = [UIImage imageNamed:@"btn_backToStory"];
    self.btn_story = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn_story setBackgroundImage:backToStory forState:UIControlStateNormal];
    self.btn_story.frame = CGRectMake(self.frame.size.width/2 - backToStory.size.width/2, self.frame.size.height - backToStory.size.height - 100, backToStory.size.width, backToStory.size.height);
    [self addSubview:self.btn_story];
    
    UIImage *backToStoryIndicator = [UIImage imageNamed:@"backToStory_indicator"];
    //self.indicator = [[UIImageView alloc] initWithImage:backToStoryIndicator];
    self.indicator.image = backToStoryIndicator;
    self.indicator.frame = CGRectMake(0, 398, backToStoryIndicator.size.width, backToStoryIndicator.size.height);
    //[self addSubview:self.indicator];
}

- (void)showResult{
    
    UIImage *image = [UIImage imageNamed:@"opdracht5_path2"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    [self addSubview:imageView];
    
    UIFont *tidy = [UIFont fontWithName:TIDY_HAND size:17];
    self.lblTekening = [[UILabel alloc] init];
    self.lblTekening.text = @"Dit is jouw tekening";
    self.lblTekening.frame = CGRectMake(43, 148, 243, 44);
    self.lblTekening.font = tidy;
    self.lblTekening.textColor = [UIColor blackColor];
    [self addSubview:self.lblTekening];
    
    NSValue *startPoint = [self.arrDrawnPoints objectAtIndex:self.arrDrawnPoints.count - self.arrDrawnPoints.count + 1];
    CGPoint startPointPoint = [startPoint CGPointValue];
    UIBezierPath *aPath = [UIBezierPath bezierPath];
   
    [aPath moveToPoint:startPointPoint];
    for(NSValue *point in self.arrDrawnPoints){
        
        self.aPoint = [point CGPointValue];
        
        [aPath addLineToPoint:self.aPoint];
        
        self.shapeLayer = [[CAShapeLayer alloc] initWithLayer:self.layer];
        self.shapeLayer.lineWidth = 5;
        self.shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
        self.shapeLayer.path = aPath.CGPath;
        self.shapeLayer.fillColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0].CGColor;
        [self.layer addSublayer:self.shapeLayer];
    }
    
    //self.shapeLayer.frame = CGRectMake(100, 100, 100, 100);

}

- (void) navigationBar{
    UIImage *titel = [UIImage imageNamed:@"opdracht5_titel"];
    
    self.navBar = [[NavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 108) andTitleImage:titel andAddBtn:YES];
    [self addSubview:self.navBar];
}

- (void) footer{
    UIImage *footerImage = [UIImage imageNamed:@"opdracht5_skyline"];
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
