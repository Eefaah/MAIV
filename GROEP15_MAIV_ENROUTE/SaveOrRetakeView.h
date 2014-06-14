//
//  SaveOrRetakeView.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Eva Pieters on 14/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationBar.h"

@interface SaveOrRetakeView : UIView

@property (nonatomic,strong) NavigationBar *navBar;
@property (nonatomic,strong) UIImage *photo;
@property (nonatomic,strong) UIButton *btn_retake;
@property (nonatomic,strong) UIButton *btn_use;

- (id)initWithFrame:(CGRect)frame andImage:(UIImage *)photo;

@end
