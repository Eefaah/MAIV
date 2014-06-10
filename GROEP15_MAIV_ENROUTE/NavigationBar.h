//
//  NavigationBar.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Eva Pieters on 10/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationBar : UIView
@property (nonatomic,strong) UIButton *btnBack;
- (id)initWithFrame:(CGRect)frame andTitleImage:(UIImage *)title andAddBtn:(BOOL)add;
@end
