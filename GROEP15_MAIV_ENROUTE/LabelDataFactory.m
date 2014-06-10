//
//  LabelDataFactory.m
//  IFFViews
//
//  Created by Eva Pieters on 27/03/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "LabelDataFactory.h"

@implementation LabelDataFactory

+ (LabelData *)createLabelWithText:(NSString *)tekst width:(int)breedte height:(int)hoogte xPos:(int)xPos yPos:(int)yPos{
    
    LabelData *label = [[LabelData alloc]init];
    label.text = tekst;
    label.width = breedte;
    label.height = hoogte;
    label.xPos = xPos;
    label.yPos = yPos;
    
    return label;
}

@end
