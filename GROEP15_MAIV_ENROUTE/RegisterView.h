//
//  RegisterView.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 04/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterView : UIView

@property (nonatomic, strong) UIButton *btn_blauw;
@property (nonatomic, strong) UIButton *btn_donkerpaars;
@property (nonatomic, strong) UIButton *btn_geel;
@property (nonatomic, strong) UIButton *btn_groen;
@property (nonatomic, strong) UIButton *btn_oranje;
@property (nonatomic, strong) UIButton *btn_paars;
@property (nonatomic, strong) UIButton *btn_rood;
@property (nonatomic, strong) UIButton *btn_roze;

@property (nonatomic, strong) UIButton *btn_start;
@property (nonatomic, strong) NSString *btnName;
@property (nonatomic, strong) NSMutableArray *arrColorButtons;

@end
