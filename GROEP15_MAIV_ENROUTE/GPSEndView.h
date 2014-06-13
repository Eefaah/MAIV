//
//  EndView.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 09/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationBar.h"

@interface GPSEndView : UIView

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *arrDrawnPoints;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic) CGPoint aPoint;
@property (nonatomic, strong) UIButton *btnSave;
@property (nonatomic,strong) NavigationBar *navBar;

- (id)initWithFrame:(CGRect)frame andArr:(NSMutableArray *)arr;

@end
