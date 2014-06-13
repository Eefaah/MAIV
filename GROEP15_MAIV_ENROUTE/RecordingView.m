//
//  RecordingView.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 10/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "RecordingView.h"

@implementation RecordingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.arrButtons = [NSMutableArray array];
        self.arrPlayButtons = [NSMutableArray array];
        
        [self addImageToScrollView];
        [self navigationBar];
        [self footer];
        [self addLbls];
        [self addBtns];
        [self addPlayBtns];
    }
    
    return self;
}

- (void)addImageToScrollView{
    
    UIImage *infoImage = [UIImage imageNamed:@"opdracht4_path1"];
    UIImageView *infoImageView = [[UIImageView alloc] initWithImage:infoImage];
    infoImageView.frame = CGRectMake(0, 0, infoImage.size.width, infoImage.size.height);
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 70, self.frame.size.width, self.frame.size.height)];
    self.scrollView.contentSize = CGSizeMake(infoImage.size.width, infoImage.size.height + 200);
    
    [self.scrollView addSubview:infoImageView];
    [self addSubview:self.scrollView];
}

- (void)addLbls{
    
    UIFont *tidyHand = [UIFont fontWithName:TIDY_HAND size:18];
    
    UILabel *lbl1 = [[UILabel alloc] init];
    lbl1.frame = CGRectMake(self.frame.size.width/2 - 135, 20, 280, 200);
    lbl1.numberOfLines = 0;
    lbl1.font = tidyHand;
    lbl1.text = @"Ook geluid is dynamiek en de stad kent veel geluiden. Het is aan jullie om ze te registreren";
    [self.scrollView addSubview:lbl1];
    
    UILabel *lblHardGeluid = [[UILabel alloc] init];
    lblHardGeluid.frame = CGRectMake(self.frame.size.width/2 - 110, 210, 100, 40);
    lblHardGeluid.numberOfLines = 0;
    lblHardGeluid.font = tidyHand;
    lblHardGeluid.text = @"hard geluid";
    [self.scrollView addSubview:lblHardGeluid];
}

- (void)addBtns{
    
    self.buttonImage = [UIImage imageNamed:@"btn_record"];
    
    self.btnHard = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnHard.frame = CGRectMake(60, 250, self.buttonImage.size.width, self.buttonImage.size.height);
    [self.btnHard setBackgroundImage:self.buttonImage forState:UIControlStateNormal];
    self.btnHard.tag = 1;
    [self.scrollView addSubview:self.btnHard];
    [self.arrButtons addObject:self.btnHard];
    
    self.btnRustig = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnRustig.frame = CGRectMake(200, 330, self.buttonImage.size.width, self.buttonImage.size.height);
    [self.btnRustig setBackgroundImage:self.buttonImage forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnRustig];
    self.btnRustig.tag = 2;
    [self.arrButtons addObject:self.btnRustig];
    
    self.btnMenselijk = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnMenselijk.frame = CGRectMake(60, 450, self.buttonImage.size.width, self.buttonImage.size.height);
    [self.btnMenselijk setBackgroundImage:self.buttonImage forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnMenselijk];
    self.btnMenselijk.tag = 3;
    [self.arrButtons addObject:self.btnMenselijk];

    self.btnDierlijk = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnDierlijk.frame = CGRectMake(200, 515, self.buttonImage.size.width, self.buttonImage.size.height);
    [self.btnDierlijk setBackgroundImage:self.buttonImage forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnDierlijk];
    self.btnDierlijk.tag = 4;
    [self.arrButtons addObject:self.btnDierlijk];

    self.btnVoertuig = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnVoertuig.frame = CGRectMake(75, 650, self.buttonImage.size.width, self.buttonImage.size.height);
    [self.btnVoertuig setBackgroundImage:self.buttonImage forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnVoertuig];
    self.btnVoertuig.tag = 5;
    [self.arrButtons addObject:self.btnVoertuig];

    self.btnWind = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnWind.frame = CGRectMake(220, 740, self.buttonImage.size.width, self.buttonImage.size.height);
    [self.btnWind setBackgroundImage:self.buttonImage forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnWind];
    self.btnWind.tag = 6;
    [self.arrButtons addObject:self.btnWind];
    
    UIImage *btnTerug = [UIImage imageNamed:@"btnTerugNaarVerhaal"];
    self.btnTerugNaarVerhaal = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnTerugNaarVerhaal.frame = CGRectMake(self.frame.size.width/2 - btnTerug.size.width/2 + 25, 830, btnTerug.size.width, btnTerug.size.height);
    [self.btnTerugNaarVerhaal setBackgroundImage:btnTerug forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnTerugNaarVerhaal];
}

