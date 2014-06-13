//
//  EndViewController.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 09/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPSEndView.h"

@interface GPSEndViewController : UIViewController

@property (nonatomic, strong) GPSEndView *view;
@property (nonatomic, strong) NSMutableArray *arrDrawingPoints;
@property (nonatomic, strong) NSMutableString *pointsAsString;
@property (nonatomic, strong) UIImage *drawnImage;

- (void)showDrawnShape:(NSMutableArray *)arr andImage:(UIImage *)image;

@end
