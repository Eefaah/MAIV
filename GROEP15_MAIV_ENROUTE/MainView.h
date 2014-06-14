//
//  MainView.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 04/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MainView : UIView <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIButton *scrollViewButton;
@property (nonatomic, strong) NSMutableArray *arrScrollViewButtons;
@property (nonatomic, strong) UIImageView *windmolen;
@property (nonatomic, strong) UIImageView *duif;
@property (nonatomic, strong) UIImageView *swing;
@property (nonatomic,strong) UIImageView *boot;
@property (nonatomic,strong) UIImageView *vlieger;
@property (nonatomic,strong) UIImageView *achtsteNoot1;
@property (nonatomic,strong) CALayer *kwartNoot1Layer;
@property (nonatomic,strong) CALayer *kwartNoot2Layer;
@property (nonatomic,strong) CALayer *achtsteNootLayer;
@property (nonatomic,strong) CAEmitterLayer *emitterLayer;
@property (nonatomic,strong) CAEmitterCell *cell;

@property (nonatomic,strong)  CALayer *imagelayer;

@end
