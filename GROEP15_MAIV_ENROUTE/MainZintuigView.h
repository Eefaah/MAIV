//
//  MainZintuigView.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Eva Pieters on 11/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationBar.h"
#import "UitlegView.h"

@interface MainZintuigView : UIView
@property (nonatomic,strong) NavigationBar *navBar;
@property (nonatomic,strong) UitlegView *uitleg;
@property (nonatomic,strong) NSMutableArray *labels;
- (id)initWithFrame:(CGRect)frame andLabels:(NSMutableArray *)labels;
@end
