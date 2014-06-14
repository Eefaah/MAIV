//
//  PeopleView.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 07/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationBar.h"
#import "UitlegView.h"

@interface PeopleView : UIView

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *lblIphone;
@property (nonatomic, strong) UILabel *lblGaOpzoek;
@property (nonatomic, strong) UILabel *lblNeemFoto;
@property (nonatomic, strong) UIButton *btnBeginnen;
@property (nonatomic, strong) UIButton *btnToevoegen;
@property (nonatomic,strong) NavigationBar *navBar;
@property (nonatomic,strong) UitlegView *uitleg;
@property (nonatomic,strong) NSMutableArray *labels;

- (id)initWithFrame:(CGRect)frame andLabels:(NSMutableArray *)labels;

@end

