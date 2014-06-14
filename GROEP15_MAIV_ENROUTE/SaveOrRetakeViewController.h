//
//  SaveOrRetakeViewController.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Eva Pieters on 14/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SaveOrRetakeView.h"

@interface SaveOrRetakeViewController : UIViewController
@property (nonatomic,strong) SaveOrRetakeView *view;
@property (nonatomic,strong) UIImage *photo;

-(id)initWithImage:(UIImage *)photo;
@end
