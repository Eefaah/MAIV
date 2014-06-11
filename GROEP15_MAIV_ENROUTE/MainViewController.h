//
//  MainViewController.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 04/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainView.h"
#import "RegisterViewController.h"
#import "WerkenViewController.h"
#import "PlaygroundViewController.h"
#import "MainZintuigViewController.h"

@interface MainViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) MainView *view;
@property (nonatomic, strong) RegisterViewController *registerVC;
@property (nonatomic, strong) NSArray *arrClasses;
@property (nonatomic, strong) NSString *className;
@property (nonatomic) float xduif;
@property (nonatomic, strong) WerkenViewController *werkenVC;
@property (nonatomic,strong) MainZintuigViewController *zintuigVC;

@property (nonatomic) float xBoot;

@end
