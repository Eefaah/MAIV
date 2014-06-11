//
//  MainZintuigViewController.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Eva Pieters on 11/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainZintuigView.h"
#import "MapViewController.h"
#import "Uitleg2ViewController.h"

@interface MainZintuigViewController : UIViewController
@property (nonatomic,strong) MainZintuigView *view;
@property (nonatomic,strong) NSMutableArray *labels;
@property (nonatomic,strong) MapViewController *mapVC;
@property (nonatomic,strong) Uitleg2ViewController *uitleg2;

@end
