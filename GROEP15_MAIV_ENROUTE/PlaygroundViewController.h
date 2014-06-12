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
#import "LabelDataFactory.h"
#import "EndViewController.h"

@interface PlaygroundViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic,strong) CameraOverlayView *cameraView;
@property (nonatomic, strong) PlaygroundView *view;
@property (nonatomic, strong) UIImagePickerController *video;
@property (nonatomic) BOOL recording;
@property (nonatomic,strong) UIImagePickerController *imagePicker;
//@property (nonatomic,strong) SaveOrRetakeViewController *saveVC;
//@property (nonatomic,strong) ResultViewController *resultVC;
@property (nonatomic,strong) NSMutableArray *labels;
@property (nonatomic, strong) EndViewController *endVC;

@property (nonatomic, strong) UIImage *drawnImage;

@end
