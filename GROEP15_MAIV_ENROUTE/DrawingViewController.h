//
//  DrawingViewController.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 05/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawingView.h"
#import "EndDrawViewController.h"

@interface DrawingViewController : UIViewController

@property (nonatomic, strong) DrawingView *view;
@property (nonatomic, strong) EndDrawViewController *endDrawVC;

@property (nonatomic, strong) UIImage *image;

@property (nonatomic) CGPoint lastPoint;
@property (nonatomic) CGFloat brush;
@property (nonatomic) CGFloat opacity;
@property (nonatomic) BOOL mouseSwiped;

@property (nonatomic) BOOL beginDraw;
@property (nonatomic) BOOL endDraw;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
- (void)updateWithImage:(UIImage *)image;
@end
