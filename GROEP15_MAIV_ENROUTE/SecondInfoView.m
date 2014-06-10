//
//  SecondInfoView.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 06/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "SecondInfoView.h"

@implementation SecondInfoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        [self addImageToScrollView];
        [self navigationBar];
        [self addLabels];
        [self addButton];
        [self skyline];
    }
    return self;
}

- (void)addImageToScrollView{
    
    UIImage *infoImage = [UIImage imageNamed:@"opdracht1_uitleg2_path"];
    UIImageView *infoImageView = [[UIImageView alloc] initWithImage:infoImage];
    infoImageView.frame = CGRectMake(30, 0, infoImage.size.width, infoImage.size.height);
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 70, self.frame.size.width, self.frame.size.height)];
    self.scrollView.contentSize = CGSizeMake(infoImage.size.width, infoImage.size.height + 260);
    
    [self.scrollView addSubview:infoImageView];
    [self addSubview:self.scrollView];
}

- (void) navigationBar{
    UIImage *navBarImage = [UIImage imageNamed:@"navigationbar"];
    UIImageView *navBarImageView = [[UIImageView alloc] initWithImage:navBarImage];
    navBarImageView.frame = CGRectMake(0, 0, navBarImage.size.width, navBarImage.size.height);
    [self addSubview:navBarImageView];
}

- (void)skyline{
    UIImage *skylineImage = [UIImage imageNamed:@"skyline_werken"];
    UIImageView *skylineImageView = [[UIImageView alloc] initWithImage:skylineImage];
    skylineImageView.frame = CGRectMake(0, self.frame.size.height - skylineImage.size.height, skylineImage.size.width, skylineImage.size.height);
    [self addSubview:skylineImageView];
}

- (void)addLabels{
    
    UIFont *tidyHand = [UIFont fontWithName:TIDY_HAND size:17];
    self.lblNiew = [[UILabel alloc] init];
    self.lblNiew.text = @"waarom moest het oude gebouw weg?";
    self.lblNiew.numberOfLines = 0;
    self.lblNiew.frame = CGRectMake(125, 157, 170, 100);
    self.lblNiew.font = tidyHand;
    [self.scrollView addSubview:self.lblNiew];
    
    self.lblOud = [[UILabel alloc] init];
    self.lblOud.text = @"wat zouden ze aan het bouwen zijn?";
    self.lblOud.numberOfLines = 0;
    self.lblOud.frame = CGRectMake(125, 245, 170, 100);
    self.lblOud.font = tidyHand;
    [self.scrollView addSubview:self.lblOud];
    
    self.lblTekenIdee = [[UILabel alloc] init];
    self.lblTekenIdee.text = @"teken nu al jullie ideeën op de foto";
    self.lblTekenIdee.numberOfLines = 0;
    self.lblTekenIdee.frame = CGRectMake(80, 400, 210, 100);
    self.lblTekenIdee.font = tidyHand;
    [self.scrollView addSubview:self.lblTekenIdee];
}

- (void)addButton{
    UIImage *btnTekenen = [UIImage imageNamed:@"btn_tekenen"];
    self.btnTekenen = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnTekenen.frame = CGRectMake(self.frame.size.width/2 - btnTekenen.size.width/2, 500, btnTekenen.size.width, btnTekenen.size.height);
    [self.btnTekenen setBackgroundImage:btnTekenen forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnTekenen];    
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
