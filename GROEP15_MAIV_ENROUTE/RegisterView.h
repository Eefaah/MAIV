//
//  RegisterView.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 04/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationBar.h"

@interface RegisterView : UIView

@property (nonatomic, strong) UIButton *btn_start;
@property (nonatomic, strong) NSString *btnName;
@property (nonatomic, strong) NSMutableArray *arrColorButtons;
@property (nonatomic, strong) NavigationBar *navBar;

@end
