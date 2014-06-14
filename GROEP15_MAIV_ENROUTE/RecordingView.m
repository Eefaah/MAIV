//
//  RecordingView.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 10/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "RecordingView.h"

@implementation RecordingView

- (id)initWithFrame:(CGRect)frame andLabels:(NSMutableArray *)labels
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        self.arrButtons = [NSMutableArray array];
        self.arrPlayButtons = [NSMutableArray array];
        self.arrRemoveButtons = [NSMutableArray array];
        
        self.labels = labels;
        
        [self addImageToScrollView];
        [self navigationBar];
        [self createLabels];
        [self footer];
        [self addBtns];
        [self addRemoveBtns];
        [self addPlayBtns];
    }
    
    return self;
}

- (void)addImageToScrollView{
    UIImage *infoImage = [UIImage imageNamed:@"opdracht4_path"];
    UIImageView *infoImageView = [[UIImageView alloc] initWithImage:infoImage];
    infoImageView.frame = CGRectMake(0, 0, infoImage.size.width, infoImage.size.height);
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.scrollView.contentSize = CGSizeMake(infoImage.size.width, infoImage.size.height);
    
    [self.scrollView addSubview:infoImageView];
    
    UIImage *backToStory = [UIImage imageNamed:@"btn_backToStory"];
    self.btn_story = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn_story setBackgroundImage:backToStory forState:UIControlStateNormal];
    self.btn_story.frame = CGRectMake(self.frame.size.width/2 - backToStory.size.width/2, 1354, backToStory.size.width, backToStory.size.height);
    [self.scrollView addSubview:self.btn_story];
    
    UIImage *backToStoryIndicator = [UIImage imageNamed:@"backToStory_indicator"];
    self.indicator = [[UIImageView alloc] initWithImage:backToStoryIndicator];
    self.indicator.frame = CGRectMake(0, 1368, backToStoryIndicator.size.width, backToStoryIndicator.size.height);
    [self.scrollView addSubview:self.indicator];
    
    [self addSubview:self.scrollView];
}

-(void)createLabels{
    for(LabelData *labeldata in self.labels){
        //        NSLog(@"[LabelData lus]");
        //        NSLog(@"labeldata = %@",labeldata.text);
        
        CGRect labelRect = CGRectMake(labeldata.xPos, labeldata.yPos, labeldata.width, labeldata.height);
        
        UILabel *label = [[UILabel alloc] initWithFrame:labelRect];
        
        label.text = labeldata.text;
        label.textColor = [UIColor blackColor];
        label.adjustsFontSizeToFitWidth = NO;
        label.numberOfLines = 0;
        label.lineBreakMode = NSLineBreakByTruncatingMiddle;
        // custom fonts
        label.font = [UIFont fontWithName:TIDY_HAND size:17];
        
        //label.backgroundColor = [UIColor colorWithPatternImage:labeldata.image];
        
        [self.scrollView addSubview:label];
    }
}

