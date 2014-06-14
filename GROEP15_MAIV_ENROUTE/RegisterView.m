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
        
        UIImage *bgImage = [UIImage imageNamed:@"mainscreen_backgroundImage"];
        
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
        bgImageView.frame = CGRectMake(0, 0, bgImage.size.width, bgImage.size.height);
        [self addSubview:bgImageView];
        
        [self inhoud];
        [self dynamischeButtons];
        [self navigationBar];
        [self skyline];
    }
    return self;
    
}

-(void)inhoud{
    
    self.lblKies = [[UILabel alloc] init];
    self.lblKies.text = @"Kies een kleur voor jullie groep";
    self.lblKies.frame = CGRectMake(32, 117, 275, 30);
    self.lblKies.font = [UIFont fontWithName:TIDY_HAND size:17];
    self.lblKies.textColor = [UIColor blackColor];
    [self addSubview:self.lblKies];
    
    UIImage *btnStart = [UIImage imageNamed:@"btn_start_mainscreen"];
    
    self.btn_start = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn_start setBackgroundImage:btnStart forState:UIControlStateNormal];
    self.btn_start.frame = CGRectMake(self.frame.size.width/2 - btnStart.size.width/2, 430, btnStart.size.width, btnStart.size.height);
    [self.btn_start setHidden:YES];
    [self addSubview:self.btn_start];
}

- (void)dynamischeButtons{
    
    int xPos = 37;
    int yPos = 168;
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
            
            xPos += btnImage.size.width + 30;
            i ++;
            
            [self.arrColorButtons addObject:btn];
        }
        
        xPos = 37;
        yPos += btnImage.size.height + 20;

    }
    
}

- (void) navigationBar{
    UIImage *titel = [UIImage imageNamed:@"mainscreen_titel"];
    self.navBar = [[NavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 108) andTitleImage:titel andAddBtn:NO];
    [self addSubview:self.navBar];
}

- (void)skyline{
    UIImage *skylineImage = [UIImage imageNamed:@"skyline"];
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
