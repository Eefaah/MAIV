//
//  ShowPhotoView.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 07/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "ShowPhotoView.h"

@implementation ShowPhotoView

- (id)initWithFrame:(CGRect)frame andImage:(UIImage *)image
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        self.takenPhoto = image;
        
        [self showimage];
        [self navigationBar];
        [self skyline];
        [self addLbl];
        [self addBtn];
    }
    return self;
}

- (void)showimage{
    
    UIImageView *photoImageview = [[UIImageView alloc] initWithImage:self.takenPhoto];
    photoImageview.frame = CGRectMake(self.frame.size.width/2 - self.takenPhoto.size.width/2, 140, self.takenPhoto.size.width, self.takenPhoto.size.height);
    [self addSubview:photoImageview];
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

- (void)addLbl{
    
    UIFont *dosis = [UIFont fontWithName:TIDY_HAND size:17];
    self.lblJullieFoto = [[UILabel alloc] init];
    self.lblJullieFoto.frame = CGRectMake(self.frame.size.width/2 - 100, 100, 200, 40);
    self.lblJullieFoto.text = @"DIT IS JULLIE FOTO";
    self.lblJullieFoto.font = dosis;
    self.lblJullieFoto.textColor = [UIColor colorWithRed:0.03 green:0.66 blue:0.51 alpha:1];
    self.lblJullieFoto.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.lblJullieFoto];
}

- (void)addBtn{
    
    UIImage *btnTerug = [UIImage imageNamed:@"opdracht3_btn_terug"];
    self.btnTerugNaarVerhaal = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnTerugNaarVerhaal setBackgroundImage:btnTerug forState:UIControlStateNormal];
    self.btnTerugNaarVerhaal.frame = CGRectMake(self.frame.size.width/2 - btnTerug.size.width/2, self.frame.size.height - btnTerug.size.height - 45, btnTerug.size.width, btnTerug.size.height);
    [self addSubview:self.btnTerugNaarVerhaal];
    
    self.btnRetake = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.btnRetake setTitle:@"retake" forState:UIControlStateNormal];
    self.btnRetake.frame = CGRectMake(20, 50, 100, 10);
    [self addSubview:self.btnRetake];
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
