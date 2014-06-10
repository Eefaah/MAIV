//
//  DrawingView.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 05/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EndDrawViewController.h"

@interface DrawingView : UIView

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImage *backgroundImage;

@property (nonatomic, strong) UIImageView *tempDrawImage;
@property (nonatomic, strong) UIImageView *mainImage;

@property (nonatomic, strong) UIButton *btnSave;

@property (nonatomic, strong) UIImageView *startImage;
@property (nonatomic, strong) UIImageView *endImage;
@property (nonatomic, strong) UIImageView *bgImageView;

@property (nonatomic, strong) EndDrawViewController *endDrawVC;

- (id)initWithFrame:(CGRect)frame andImage:(UIImage *)image;
- (void)approveOrDisapproveDrawing;

@end
