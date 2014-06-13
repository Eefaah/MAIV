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
        
        NSLog(@"view did load");
        
        [self showResult];
        [self navigationBar];
        [self footer];
        [self addBtns];
    }
    return self;
}

- (void)addBtns{
    
    UIImage *saveImage = [UIImage imageNamed:@"btn_bewaar"];
    self.btnSave = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnSave setBackgroundImage:saveImage forState:UIControlStateNormal];
    self.btnSave.frame = CGRectMake(self.frame.size.width/2 - saveImage.size.width/2, 400, saveImage.size.width, saveImage.size.height);
    [self addSubview:self.btnSave];
}

- (void)showResult{
    
    UIImage *image = [UIImage imageNamed:@"opdracht5_path2"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    [self addSubview:imageView];
    
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
