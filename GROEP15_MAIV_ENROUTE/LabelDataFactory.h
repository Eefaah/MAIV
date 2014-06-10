//
//  LabelDataFactory.h
//  IFFViews
//
//  Created by Eva Pieters on 27/03/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LabelData.h"

@interface LabelDataFactory : NSObject

+ (LabelData *)createLabelWithText:(NSString *)tekst width:(int)breedte height:(int)hoogte xPos:(int)xPos yPos:(int)yPos;

@end
