//
//  PeopleViewController.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 07/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PeopleView.h"
#import "PhotoOverviewViewController.h"

@interface PeopleViewController : UIViewController

@property (nonatomic, strong) PeopleView *view;
@property (nonatomic, strong) UIImage *photo;
@property (nonatomic, strong) PhotoOverviewViewController *photoOverviewVC;

@end
