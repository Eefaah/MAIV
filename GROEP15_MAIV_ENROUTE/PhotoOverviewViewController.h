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

@interface PhotoOverviewViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) PhotoOverviewView *view;
@property (nonatomic) NSInteger buttonIndex;
@property (nonatomic, strong) UIImage *photo;
@property (nonatomic, strong) UIImage *squarePhoto;
@property (nonatomic) NSInteger tappedButtonId;
@property (nonatomic, strong) UIImage *imageForView;

@end
