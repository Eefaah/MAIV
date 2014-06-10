//
//  SaveOrRetakeViewController.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Eva Pieters on 10/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SaveOrRetakeView.h"
#import <AFNetworking.h>

@interface SaveOrRetakeViewController : UIViewController
@property (nonatomic,strong) SaveOrRetakeView *view;
@property (nonatomic,strong) NSData *videoData;

-(id)initWithData:(NSData *)videoData;

@end
