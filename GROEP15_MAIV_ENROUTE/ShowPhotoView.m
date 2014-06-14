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
        
        // bg image met gele vlek
        UIImage *bgImage = [UIImage imageNamed:@"opdracht3_bg_retake"];
        UIImageView *bgView = [[UIImageView alloc] initWithImage:bgImage];
        bgView.frame = CGRectMake(0, 0, bgImage.size.width, bgImage.size.height);
        [self addSubview:bgView];
        
        [self showimage];
        [self navigationBar];
        [self skyline];
        [self addBtn];
    }
    return self;
}

- (void)showimage{
    UIImageView *photoImageview = [[UIImageView alloc] initWithImage:self.takenPhoto];
    photoImageview.frame = CGRectMake(self.frame.size.width/2 - self.takenPhoto.size.width/2, 130, self.takenPhoto.size.width, self.takenPhoto.size.height);
    [self addSubview:photoImageview];
}


- (void) navigationBar{
    UIImage *titel = [UIImage imageNamed:@"opdracht3_titel"];
    self.navBar = [[NavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 108) andTitleImage:titel andAddBtn:YES];
    [self addSubview:self.navBar];
}

- (void)skyline{
    UIImage *skylineImage = [UIImage imageNamed:@"opdracht3_skyline"];
    UIImageView *skylineImageView = [[UIImageView alloc] initWithImage:skylineImage];
    skylineImageView.frame = CGRectMake(0, self.frame.size.height - skylineImage.size.height, skylineImage.size.width, skylineImage.size.height);
    [self addSubview:skylineImageView];
}

- (void)addBtn{
    
    UIImage *btnTerug = [UIImage imageNamed:@"btn_terug"];
    
    self.btnTerug = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnTerug setBackgroundImage:btnTerug forState:UIControlStateNormal];
    self.btnTerug.frame = CGRectMake(40, self.frame.size.height-btnTerug.size.height-79, btnTerug.size.width, btnTerug.size.height);
    [self addSubview:self.btnTerug];
    
    UIImage *btnRetake = [UIImage imageNamed:@"btn_retake_turned"];
    self.btnRetake = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnRetake setBackgroundImage:btnRetake forState:UIControlStateNormal];
    self.btnRetake.frame = CGRectMake(self.btnTerug.frame.origin.x + btnTerug.size.width + 94, self.frame.size.height-btnRetake.size.height-79, btnRetake.size.width, btnRetake.size.height);
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
