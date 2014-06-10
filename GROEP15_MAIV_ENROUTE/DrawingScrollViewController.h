//
//  DrawingScrollViewController.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 06/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawingScrollView.h"

@interface DrawingScrollViewController : UIViewController

@property (nonatomic, strong) DrawingScrollView *view;
@property (nonatomic, strong) NSMutableArray *arrDrawings;
@property (nonatomic, strong) NSString *imagePath;
@property (nonatomic, strong) NSMutableArray *arrImagePaths;

@end
