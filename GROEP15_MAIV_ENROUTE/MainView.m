//
//  MainView.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 04/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "MainView.h"

@implementation MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self addScrollwithframe:frame];
        [self addVlieger];
//        [self addMusic];
        [self addMusic];
        [self addMusicToBtnSenses];
        [self addParticles];
        [self addButtons];
        [self addWindmolentje];
        [self addDuif];
        [self addSwingSet];
        [self addBoot];
        [self addHeaderAndFooter];
    }
    return self;
}

- (void)addScrollwithframe:(CGRect)frame{
    
    UIImage *dottedLine = [UIImage imageNamed:@"verhaal_scrollview"];
    UIImageView *dottedLineImageView = [[UIImageView alloc] initWithImage:dottedLine];
    dottedLineImageView.frame = CGRectMake(0, 0, dottedLineImageView.frame.size.width, dottedLineImageView.frame.size.height);
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:frame];
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(0, dottedLineImageView.frame.size.height);
    [self addSubview:self.scrollView];
    [self.scrollView addSubview:dottedLineImageView];
    [self.scrollView setContentOffset:CGPointMake(0, dottedLineImageView.frame.size.height-frame.size.height)];
    self.scrollView.bounces = YES;

}

- (void)addButtons{
    int yPos = 190;
    self.arrScrollViewButtons = [NSMutableArray array];
    
    for(int i = 1; i < 6; i++){
        
        UIImage *btnImage = [UIImage imageNamed:[NSString stringWithFormat:@"btn_opdracht_%i", i]];
        self.scrollViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.scrollViewButton.frame = CGRectMake(0, yPos, btnImage.size.width, btnImage.size.height);
        [self.scrollViewButton setBackgroundImage:btnImage forState:UIControlStateNormal];
        [self.scrollView addSubview:self.scrollViewButton];
        [self.arrScrollViewButtons addObject:self.scrollViewButton];
        
        yPos += btnImage.size.height + 270;
        
        NSLog(@"yPos %i %i",i,yPos);
    }
}

- (void)addWindmolentje{
    UIImage *windmolentjeStokje = [UIImage imageNamed:@"windmolen_stokje"];
    UIImageView *windmolentjeStokeImageView = [[UIImageView alloc] initWithImage:windmolentjeStokje];
    windmolentjeStokeImageView.frame = CGRectMake(228, 1802, windmolentjeStokje.size.width, windmolentjeStokje.size.height);
    [self.scrollView addSubview:windmolentjeStokeImageView];
    
    UIImage *windmolen = [UIImage imageNamed:@"windmolen"];
    self.windmolen = [[UIImageView alloc] initWithImage:windmolen];
    self.windmolen.frame = CGRectMake(222, 1792, windmolen.size.width, windmolen.size.height);
    [self.scrollView addSubview:self.windmolen];
}

- (void)addDuif{
    UIImage *duif = [UIImage imageNamed:@"duif"];
    self.duif = [[UIImageView alloc] initWithImage:duif];
    self.duif.frame = CGRectMake(0-duif.size.width, 1402, duif.size.width, duif.size.height);
    [self.scrollView addSubview:self.duif];
}

- (void)addSwingSet{
    UIImage *tree = [UIImage imageNamed:@"boom"];
    UIImageView *treeImageView = [[UIImageView alloc] initWithImage:tree];
    treeImageView.frame = CGRectMake(217, 1886, tree.size.width, tree.size.height);
    [self.scrollView addSubview:treeImageView];

    UIImage *swing = [UIImage imageNamed:@"schommel"];
    
//    self.imagelayer = [CALayer layer];
//    self.imagelayer.frame = CGRectMake(220, 2228, swing.size.width, swing.size.height);
//    self.imagelayer.contents = (__bridge id)(swing.CGImage);
//
    self.swing = [[UIImageView alloc] initWithImage:swing];
    self.swing.frame = CGRectMake(230, 1886, swing.size.width, swing.size.height);
    [self.scrollView addSubview:self.swing];
    
//    [self.scrollView.layer addSublayer:self.imagelayer];
//
//    self.imagelayer.affineTransform = CGAffineTransformMakeRotation(180);
    
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
//    animation.fromValue = @1;
//    animation.toValue = @0;
//    animation.duration = 0.3f;
//    [self.imagelayer addAnimation:animation forKey:@"transform.scale.x"];
    
    //self.imagelayer.anchorPoint = CGPointMake(2, 2);
    //self.imagelayer.affineTransform = CGAffineTransformMakeRotation(0.2);
    //set point of rotation
    //self.swing.center = CGPointMake(220, 2258);
    self.swing.layer.affineTransform = CGAffineTransformMakeRotation(0.1);

    //rotate rect
    //self.swing.transform = CGAffineTransformMakeRotation(1.14159265);
    
    [UIView animateWithDuration:0.7f delay:0 options:(UIViewAnimationOptionRepeat |
                                                      UIViewAnimationOptionAutoreverse) animations:^{
        
        self.swing.layer.affineTransform = CGAffineTransformMakeRotation(-0.2);
        
    } completion:^(BOOL finished){
//        [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionRepeat animations:^{
//            
//            self.swing.layer.affineTransform = CGAffineTransformMakeRotation(0.2);
//            
//        } completion:^(BOOL finished){
//        }];
    }];
}

