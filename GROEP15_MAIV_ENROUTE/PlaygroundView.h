//
//  PlaygroundView.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 09/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationBar.h"
#import "LabelDataFactory.h"
@interface PlaygroundView : UIView

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIButton *btn_start;
@property (nonatomic, strong) UIButton *btnBack;
@property (nonatomic,strong) NavigationBar *navBar;
@property (nonatomic,strong) NSMutableArray *labels;

- (id)initWithFrame:(CGRect)frame andLabels:(NSMutableArray *)labels;
@end
