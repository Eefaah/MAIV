//
//  GPSViewController.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 09/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPSView.h"
#import "MapViewController.h"

@interface GPSViewController : UIViewController

@property (nonatomic, strong) GPSView *view;
@property (nonatomic, strong) NSMutableArray *arrDrawingPoints;
@property (nonatomic, strong) UIImage *drawnImage;
@property (nonatomic, strong) NSMutableArray *labels;
@end
