//
//  ShowPhotoViewController.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 07/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowPhotoView.h"

@interface ShowPhotoViewController : UIViewController

@property (nonatomic, strong) ShowPhotoView *view;
@property (nonatomic, strong) UIImage *takenPhoto;
@property (nonatomic) NSInteger buttonIndex;

- (void)initWithImage:(UIImage *)image andId:(NSInteger)index;

@end
