//
//  PhotoOverviewViewController.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 07/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoOverviewView.h"
#import "ShowPhotoViewController.h"
#import "CustomPhotoPicker.h"
#import "SaveOrRetakeViewController.h"

@interface PhotoOverviewViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) PhotoOverviewView *view;
@property (nonatomic) NSInteger buttonIndex;
@property (nonatomic, strong) UIImage *photo;
@property (nonatomic, strong) UIImage *squarePhoto;
@property (nonatomic) NSInteger tappedButtonId;
@property (nonatomic, strong) UIImage *imageForView;
@property (nonatomic,strong) UIImagePickerController *imagePicker;
@property (nonatomic,strong) CustomPhotoPicker *photoPickerView;
@property (nonatomic,strong) SaveOrRetakeViewController *saveOrRetakeVC;
@property (nonatomic,strong) ShowPhotoViewController *showPhotoVC;

@end
