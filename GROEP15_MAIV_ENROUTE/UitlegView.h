//
//  UitlegView.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Eva Pieters on 11/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LabelDataFactory.h"

@interface UitlegView : UIView

@property (nonatomic,strong) UIButton *btn_start;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) NSMutableArray *labels;
- (id)initWithFrame:(CGRect)frame bgImageName:(NSString *)bgImageName labels:(NSMutableArray *)labels buttonImageName:(NSString *)btnImageName andYPos:(int)yPos;
@end