-(void)addBoot{
    UIImage *boot = [UIImage imageNamed:@"boot"];
    self.boot = [[UIImageView alloc] initWithImage:boot];
    self.boot.frame = CGRectMake(320, 1108, boot.size.width, boot.size.height);
    [self.scrollView addSubview:self.boot];
}

-(void)addVlieger{
    UIImage *vlieger = [UIImage imageNamed:@"vlieger"];
    self.vlieger = [[UIImageView alloc] initWithImage:vlieger];
    self.vlieger.frame = CGRectMake(120, 1078, vlieger.size.width, vlieger.size.height);
    [self.scrollView addSubview:self.vlieger];
}

-(void)addMusic{
    UIView *test = [[UIView alloc] initWithFrame:CGRectMake(-20, 570, 320, 200)];
    [self.scrollView addSubview:test];
    
    UIImage *achtste = [UIImage imageNamed:@"achtsteNoot"];
    UIImage *kwartnoot = [UIImage imageNamed:@"kwartNoot"];
    
    self.achtsteNootLayer = [CALayer layer];
    self.achtsteNootLayer.frame = CGRectMake(140, 80, achtste.size.width, achtste.size.height);
    self.achtsteNootLayer.contents = (__bridge id)(achtste.CGImage);
    [test.layer addSublayer:self.achtsteNootLayer];
    
    self.kwartNoot1Layer = [CALayer layer];
    self.kwartNoot1Layer.frame = CGRectMake(180, 80, kwartnoot.size.width, kwartnoot.size.height);
    self.kwartNoot1Layer.contents = (__bridge id)(kwartnoot.CGImage);
    [test.layer addSublayer:self.kwartNoot1Layer];
    
    self.kwartNoot2Layer = [CALayer layer];
    self.kwartNoot2Layer.frame = CGRectMake(100, 100, kwartnoot.size.width, kwartnoot.size.height);
    self.kwartNoot2Layer.contents = (__bridge id)(kwartnoot.CGImage);
    [test.layer addSublayer:self.kwartNoot2Layer];
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 140, 80);
    CGPathAddCurveToPoint(path,NULL,
                          140.0,60.0,
                          100.0,60.0,
                          100.0,0.0);
    
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.path = path;
    pathAnimation.duration = 1.7;
    pathAnimation.repeatCount = HUGE_VALF;
    pathAnimation.removedOnCompletion = YES;
    [self.achtsteNootLayer addAnimation:pathAnimation forKey:nil];
    
    CGMutablePathRef path2 = CGPathCreateMutable();
    CGPathMoveToPoint(path2, NULL, 190, 60);
    CGPathAddCurveToPoint(path2,NULL,
                          230.0,40.0,
                          250.0,20.0,
                          200.0,0.0);
                          
//    CGPathAddCurveToPoint(path2,NULL,
//                          200.0,0,
//                          200,0,
//                          200,0);
    

    CAKeyframeAnimation *pathAnimation2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation2.path = path2;
    pathAnimation2.duration = 1.5;
    pathAnimation2.repeatCount = HUGE_VALF;
    pathAnimation2.removedOnCompletion = YES;
    [self.kwartNoot1Layer addAnimation:pathAnimation2 forKey:@"position"];
    
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = 1.5f;
    opacityAnimation.values = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:1],
                               [NSNumber numberWithFloat:1],
                               [NSNumber numberWithFloat:0],
                               nil];
    opacityAnimation.repeatCount = HUGE_VALF;
    
    CAKeyframeAnimation *opacityAnimationLong = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimationLong.duration = 1.7f;
    opacityAnimationLong.values = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:1],
                               [NSNumber numberWithFloat:1],
                                [NSNumber numberWithFloat:1],
                               [NSNumber numberWithFloat:0],
                               nil];
    opacityAnimationLong.repeatCount = HUGE_VALF;
    
    [self.kwartNoot1Layer addAnimation:opacityAnimation forKey:@"opacity"];
    [self.achtsteNootLayer addAnimation:opacityAnimationLong forKey:@"opacity_long"];
    
    CGMutablePathRef path3 = CGPathCreateMutable();
    CGPathMoveToPoint(path3, NULL, 160, 60);
    CGPathAddCurveToPoint(path3,NULL,
                          170.0,40.0,
                          190.0,40.0,
                          190.0,30.0);
    CGPathAddCurveToPoint(path3,NULL,
                          170.0,30.0,
                          180.0,10.0,
                          180.0,0.0);
    
    CAKeyframeAnimation *pathAnimation3 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation3.path = path3;
    pathAnimation3.duration = 1.9;
    pathAnimation3.repeatCount = HUGE_VALF;
    pathAnimation3.removedOnCompletion = YES;
    
    CAKeyframeAnimation *opacityAnimation3 = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation3.duration = 1.9f;
    opacityAnimation3.values = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:1],
                               [NSNumber numberWithFloat:1],
                               [NSNumber numberWithFloat:0],
                               nil];
    opacityAnimation3.repeatCount = HUGE_VALF;
    
    [self.kwartNoot2Layer addAnimation:pathAnimation3 forKey:@"position"];
    [self.kwartNoot2Layer addAnimation:opacityAnimation3 forKey:@"opacity"];
}

