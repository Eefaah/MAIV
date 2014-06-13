//
//  MainZintuigView.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Eva Pieters on 11/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "MainZintuigView.h"

@implementation MainZintuigView

- (id)initWithFrame:(CGRect)frame andLabels:(NSMutableArray *)labels
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.labels = labels;
        self.backgroundColor = [UIColor whiteColor];
        
        self.uitleg = [[UitlegView alloc] initWithFrame:frame bgImageName:@"opdracht2_path" labels:self.labels buttonImageName:@"btn_kaart" andYPos:347];
        [self addSubview:self.uitleg];
        [self navigationBar];
        
        UIImage *skyline = [UIImage imageNamed:@"opdracht2_skyline"];
        UIImageView *skylineView = [[UIImageView alloc] initWithImage:skyline];
        [skylineView setFrame:CGRectMake(0, frame.size.height-skyline.size.height, skyline.size.width, skyline.size.height)];
        [self addSubview:skylineView];
    }
    return self;
}

-(void)addContents{
    
}

- (void) navigationBar{
    UIImage *titel = [UIImage imageNamed:@"opdracht2_titel"];
    self.navBar = [[NavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 108) andTitleImage:titel andAddBtn:YES];
    [self addSubview:self.navBar];
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
