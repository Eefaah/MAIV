//
//  WerkenViewController.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 05/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WerkenView.h"
#import "DrawingViewController.h"

@interface WerkenViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong) WerkenView *view;
@property (nonatomic, strong) DrawingViewController *drawingVC;

@end