- (void)addBtns{
    
    self.buttonImage = [UIImage imageNamed:@"btn_startRecording"];
    UIImage *isrecording = [UIImage imageNamed:@"btn_stop"];
    
    self.btnHard = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnHard.frame = CGRectMake(50, 315, self.buttonImage.size.width, self.buttonImage.size.height);
    [self.btnHard setBackgroundImage:self.buttonImage forState:UIControlStateNormal];
    [self.btnHard setBackgroundImage:isrecording forState:UIControlStateHighlighted];
    
    self.btnHard.tag = 1;
    [self.scrollView addSubview:self.btnHard];
    [self.arrButtons addObject:self.btnHard];
    
    self.btnRustig = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnRustig.frame = CGRectMake(207, self.btnHard.frame.origin.y + self.btnHard.frame.size.height + 90, self.buttonImage.size.width, self.buttonImage.size.height);
    [self.btnRustig setBackgroundImage:self.buttonImage forState:UIControlStateNormal];
    [self.btnRustig setBackgroundImage:isrecording forState:UIControlStateHighlighted];
    [self.scrollView addSubview:self.btnRustig];
    self.btnRustig.tag = 2;
    [self.arrButtons addObject:self.btnRustig];
    
    self.btnMenselijk = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnMenselijk.frame = CGRectMake(23, self.btnRustig.frame.origin.y + self.btnRustig.frame.size.height + 125, self.buttonImage.size.width, self.buttonImage.size.height);
    [self.btnMenselijk setBackgroundImage:self.buttonImage forState:UIControlStateNormal];
    [self.btnMenselijk setBackgroundImage:isrecording forState:UIControlStateHighlighted];
    [self.scrollView addSubview:self.btnMenselijk];
    self.btnMenselijk.tag = 3;
    [self.arrButtons addObject:self.btnMenselijk];

    self.btnDierlijk = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnDierlijk.frame = CGRectMake(217, self.btnMenselijk.frame.origin.y + self.btnMenselijk.frame.size.height + 57, self.buttonImage.size.width, self.buttonImage.size.height);
    [self.btnDierlijk setBackgroundImage:self.buttonImage forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnDierlijk];
    self.btnDierlijk.tag = 4;
    [self.arrButtons addObject:self.btnDierlijk];

    self.btnVoertuig = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnVoertuig.frame = CGRectMake(23, self.btnDierlijk.frame.origin.y + self.btnDierlijk.frame.size.height + 127, self.buttonImage.size.width, self.buttonImage.size.height);
    [self.btnVoertuig setBackgroundImage:self.buttonImage forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnVoertuig];
    self.btnVoertuig.tag = 5;
    [self.arrButtons addObject:self.btnVoertuig];

    self.btnWind = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnWind.frame = CGRectMake(220, self.btnVoertuig.frame.origin.y + self.btnVoertuig.frame.size.height + 110, self.buttonImage.size.width, self.buttonImage.size.height);
    [self.btnWind setBackgroundImage:self.buttonImage forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnWind];
    self.btnWind.tag = 6;
    [self.arrButtons addObject:self.btnWind];
}

- (void)addPlayBtns{
    
    UIImage *playButton = [UIImage imageNamed:@"btn_startTracking"];
    
    self.btnPlayHard = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnPlayHard.frame = CGRectMake(50, 315, playButton.size.width, playButton.size.height);
    [self.btnPlayHard setBackgroundImage:playButton forState:UIControlStateNormal];
    self.btnPlayHard.tag = 1;
    [self.scrollView addSubview:self.btnPlayHard];
    [self.arrPlayButtons addObject:self.btnPlayHard];
    
    self.btnPlayRustig = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnPlayRustig.frame = CGRectMake(207, self.btnHard.frame.origin.y + self.btnHard.frame.size.height + 90, self.buttonImage.size.width, self.buttonImage.size.height);
    [self.btnPlayRustig setBackgroundImage:playButton forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnPlayRustig];
    self.btnPlayRustig.tag = 2;
    [self.arrPlayButtons addObject:self.btnPlayRustig];
    
    self.btnPlayMenselijk = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnPlayMenselijk.frame = CGRectMake(23, self.btnRustig.frame.origin.y + self.btnRustig.frame.size.height + 125, self.buttonImage.size.width, self.buttonImage.size.height);
    [self.btnPlayMenselijk setBackgroundImage:playButton forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnPlayMenselijk];
    self.btnPlayMenselijk.tag = 3;
    [self.arrPlayButtons addObject:self.btnPlayMenselijk];
    
    self.btnPlayDierlijk = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnPlayDierlijk.frame = CGRectMake(217, self.btnMenselijk.frame.origin.y + self.btnMenselijk.frame.size.height + 57, self.buttonImage.size.width, self.buttonImage.size.height);
    [self.btnPlayDierlijk setBackgroundImage:playButton forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnPlayDierlijk];
    self.btnPlayDierlijk.tag = 4;
    [self.arrPlayButtons addObject:self.btnPlayDierlijk];
    
    self.btnPlayVoertuig = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnPlayVoertuig.frame = CGRectMake(23, self.btnDierlijk.frame.origin.y + self.btnDierlijk.frame.size.height + 127, self.buttonImage.size.width, self.buttonImage.size.height);
    [self.btnPlayVoertuig setBackgroundImage:playButton forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnPlayVoertuig];
    self.btnPlayVoertuig.tag = 5;
    [self.arrPlayButtons addObject:self.btnPlayVoertuig];
    
    self.btnPlayWind = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnPlayWind.frame = CGRectMake(220, self.btnVoertuig.frame.origin.y + self.btnVoertuig.frame.size.height + 110, self.buttonImage.size.width, self.buttonImage.size.height);
    [self.btnPlayWind setBackgroundImage:playButton forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnPlayWind];
    self.btnPlayWind.tag = 6;
    [self.arrPlayButtons addObject:self.btnPlayWind];
}

