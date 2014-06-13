//
//  PhotoOverviewView.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 07/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "PhotoOverviewView.h"

@implementation PhotoOverviewView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        [self navigationBar];
        [self skyline];
        [self addPeopleButtons];
        [self addBtns];
        
        self.dictImages = [NSMutableDictionary dictionary];

    }
    return self;
}

- (void)addBtns{
    
    UIImage *saveImage = [UIImage imageNamed:@"btn_bewaar"];
    self.btnSave = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnSave setBackgroundImage:saveImage forState:UIControlStateNormal];
    self.btnSave.frame = CGRectMake(self.frame.size.width/2 - saveImage.size.width/2, 420, saveImage.size.width, saveImage.size.height);
    self.btnSave.alpha = 0;
    [self addSubview:self.btnSave];
}

- (void)addPeopleButtons{
    
    UIImage *btnToevoegen = [UIImage imageNamed:@"opdracht3_toevoegveld"];
    self.arrButtons = [NSMutableArray array];
    
    int xPos = 0;
    for (int i = 1; i < 5; i++) {
                
        self.btnToevoegen = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnToevoegen.frame = CGRectMake(25 + xPos, 120, btnToevoegen.size.width, btnToevoegen.size.height);
        [self.btnToevoegen setBackgroundImage:btnToevoegen forState:UIControlStateNormal];
        self.btnToevoegen.tag = i;
        [self addSubview:self.btnToevoegen];
        
        [self.arrButtons addObject:self.btnToevoegen];
        
        xPos += btnToevoegen.size.width;
    }
}

- (void) navigationBar{
    UIImage *navBarImage = [UIImage imageNamed:@"navigationbar_blue"];
    UIImageView *navBarImageView = [[UIImageView alloc] initWithImage:navBarImage];
    navBarImageView.frame = CGRectMake(0, 0, navBarImage.size.width, navBarImage.size.height);
    [self addSubview:navBarImageView];
}

- (void)skyline{
    UIImage *skylineImage = [UIImage imageNamed:@"opdracht3_skyline"];
    UIImageView *skylineImageView = [[UIImageView alloc] initWithImage:skylineImage];
    skylineImageView.frame = CGRectMake(0, self.frame.size.height - skylineImage.size.height, skylineImage.size.width, skylineImage.size.height);
    [self addSubview:skylineImageView];
}

- (void)maskImage:(UIImage *)image withID:(NSInteger)index{
    
    UIImage *chosenPicture = image;
    self.currentImageInteger = index;
    self.currentImage = image;
    
    self.photoLayer = [CALayer layer];
    self.photoLayer.frame = CGRectMake(self.frame.size.width/2 - chosenPicture.size.width/2, 120, 270, 270);
    self.photoLayer.contents = (__bridge id)chosenPicture.CGImage;
    [self.layer addSublayer:self.photoLayer];
    
    self.mask = [CAShapeLayer layer];
    self.mask.path = [UIBezierPath bezierPathWithRect:CGRectMake(0,(index-1) * 67.5, 270, 67.5)].CGPath;
    
    self.photoLayerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.photoLayerButton.frame = CGRectMake(25,((index-1) * 67.5) + 120.5, 270, 67.5);
    self.photoLayerButton.tag = self.currentImageInteger;
    [self addSubview:self.photoLayerButton];
    
    [self.dictImages setObject:self.currentImage forKey:[NSString stringWithFormat:@"%i", self.currentImageInteger]];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MASK_DONE" object:nil];
    
    self.photoLayer.mask = self.mask;

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
