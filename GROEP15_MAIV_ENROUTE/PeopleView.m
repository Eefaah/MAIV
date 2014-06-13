//
//  PeopleView.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 07/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "PeopleView.h"

@implementation PeopleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        [self addScrollView];
        [self navigationBar];
        [self addLabels];
        [self addButton];
        [self skyline];

    }
    return self;
}

- (void)addScrollView{
    
    UIImage *infoImage = [UIImage imageNamed:@"opdracht3_path"];
    UIImageView *infoImageView = [[UIImageView alloc] initWithImage:infoImage];
    infoImageView.frame = CGRectMake(0, 0, infoImage.size.width, infoImage.size.height);
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 70, self.frame.size.width, self.frame.size.height)];
    self.scrollView.contentSize = CGSizeMake(infoImage.size.width, infoImage.size.height + 260);
    
    [self.scrollView addSubview:infoImageView];
    [self addSubview:self.scrollView];
}

- (void)addLabels{
    
    UIFont *tidyHand = [UIFont fontWithName:TIDY_HAND size:17];
    self.lblIphone = [[UILabel alloc] init];
    self.lblIphone.text = @"Geef de iPhone door naar de persoon rechts van jou";
    self.lblIphone.numberOfLines = 0;
    self.lblIphone.frame = CGRectMake(125, 80, 180, 100);
    self.lblIphone.font = tidyHand;
    [self.scrollView addSubview:self.lblIphone];
    
    self.lblGaOpzoek = [[UILabel alloc] init];
    self.lblGaOpzoek.text = @"ga opzoek naar mensen van verschillende origine in de stad";
    self.lblGaOpzoek.numberOfLines = 0;
    self.lblGaOpzoek.frame = CGRectMake(40, 225, 240, 100);
    self.lblGaOpzoek.font = tidyHand;
    [self.scrollView addSubview:self.lblGaOpzoek];
    
    self.lblNeemFoto = [[UILabel alloc] init];
    self.lblNeemFoto.text = @"vraag of je hen mag fotograferen";
    self.lblNeemFoto.numberOfLines = 0;
    self.lblNeemFoto.frame = CGRectMake(100, 295, 210, 100);
    self.lblNeemFoto.font = tidyHand;
    [self.scrollView addSubview:self.lblNeemFoto];
}

- (void)addButton{
    UIImage *btnBeginnen = [UIImage imageNamed:@"opdracht3_btn_beginnen"];
    self.btnBeginnen = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnBeginnen.frame = CGRectMake(self.frame.size.width/2 - btnBeginnen.size.width/2, 570, btnBeginnen.size.width, btnBeginnen.size.height);
    [self.btnBeginnen setBackgroundImage:btnBeginnen forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnBeginnen];
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
