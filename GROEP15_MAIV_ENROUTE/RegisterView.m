//
//  RegisterView.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 04/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "RegisterView.h"

@implementation RegisterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        self.arrColorButtons = [NSMutableArray array];
        
        [self dynamischeButtons];
        [self navigationBar];
        [self skyline];
        
        self.btn_start = [UIButton buttonWithType:UIButtonTypeSystem];
        self.btn_start.frame = CGRectMake(100, 430, 100, 20);
        [self.btn_start setTitle:@"start" forState:UIControlStateNormal];
        [self addSubview:self.btn_start];
    }
    return self;
    
}

- (void)dynamischeButtons{
    
    int xPos = 47;
    int yPos = 130;
    int i = 1;
    
    UIImage *btnImage = [UIImage imageNamed:@"btn_blauw"];
    
    NSArray *arrButtons = @[@"btn_blauw", @"btn_donkerblauw", @"btn_donkerpaars", @"btn_geel", @"btn_groen", @"btn_oranje", @"btn_paars", @"btn_rood", @"btn_roze"];
    
    for(int y = 0; y < 3; y ++){
        for(int x = 0; x < 3; x ++){
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [arrButtons objectAtIndex:i - 1]]] forState:UIControlStateNormal];
            btn.frame = CGRectMake(xPos, yPos, btnImage.size.width, btnImage.size.height);
            btn.tag = i;
            [self addSubview:btn];
            
            xPos += btnImage.size.width + 20;
            i ++;
            
            [self.arrColorButtons addObject:btn];
        }
        
        xPos = 47;
        yPos += btnImage.size.height + 20;

    }
    
}

- (void) navigationBar{
    UIImage *titel = [UIImage imageNamed:@"navigationbar"];
    self.navBar = [[NavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 108) andTitleImage:titel andAddBtn:NO];
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
