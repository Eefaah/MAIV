//
//  WerkenView.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 05/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationBar.h"
#import "UitlegView.h"

@interface WerkenView : UIView

@property (nonatomic, strong) UIButton *btnStart;
@property (nonatomic, strong) UIButton *btnBack;
@property (nonatomic,strong) NavigationBar *navBar;
@property (nonatomic,strong) NSMutableArray *labels;
@property (nonatomic,strong) UitlegView *uitleg;

- (id)initWithFrame:(CGRect)frame andLabels:(NSMutableArray *)labels;
@end