- (void)addRemoveBtns{
    
    UIImage *removeButton1 = [UIImage imageNamed:@"btn_delete_1"];
    self.btnRemoveHard = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnRemoveHard.frame = CGRectMake(110, 315, removeButton1.size.width, removeButton1.size.height);
    [self.btnRemoveHard setBackgroundImage:removeButton1 forState:UIControlStateNormal];
    self.btnRemoveHard.tag = 1;
    [self.scrollView addSubview:self.btnRemoveHard];
    [self.arrRemoveButtons addObject:self.btnRemoveHard];
    
    UIImage *removeButton2 = [UIImage imageNamed:@"btn_delete_2"];
    self.btnRemoveRustig = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnRemoveRustig.frame = CGRectMake(135, 496, removeButton2.size.width, removeButton2.size.height);
    [self.btnRemoveRustig setBackgroundImage:removeButton2 forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnRemoveRustig];
    self.btnRemoveRustig.tag = 2;
    [self.arrRemoveButtons addObject:self.btnRemoveRustig];

    UIImage *removeButton3 = [UIImage imageNamed:@"btn_delete_3"];
    self.btnRemoveMenselijk = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnRemoveMenselijk.frame = CGRectMake(80, 665, removeButton3.size.width, removeButton3.size.height);
    [self.btnRemoveMenselijk setBackgroundImage:removeButton3 forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnRemoveMenselijk];
    self.btnRemoveMenselijk.tag = 3;
    [self.arrRemoveButtons addObject:self.btnRemoveMenselijk];

    UIImage *removeButton4 = [UIImage imageNamed:@"btn_delete_4"];
    self.btnRemoveDierlijk = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnRemoveDierlijk.frame = CGRectMake(150, 810, removeButton4.size.width, removeButton4.size.height);
    [self.btnRemoveDierlijk setBackgroundImage:removeButton4 forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnRemoveDierlijk];
    self.btnRemoveDierlijk.tag = 4;
    [self.arrRemoveButtons addObject:self.btnRemoveDierlijk];

    UIImage *removeButton5 = [UIImage imageNamed:@"btn_delete_5"];
    self.btnRemoveVoertuig = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnRemoveVoertuig.frame = CGRectMake(75, 1005, removeButton5.size.width, removeButton5.size.height);
    [self.btnRemoveVoertuig setBackgroundImage:removeButton5 forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnRemoveVoertuig];
    self.btnPlayVoertuig.tag = 5;
    [self.arrRemoveButtons addObject:self.btnRemoveVoertuig];

    UIImage *removeButton6 = [UIImage imageNamed:@"btn_delete_6"];
    self.btnRemoveWind = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnRemoveWind.frame = CGRectMake(150, 1170, removeButton6.size.width, removeButton6.size.height);
    [self.btnRemoveWind setBackgroundImage:removeButton6 forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnRemoveWind];
    self.btnRemoveWind.tag = 6;
    [self.arrRemoveButtons addObject:self.btnRemoveWind];
}

- (void) navigationBar{
    UIImage *titel = [UIImage imageNamed:@"opdracht4_titel"];
    
    self.navBar = [[NavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 108) andTitleImage:titel andAddBtn:YES];
    [self addSubview:self.navBar];
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
