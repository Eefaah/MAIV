//
//  ShowPhotoView.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 07/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowPhotoView : UIView

@property (nonatomic, strong) UILabel *lblJullieFoto;
@property (nonatomic, strong) UIButton *btnTerugNaarVerhaal;
@property (nonatomic, strong) UIImage *takenPhoto;
@property (nonatomic, strong) UIButton *btnRetake;

- (id)initWithFrame:(CGRect)frame andImage:(UIImage *)image;

@end
