//
//  PhotoOverviewView.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 07/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "PhotoOverviewView.h"

@implementation PhotoOverviewView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        self.arrPhotoLayerButtons = [[NSMutableArray alloc] init];
        // bg image met gele vlek
        UIImage *bgImage = [UIImage imageNamed:@"opdracht3_bg_overview"];
        UIImageView *bgView = [[UIImageView alloc] initWithImage:bgImage];
        bgView.frame = CGRectMake(0, 0, bgImage.size.width, bgImage.size.height);
        [self addSubview:bgView];
        
        [self navigationBar];
        [self addPeopleButtons];
        [self addBtns];
        
        self.dictImages = [NSMutableDictionary dictionary];

    }
    return self;
}

- (void)addBtns{
    UIFont *tidy = [UIFont fontWithName:TIDY_HAND size:17];
    self.lbl_uitleg = [[UILabel alloc] init];
    self.lbl_uitleg.text = @"Tik op een reeds toegevoegde foto om hem volledig te zien.";
    self.lbl_uitleg.frame = CGRectMake(self.frame.size.width/2 - 261/2, 120, 261, 45);
    self.lbl_uitleg.font = tidy;
    self.lbl_uitleg.adjustsFontSizeToFitWidth = NO;
    self.lbl_uitleg.numberOfLines = 0;
    self.lbl_uitleg.lineBreakMode = NSLineBreakByTruncatingMiddle;
    self.lbl_uitleg.textColor = [UIColor blackColor];
    [self addSubview:self.lbl_uitleg];
    
    UIImage *buttonsIndicator = [UIImage imageNamed:@"opdracht3_indicator"];
    self.indicator = [[UIImageView alloc] initWithImage:buttonsIndicator];
    self.indicator.frame = CGRectMake(0, 481, buttonsIndicator.size.width, buttonsIndicator.size.height);
    [self addSubview:self.indicator];
    
    UIImage *saveImage = [UIImage imageNamed:@"btn_bewaar"];
    self.btnSave = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnSave setBackgroundImage:saveImage forState:UIControlStateNormal];
    self.btnSave.frame = CGRectMake(self.frame.size.width/2 - saveImage.size.width/2, 470, saveImage.size.width, saveImage.size.height);
    self.btnSave.alpha = 0;
    [self addSubview:self.btnSave];
}

-(void)removeButtons{
    // bewaar button weghalen
    [self.btnSave setBackgroundImage:[UIImage imageNamed:@"btn_wait_kleiner"] forState:UIControlStateNormal];
}

-(void)changeButton{
    [self.btnSave removeFromSuperview];
    
    UIImage *backToStory = [UIImage imageNamed:@"btn_backToStory"];
    self.btn_story = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn_story setBackgroundImage:backToStory forState:UIControlStateNormal];
    self.btn_story.frame = CGRectMake(self.frame.size.width/2 - backToStory.size.width/2, self.frame.size.height - backToStory.size.height - 15, backToStory.size.width, backToStory.size.height);
    [self addSubview:self.btn_story];
    
    UIImage *backToStoryIndicator = [UIImage imageNamed:@"backToStory_indicator"];
    //self.indicator = [[UIImageView alloc] initWithImage:backToStoryIndicator];
    self.indicator.image = backToStoryIndicator;
    self.indicator.frame = CGRectMake(0, 481, backToStoryIndicator.size.width, backToStoryIndicator.size.height);
    //[self addSubview:self.indicator];
}

- (void)addPeopleButtons{
    
    UIImage *btnToevoegen = [UIImage imageNamed:@"opdracht3_toevoegen"];
    self.arrButtons = [NSMutableArray array];
    
    int yPos = 0;
    for (int i = 1; i < 5; i++) {
                
        self.btnToevoegen = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnToevoegen.frame = CGRectMake(25, 180 + yPos, btnToevoegen.size.width, btnToevoegen.size.height);
        [self.btnToevoegen setBackgroundImage:btnToevoegen forState:UIControlStateNormal];
        self.btnToevoegen.tag = i;
        [self addSubview:self.btnToevoegen];
        
        [self.arrButtons addObject:self.btnToevoegen];
        
        yPos += btnToevoegen.size.height;
    }
}

- (void) navigationBar{
    UIImage *titel = [UIImage imageNamed:@"opdracht3_titel"];
    self.navBar = [[NavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 108) andTitleImage:titel andAddBtn:YES];
    [self addSubview:self.navBar];
}

- (void)maskImage:(UIImage *)image withID:(NSInteger)index{
    
    
    // grab the original image
    UIImage *chosenPicture = image;
    
    self.currentImageInteger = index;
    self.currentImage = chosenPicture;
    
    // scaling set to 2.0 makes the image 1/2 the size.
//    self.currentImage =
//    [UIImage imageWithCGImage:[chosenPicture CGImage]
//                        scale:(chosenPicture.scale * 4.0)
//                  orientation:(chosenPicture.imageOrientation)];
    
    self.photoLayer = [CALayer layer];
    self.photoLayer.frame = CGRectMake(self.frame.size.width/2 - self.currentImage.size.width/2, 180, 270, 270);
    self.photoLayer.contents = (__bridge id)self.currentImage.CGImage;
    [self.layer addSublayer:self.photoLayer];
    
    self.mask = [CAShapeLayer layer];
    self.mask.path = [UIBezierPath bezierPathWithRect:CGRectMake(0,(index-1) * 67.5, 270, 67.5)].CGPath;
    
    self.photoLayerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.photoLayerButton.frame = CGRectMake(25,((index-1) * 67.5) + 180, 270, 67.5);
    self.photoLayerButton.tag = self.currentImageInteger;
    [self addSubview:self.photoLayerButton];
    
    [self.arrPhotoLayerButtons addObject:self.photoLayerButton];
    
    [self.dictImages setObject:self.currentImage forKey:[NSString stringWithFormat:@"%li", (long)self.currentImageInteger]];
    
    NSLog(@"%@", self.dictImages);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MASK_DONE" object:nil];
    
    self.photoLayer.mask = self.mask;

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