- (void)addPlayBtns{
    
    UIImage *playButton = [UIImage imageNamed:@"opdracht4_btnAfspelen"];
    
    self.btnPlayHard = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnPlayHard.frame = CGRectMake(60, 250, playButton.size.width, playButton.size.height);
    [self.btnPlayHard setBackgroundImage:playButton forState:UIControlStateNormal];
    self.btnPlayHard.tag = 1;
    [self.scrollView addSubview:self.btnPlayHard];
    [self.arrPlayButtons addObject:self.btnPlayHard];
    
    self.btnPlayRustig = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnPlayRustig.frame = CGRectMake(200, 330, playButton.size.width, playButton.size.height);
    [self.btnPlayRustig setBackgroundImage:playButton forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnPlayRustig];
    self.btnPlayRustig.tag = 2;
    [self.arrPlayButtons addObject:self.btnPlayRustig];
    
    self.btnPlayMenselijk = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnPlayMenselijk.frame = CGRectMake(60, 450, playButton.size.width, playButton.size.height);
    [self.btnPlayMenselijk setBackgroundImage:playButton forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnPlayMenselijk];
    self.btnPlayMenselijk.tag = 3;
    [self.arrPlayButtons addObject:self.btnPlayMenselijk];
    
    self.btnPlayDierlijk = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnPlayDierlijk.frame = CGRectMake(200, 515, playButton.size.width, playButton.size.height);
    [self.btnPlayDierlijk setBackgroundImage:playButton forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnPlayDierlijk];
    self.btnPlayDierlijk.tag = 4;
    [self.arrPlayButtons addObject:self.btnPlayDierlijk];
    
    self.btnPlayVoertuig = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnPlayVoertuig.frame = CGRectMake(75, 650, playButton.size.width, playButton.size.height);
    [self.btnPlayVoertuig setBackgroundImage:playButton forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnPlayVoertuig];
    self.btnPlayVoertuig.tag = 5;
    [self.arrPlayButtons addObject:self.btnPlayVoertuig];
    
    self.btnPlayWind = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnPlayWind.frame = CGRectMake(220, 740, playButton.size.width, playButton.size.height);
    [self.btnPlayWind setBackgroundImage:playButton forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnPlayWind];
    self.btnPlayWind.tag = 6;
    [self.arrPlayButtons addObject:self.btnPlayWind];
}

- (void) navigationBar{
    UIImage *navBarImage = [UIImage imageNamed:@"navigationbar"];
    UIImageView *navBarImageView = [[UIImageView alloc] initWithImage:navBarImage];
    navBarImageView.frame = CGRectMake(0, 0, navBarImage.size.width, navBarImage.size.height);
    [self addSubview:navBarImageView];
    
    UIImage *titel = [UIImage imageNamed:@"opdracht4_titel"];
    UIImageView *titelImageView = [[UIImageView alloc] initWithImage:titel];
    titelImageView.frame = CGRectMake(self.frame.size.width/2 - titel.size.width/2 - 5, navBarImage.size.height/2 - titel.size.height/2 - 10, titel.size.width, titel.size.height);
    [self addSubview:titelImageView];
}

- (void) footer{
    UIImage *footerImage = [UIImage imageNamed:@"opdracht4_skyline"];
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
