//
//  RegisterViewController.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 04/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterView.h"

@interface RegisterViewController : UIViewController

@property (nonatomic, strong) RegisterView *view;

@property (nonatomic) CGRect bounds;
@property (nonatomic) int colorId;

- (instancetype)initWithBounds:(CGRect)bounds;


@end
