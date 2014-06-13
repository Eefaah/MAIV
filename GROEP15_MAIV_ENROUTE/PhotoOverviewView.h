//
//  PhotoOverviewView.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 07/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowPhotoViewController.h"

@interface PhotoOverviewView : UIView

@property (nonatomic, strong) UIButton *btnToevoegen;
@property (nonatomic, strong) NSMutableArray *arrButtons;
@property (nonatomic, strong) CAShapeLayer *mask;
@property (nonatomic, strong) CALayer *photoLayer;
@property (nonatomic, strong) UIImage *currentImage;
@property (nonatomic) NSInteger currentImageInteger;
@property (nonatomic, strong) NSMutableDictionary *dictImages;
@property (nonatomic, strong) UIButton *photoLayerButton;
@property (nonatomic, strong) UIButton *btnSave;
@property (nonatomic, strong) NSMutableArray *arrPhotos;

- (void)maskImage:(UIImage *)image withID:(NSInteger)index;

@end
