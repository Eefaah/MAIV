//
//  DrawingView.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 05/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView

- (id)initWithFrame:(CGRect)frame andImage:(UIImage *)image
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.image = image;
        
        [self addBGImage];
        
        self.mainImage = [[UIImageView alloc] init];
        self.mainImage.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [self addSubview:self.mainImage];
        
        self.tempDrawImage = [[UIImageView alloc] init];
        self.tempDrawImage.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [self addSubview:self.tempDrawImage];
        
        UIImage *startImage = [UIImage imageNamed:@"btn_blauw"];
        UIImage *endImage = [UIImage imageNamed:@"btn_blauw"];
        
        self.startImage = [[UIImageView alloc] initWithImage:startImage];
        self.endImage = [[UIImageView alloc] initWithImage:endImage];
        
        self.startImage.frame = CGRectMake(20, 500, 50, 50);
        self.endImage.frame = CGRectMake(245, 500, 50, 50);
        
        [self addSubview:self.startImage];
        [self addSubview:self.endImage];
    }
    
    return self;
}

- (void)addBGImage{
    
    UIImage *bgImage = self.image;
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
    bgImageView.frame = CGRectMake(self.frame.size.width/2 - (bgImage.size.width/5.5)/2, self.frame.size.height/2 - (bgImage.size.height/5.5)/2, bgImage.size.width/5.5, bgImage.size.height/5.5);
    bgImageView.alpha = 0.9;
    [self addSubview:bgImageView];
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
