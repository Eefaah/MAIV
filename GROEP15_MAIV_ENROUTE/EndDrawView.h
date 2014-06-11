//
//  EndDrawView.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 06/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationBar.h"

@interface EndDrawView : UIView

@property (nonatomic, strong) UIButton *btnAgain;
@property (nonatomic, strong) UIButton *btnOk;
@property (nonatomic, strong) UILabel *lblJouwTekening;
@property (nonatomic,strong) NavigationBar *navBar;

@property (nonatomic, strong) UIImage *drawnImage;

- (id)initWithFrame:(CGRect)frame andImage:(UIImage *)image;

@end
