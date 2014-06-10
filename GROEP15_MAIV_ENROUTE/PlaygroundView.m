//
//  PlaygroundView.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 09/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "PlaygroundView.h"

@implementation PlaygroundView

- (id)initWithFrame:(CGRect)frame andLabels:(NSMutableArray *)labels
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        self.labels = labels;
        
        [self addContent];
        [self navigationBar];
        [self footer];
    }
    return self;
}

- (void)addContent{
    
    UIImage *bgImage = [UIImage imageNamed:@"opdracht1_path"];
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
    bgImageView.frame = CGRectMake(0, 0, bgImage.size.width, bgImage.size.height);
    
    // start button toevoegen
    UIImage *btn_startImage = [UIImage imageNamed:@"btn_start"];
    
    self.btn_start = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn_start setBackgroundImage:btn_startImage forState:UIControlStateNormal];
    self.btn_start.frame = CGRectMake(self.frame.size.width/2 - btn_startImage.size.width/2, 975, btn_startImage.size.width, btn_startImage.size.height);
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.scrollView.contentSize = CGSizeMake(bgImage.size.width, bgImage.size.height+80);
    
    [self.scrollView addSubview:bgImageView];
    [self.scrollView addSubview:self.btn_start];
    [self addSubview:self.scrollView];
    
    [self createLabels];
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

- (void)navigationBar{
    UIImage *titel = [UIImage imageNamed:@"opdracht1_titel"];
    
    self.navBar = [[NavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 108) andTitleImage:titel andAddBtn:YES];
    [self addSubview:self.navBar];
}

- (void) footer{
    UIImage *footerImage = [UIImage imageNamed:@"opdracht1_skyline"];
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
