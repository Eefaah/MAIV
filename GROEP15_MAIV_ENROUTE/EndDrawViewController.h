//
//  EndDrawViewController.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 06/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EndDrawView.h"
#import "DrawingScrollViewController.h"

@interface EndDrawViewController : UIViewController

@property (nonatomic, strong) EndDrawView *view;
@property (nonatomic, strong) DrawingScrollViewController *drawingScrollVC;

@property (nonatomic, strong) UIImage *drawnImage;
@property (nonatomic, strong) UIImageView *drawnImageViewController;
@property (nonatomic, strong) NSMutableArray *arrDrawings;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andImage:(UIImage *)drawnImage;

@end
