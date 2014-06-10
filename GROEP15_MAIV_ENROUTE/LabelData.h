//
//  LabelData.h
//  IFFViews
//
//  Created by Eva Pieters on 27/03/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LabelData : NSObject

@property (nonatomic,strong) NSString *text;

@property (nonatomic) int width;
@property (nonatomic) int height;
@property (nonatomic) int xPos;
@property (nonatomic) int yPos;
@property (nonatomic) float r;
@property (nonatomic) float g;
@property (nonatomic) float b;
@property (nonatomic,strong) NSString *fontname;
@property (nonatomic) float bgred;
@property (nonatomic) float bggreen;
@property (nonatomic) float bgblue;
@property (nonatomic) NSTextAlignment alignment;
@property (nonatomic) float paddingTop;
@property (nonatomic) float paddingLeft;
@property (nonatomic) float paddingBottom;
@property (nonatomic) float paddingRight;
@property (nonatomic) int fontSize;
@property (nonatomic,strong) UIImage *image;
@property (nonatomic,strong) NSAttributedString *attributedText;
@property (nonatomic) int numberOfLines;
@property (nonatomic,strong) UIColor *color;
@property (nonatomic) BOOL custom;

@end
