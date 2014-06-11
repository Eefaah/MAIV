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
#import "EndDrawViewController.h"
#import "DrawingScrollViewController.h"
#import "SecondInfoViewController.h"
#import "CustomPhotoPicker.h"

@interface WerkenViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic,strong) NSMutableArray *labels;

@property (nonatomic, strong) WerkenView *view;
@property (nonatomic, strong) DrawingViewController *drawingVC;
@property (nonatomic, strong) UIImage *drawnImage;
@property (nonatomic, strong) EndDrawViewController *endDrawVC;
@property (nonatomic, strong) UIImage *photo;
@property (nonatomic, strong) DrawingScrollViewController *drawingScrollVC;
@property (nonatomic, strong) SecondInfoViewController *secondInfoVC;
@property (nonatomic,strong) CustomPhotoPicker *photoPickerView;
@property (nonatomic,strong) UIImagePickerController *imagePicker;

@end
