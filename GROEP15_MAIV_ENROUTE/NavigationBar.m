//
//  NavigationBar.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Eva Pieters on 10/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "NavigationBar.h"

@implementation NavigationBar

- (id)initWithFrame:(CGRect)frame andTitleImage:(UIImage *)title andAddBtn:(BOOL)add
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImage *navBarImage = [UIImage imageNamed:@"navigationbar"];
        UIImageView *navBarImageView = [[UIImageView alloc] initWithImage:navBarImage];
        navBarImageView.frame = CGRectMake(0, 0, navBarImage.size.width, navBarImage.size.height);
        [self addSubview:navBarImageView];
        
        UIImage *titel = title;
        UIImageView *titelImageView = [[UIImageView alloc] initWithImage:titel];
        titelImageView.frame = CGRectMake(self.frame.size.width/2 - titel.size.width/2, navBarImage.size.height/2 - titel.size.height/2, titel.size.width, titel.size.height);
        [self addSubview:titelImageView];
        
        if(add){
            UIImage *btn_backToMap = [UIImage imageNamed:@"btn_backToMap"];
            
            self.btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.btnBack setBackgroundImage:btn_backToMap forState:UIControlStateNormal];
            self.btnBack.frame = CGRectMake(9, 35, btn_backToMap.size.width, btn_backToMap.size.height);
            //[self.btnBack setTitle:@"back" forState:UIControlStateNormal];
            [self addSubview:self.btnBack];
        }
    }
    return self;
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
