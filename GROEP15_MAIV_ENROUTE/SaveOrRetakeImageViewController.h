//
//  SaveOrRetakeImageViewController.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Eva Pieters on 12/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SaveOrRetakeImageView.h"

@interface SaveOrRetakeImageViewController : UIViewController

@property (nonatomic,strong) SaveOrRetakeImageView *view;
@property (nonatomic,strong) UIImage *photo;

-(id)initWithImage:(UIImage *)photo;

@end
