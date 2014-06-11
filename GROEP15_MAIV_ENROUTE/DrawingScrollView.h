//
//  DrawingScrollView.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 06/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationBar.h"

@interface DrawingScrollView : UIView

@property (nonatomic, strong) NSMutableArray *arrDrawings;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *lblJullieTekeningen;
@property (nonatomic, strong) UIButton *btnAdd;
@property (nonatomic, strong) UIButton *btnOk;
@property (nonatomic,strong) NavigationBar *navBar;

- (id)initWithFrame:(CGRect)frame andArray:(NSMutableArray *)arrDrawings;

@end
