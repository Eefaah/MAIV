//
//  RecordingView.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 10/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationBar.h"

@interface RecordingView : UIView

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIButton *btnHard;
@property (nonatomic, strong) UIButton *btnRustig;
@property (nonatomic, strong) UIButton *btnMenselijk;
@property (nonatomic, strong) UIButton *btnDierlijk;
@property (nonatomic, strong) UIButton *btnVoertuig;
@property (nonatomic, strong) UIButton *btnWind;

@property (nonatomic, strong) UIButton *btnPlayHard;
@property (nonatomic, strong) UIButton *btnPlayRustig;
@property (nonatomic, strong) UIButton *btnPlayMenselijk;
@property (nonatomic, strong) UIButton *btnPlayDierlijk;
@property (nonatomic, strong) UIButton *btnPlayVoertuig;
@property (nonatomic, strong) UIButton *btnPlayWind;

@property (nonatomic, strong) UIImage *buttonImage;
@property (nonatomic, strong) UIButton *btnTerugNaarVerhaal;
@property (nonatomic, strong) NSMutableArray *arrButtons;
@property (nonatomic, strong) NSMutableArray *arrPlayButtons;
@property (nonatomic, strong) UIButton *btnPlay;

@property (nonatomic,strong) NavigationBar *navBar;


@end