-(void)addMusicToBtnSenses{
    UIView *test = [[UIView alloc] initWithFrame:CGRectMake(20, 490, 320, 200)];
    [self.scrollView addSubview:test];
    
    UIImage *achtste = [UIImage imageNamed:@"achtsteNoot"];
    
    CALayer *achtstenoot = [CALayer layer];
    achtstenoot.frame = CGRectMake(90, 180, achtste.size.width, achtste.size.height);
    achtstenoot.contents = (__bridge id)(achtste.CGImage);
    [test.layer addSublayer:achtstenoot];
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 90, 180);
    CGPathAddCurveToPoint(path,NULL,
                          45,180,
                          45,100,
                          0,100);
    
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.path = path;
    pathAnimation.duration = 1.9;
    pathAnimation.repeatCount = HUGE_VALF;
    pathAnimation.removedOnCompletion = YES;
    
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = 1.9f;
    opacityAnimation.values = [NSArray arrayWithObjects:
                                [NSNumber numberWithFloat:0],
                                [NSNumber numberWithFloat:1],
                               [NSNumber numberWithFloat:1],
                               [NSNumber numberWithFloat:1],
                                [NSNumber numberWithFloat:0],
                                nil];
    opacityAnimation.repeatCount = HUGE_VALF;
    
    [achtstenoot addAnimation:pathAnimation forKey:@"position"];
    [achtstenoot addAnimation:opacityAnimation forKey:@"opacity"];
    
    UIImage *kwartnoot = [UIImage imageNamed:@"kwartNoot"];
    CALayer *kwartnootlayer = [CALayer layer];
    kwartnootlayer.frame = CGRectMake(90, 180, kwartnoot.size.width, kwartnoot.size.height);
    kwartnootlayer.contents = (__bridge id)(kwartnoot.CGImage);
    [test.layer addSublayer:kwartnootlayer];
    
    CGMutablePathRef path2 = CGPathCreateMutable();
    CGPathMoveToPoint(path2, NULL, 90, 180);
    CGPathAddCurveToPoint(path2,NULL,
                          20,180,
                          20,120,
                          0,120);
    
    CAKeyframeAnimation *path2Animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    path2Animation.path = path2;
    path2Animation.duration = 1.5;
    path2Animation.repeatCount = HUGE_VALF;
    path2Animation.removedOnCompletion = YES;
    
    CAKeyframeAnimation *opacity2Animation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacity2Animation.duration = 1.5f;
    opacity2Animation.values = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:0],
                               [NSNumber numberWithFloat:1],
                               [NSNumber numberWithFloat:1],
                               [NSNumber numberWithFloat:1],
                               [NSNumber numberWithFloat:0],
                               nil];
    opacity2Animation.repeatCount = HUGE_VALF;
    
    [kwartnootlayer addAnimation:path2Animation forKey:@"position"];
    [kwartnootlayer addAnimation:opacity2Animation forKey:@"opacity"];
}

-(void)addParticles{
    // emittercell maken --> wat wordt afgevuurd door de emitterlayer
    self.cell = [CAEmitterCell emitterCell];
    
    // onze rook image inladen
    self.cell.contents = (__bridge id)([UIImage imageNamed:@"stof"].CGImage);
    
    // instellen hoe de cell zich moet gedragen
    self.cell.birthRate = 1;
    self.cell.lifetime = 3;
    self.cell.lifetimeRange = 1;
    self.cell.velocity = 50;
    self.cell.velocityRange = 20;
    self.cell.yAcceleration = -30;
    self.cell.name = @"smokeCell";
    self.cell.emissionRange = M_PI;
    self.cell.scale = 0.2;
    self.cell.scaleSpeed = 1;
    self.cell.scaleRange = 0.2;
    self.cell.spin = 1;
    self.cell.alphaSpeed = -0.5;
    
    // emitter aanmaken
    self.emitterLayer = [CAEmitterLayer layer];
    
    // emitter instellen
    self.emitterLayer.emitterSize = CGSizeMake(32, 32);
    self.emitterLayer.emitterPosition = CGPointMake(170, 285);
    self.emitterLayer.emitterCells = @[self.cell];
    [self.scrollView.layer addSublayer:self.emitterLayer];

}

-(void)addHeaderAndFooter{
    UIImage *headerImage = [UIImage imageNamed:@"verhaal_header"];
    UIImageView *header = [[UIImageView alloc] initWithImage:headerImage];
    [header setFrame:CGRectMake(0, 0, headerImage.size.width, headerImage.size.height)];
    [self addSubview:header];
    
    UIImage *footerImage = [UIImage imageNamed:@"verhaal_footer"];
    UIImageView *footer = [[UIImageView alloc] initWithImage:footerImage];
    [footer setFrame:CGRectMake(0, 520, footerImage.size.width, footerImage.size.height)];
    [self addSubview:footer];
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
