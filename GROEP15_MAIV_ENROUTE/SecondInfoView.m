//
//  SecondInfoView.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 06/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "SecondInfoView.h"

@implementation SecondInfoView

- (id)initWithFrame:(CGRect)frame andLabels:(NSMutableArray *)labels
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        self.labels = labels;
        
        self.uitleg = [[UitlegView alloc] initWithFrame:frame bgImageName:@"opdracht7_path2" labels:self.labels buttonImageName:@"btn_tekenen" andYPos:600];
        [self addSubview:self.uitleg];
        [self navigationBar];
        
        [self navigationBar];
        [self skyline];
    }
    return self;
}


- (void) navigationBar{
    UIImage *titel = [UIImage imageNamed:@"opdracht7_titel"];
    self.navBar = [[NavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 108) andTitleImage:titel andAddBtn:YES];
    [self addSubview:self.navBar];
}

- (void)skyline{
    UIImage *skylineImage = [UIImage imageNamed:@"opdracht7_skyline"];
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
