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
        self.backgroundColor = [UIColor whiteColor];
        self.image = image;
        
        [self addBGImage];
        
        UIImage *startImage = [UIImage imageNamed:@"opdracht1_img_start"];
        UIImage *endImage = [UIImage imageNamed:@"opdracht1_img_stop"];
        
        self.startImage = [[UIImageView alloc] initWithImage:startImage];
        self.endImage = [[UIImageView alloc] initWithImage:endImage];
        
        self.startImage.frame = CGRectMake(0, 500, startImage.size.width, startImage.size.height);
        self.endImage.frame = CGRectMake(self.frame.size.width - endImage.size.width, 500, endImage.size.width, endImage.size.height);
        
        [self addSubview:self.startImage];
        [self addSubview:self.endImage];
        
        self.mainImage = [[UIImageView alloc] init];
        self.mainImage.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [self addSubview:self.mainImage];
        
        self.tempDrawImage = [[UIImageView alloc] init];
        self.tempDrawImage.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [self addSubview:self.tempDrawImage];
    }
    
    return self;
}

- (void)addBGImage{
    
    UIImage *bgImage = self.image;
    self.bgImageView = [[UIImageView alloc] initWithImage:bgImage];
    self.bgImageView.frame = CGRectMake(self.frame.size.width/2 - (bgImage.size.width/5.5)/2, self.frame.size.height/2 - (bgImage.size.height/5.5)/2, bgImage.size.width/5.5, bgImage.size.height/5.5);
    self.bgImageView.alpha = 0.9;
    [self addSubview:self.bgImageView];
}

- (void)approveOrDisapproveDrawing{
    self.bgImageView.image = nil;
    self.backgroundColor = [UIColor whiteColor];
    
    //self.endDrawVC = [[EndDrawViewController alloc] initWithNibName:nil bundle:nil andImage:self.mainImage.image];
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
