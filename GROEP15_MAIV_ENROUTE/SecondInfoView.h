//
//  SecondInfoView.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 06/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationBar.h"
#import "UitlegView.h"

@interface SecondInfoView : UIView

@property (nonatomic,strong) NavigationBar *navBar;
@property (nonatomic,strong) UitlegView *uitleg;
@property (nonatomic,strong) NSMutableArray *labels;

- (id)initWithFrame:(CGRect)frame andLabels:(NSMutableArray *)labels;

@end
