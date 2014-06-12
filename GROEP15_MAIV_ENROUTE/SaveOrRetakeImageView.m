//
//  SaveOrRetakeImageView.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Eva Pieters on 12/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "SaveOrRetakeImageView.h"

@implementation SaveOrRetakeImageView

- (id)initWithFrame:(CGRect)frame andImage:(UIImage *)photo
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        self.photo = photo;
        UIImageView *photoView = [[UIImageView alloc]initWithImage:self.photo];
        photoView.frame = CGRectMake(self.frame.size.width/2 - (self.photo.size.width/5.5)/2, self.frame.size.height/2 - (self.photo.size.height/5.5)/2, self.photo.size.width/5.5, self.photo.size.height/5.5);
        [self addSubview:photoView];
        
        [self makeButtons];
        [self navigationBar];
    }
    return self;
}
         
-(void)makeButtons{
    UIImage *btn_retake = [UIImage imageNamed:@"btn_opnieuw"];
    self.btn_retake = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn_retake setBackgroundImage:btn_retake forState:UIControlStateNormal];
    self.btn_retake.frame = CGRectMake(32, self.frame.size.height-btn_retake.size.height - 20, btn_retake.size.width, btn_retake.size.height);
    [self addSubview:self.btn_retake];
    
    UIImage *btn_ok = [UIImage imageNamed:@"btn_ok"];
    self.btn_use = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn_use setBackgroundImage:btn_ok forState:UIControlStateNormal];
    self.btn_use.frame = CGRectMake(self.btn_retake.frame.origin.x + btn_retake.size.width + 122, self.frame.size.height - btn_ok.size.height - 20, btn_ok.size.width, btn_ok.size.height);
    [self addSubview:self.btn_use];
}

- (void) navigationBar{
    UIImage *titel = [UIImage imageNamed:@"opdracht7_titel"];
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
