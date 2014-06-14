//
//  PeopleView.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 07/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "PeopleView.h"

@implementation PeopleView

- (id)initWithFrame:(CGRect)frame andLabels:(NSMutableArray *)labels
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        self.labels = labels;
        
        self.uitleg = [[UitlegView alloc] initWithFrame:frame bgImageName:@"opdracht3_path" labels:self.labels buttonImageName:@"btn_start" andYPos:660];
        [self addSubview:self.uitleg];

        [self navigationBar];
        [self skyline];
    }
    return self;
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
