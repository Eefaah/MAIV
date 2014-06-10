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
                
        UIButton *btnBlauw = [self createButtonWithName:@"btn_blauw" xPos:10 andyPos:150 andId:1];
        UIButton *btnDonkerpaars = [self createButtonWithName:@"btn_donkerpaars" xPos:btnBlauw.frame.origin.x + btnBlauw.frame.size.width + 20 andyPos:150 andId:2];
        UIButton *btnGeel = [self createButtonWithName:@"btn_geel" xPos:btnDonkerpaars.frame.origin.x + btnBlauw.frame.size.width + 20 andyPos:150 andId:3];
        UIButton *btnGroen = [self createButtonWithName:@"btn_groen" xPos:btnGeel.frame.origin.x + btnGeel.frame.size.width + 20 andyPos:150 andId:4];
        
        UIButton *btnOranje = [self createButtonWithName:@"btn_oranje" xPos:10 andyPos:240 andId:5];
        UIButton *btnPaars = [self createButtonWithName:@"btn_paars" xPos:btnOranje.frame.origin.x + btnBlauw.frame.size.width + 20 andyPos:240 andId:6];
        UIButton *btnRood = [self createButtonWithName:@"btn_rood" xPos:btnPaars.frame.origin.x + btnBlauw.frame.size.width + 20 andyPos:240 andId:7];
        UIButton *btnRoze = [self createButtonWithName:@"btn_roze" xPos:btnRood.frame.origin.x + btnBlauw.frame.size.width + 20 andyPos:240 andId:8];
        
        [self addSubview:btnBlauw];
        [self addSubview:btnDonkerpaars];
        [self addSubview:btnGeel];
        [self addSubview:btnGroen];
        [self addSubview:btnOranje];
        [self addSubview:btnPaars];
        [self addSubview:btnRood];
        [self addSubview:btnRoze];
        
        self.arrColorButtons = [NSMutableArray array];
        
        [self.arrColorButtons addObject:btnBlauw];
        [self.arrColorButtons addObject:btnDonkerpaars];
        [self.arrColorButtons addObject:btnGeel];
        [self.arrColorButtons addObject:btnGroen];
        [self.arrColorButtons addObject:btnOranje];
        [self.arrColorButtons addObject:btnPaars];
        [self.arrColorButtons addObject:btnRood];
        [self.arrColorButtons addObject:btnRoze];
        
        UIImage *startBtnImage = [UIImage imageNamed:@"btn_start"];
        UIImageView *startBtnImageView = [[UIImageView alloc] initWithImage:startBtnImage];
        
        self.btn_start = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btn_start.frame = CGRectMake(self.frame.size.width/2 - startBtnImageView.frame.size.width/2, self.frame.size.height - 230, startBtnImageView.frame.size.width, startBtnImageView.frame.size.height);
        [self.btn_start setBackgroundImage:startBtnImage forState:UIControlStateNormal];
        [self addSubview:self.btn_start];
        
        UIImage *btnImage = [UIImage imageNamed:@"skyline"];
        UIImageView *btnImageView = [[UIImageView alloc] initWithImage:btnImage];
        btnImageView.frame = CGRectMake(0, self.frame.size.height - btnImage.size.height, btnImage.size.width, btnImage.size.height);
        
        [self addSubview:btnImageView];
        
    }
    return self;
}

- (UIButton *)createButtonWithName:(NSString *)btnName xPos:(int)xPos andyPos:(int)yPos andId:(int)id{
    
    UIImage *btnImage = [UIImage imageNamed:btnName];
    UIImageView *btnImageView = [[UIImageView alloc] initWithImage:btnImage];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(xPos, yPos, btnImageView.frame.size.width, btnImageView.frame.size.height);
    btn.tag = id;
    [btn setBackgroundImage:btnImage forState:UIControlStateNormal];
    
    return btn;
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
