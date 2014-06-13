//
//  GPSView.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 09/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "GPSView.h"

@implementation GPSView

- (id)initWithFrame:(CGRect)frame andLabels:(NSMutableArray *)labels
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        self.labels = labels;
        
        self.uitleg = [[UitlegView alloc] initWithFrame:frame bgImageName:@"opdracht5_path" labels:self.labels buttonImageName:@"btn_start" andYPos:925];
        [self addSubview:self.uitleg];

        [self navigationBar];
        [self footer];
    }
    return self;
}



- (void) navigationBar{
    UIImage *titel = [UIImage imageNamed:@"opdracht5_titel"];
    
    self.navBar = [[NavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 108) andTitleImage:titel andAddBtn:YES];
    [self addSubview:self.navBar];}

- (void) footer{
    UIImage *footerImage = [UIImage imageNamed:@"opdracht5_skyline"];
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
