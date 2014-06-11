//
//  DrawingScrollView.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 06/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "DrawingScrollView.h"

@implementation DrawingScrollView

- (id)initWithFrame:(CGRect)frame andArray:(NSMutableArray *)arrDrawings
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        self.arrDrawings = [NSMutableArray array];
        self.arrDrawings = arrDrawings;
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:frame];
        [self addSubview:self.scrollView];
        
        int xPos = 80;
        
        for(UIImage *image in self.arrDrawings){
            
            UIImageView *drawingView = [[UIImageView alloc] initWithImage:image];
            drawingView.frame = CGRectMake(xPos, 145, image.size.width/2, image.size.height/2);
            [self.scrollView addSubview:drawingView];
            xPos += image.size.width/2;
        }
        
        self.scrollView.contentSize = CGSizeMake(xPos, 0);
    }
    
    [self addLabel];
    [self navigationBar];
    [self addButtons];
    
    return self;
}

- (void) navigationBar{
    UIImage *titel = [UIImage imageNamed:@"opdracht7_titel"];
    self.navBar = [[NavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 108) andTitleImage:titel andAddBtn:YES];
    [self addSubview:self.navBar];
}

- (void)addLabel{
    
    UIFont *dosis = [UIFont fontWithName:TIDY_HAND size:17];
    self.lblJullieTekeningen = [[UILabel alloc] init];
    self.lblJullieTekeningen.text = @"Dit zijn jullie tekeningen";
    self.lblJullieTekeningen.frame = CGRectMake(54, 130, 300, 30);
    self.lblJullieTekeningen.font = dosis;
    self.lblJullieTekeningen.textColor = [UIColor blackColor];
    [self addSubview:self.lblJullieTekeningen];
}

- (void)addButtons{
    
    UIImage *addImage = [UIImage imageNamed:@"btn_toevoegen"];
    self.btnAdd = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnAdd.frame = CGRectMake(35, 462, addImage.size.width, addImage.size.height);
    [self.btnAdd setBackgroundImage:addImage forState:UIControlStateNormal];
    [self addSubview:self.btnAdd];
    
    UIImage *okImage = [UIImage imageNamed:@"btn_bewaar"];
    self.btnOk = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnOk.frame = CGRectMake(self.frame.size.width - okImage.size.width - 30, 455, okImage.size.width, okImage.size.height);
    [self.btnOk setBackgroundImage:okImage forState:UIControlStateNormal];
    [self addSubview:self.btnOk];
}

//- (void)getImagesFromServer:(UIImage *)image{
//    
//    NSLog(@"get images from server");
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//    imageView.frame = CGRectMake(self.frame.size.width/2 - image.size.width/4, 155, image.size.width/2, image.size.height/2);
//    [self.scrollView addSubview:imageView];
//    
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
