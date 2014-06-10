//
//  PlaygroundViewController.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 09/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaygroundView.h"
#import "CameraOverlayView.h"
#import "SaveOrRetakeViewController.h"
#import "ResultViewController.h"
#import "LabelDataFactory.h"

@interface PlaygroundViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic,strong) CameraOverlayView *cameraView;
@property (nonatomic, strong) PlaygroundView *view;
@property (nonatomic, strong) UIImagePickerController *video;
@property (nonatomic) BOOL recording;
@property (nonatomic,strong) UIImagePickerController *imagePicker;
@property (nonatomic,strong) SaveOrRetakeViewController *saveVC;
@property (nonatomic,strong) ResultViewController *resultVC;
@property (nonatomic,strong) NSMutableArray *labels;

@end
