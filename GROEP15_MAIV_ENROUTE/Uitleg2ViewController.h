//
//  Uitleg2ViewController.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Eva Pieters on 11/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Uitleg2View.h"

@interface Uitleg2ViewController : UIViewController
@property (nonatomic,strong) Uitleg2View *view;
@property (nonatomic,strong) NSMutableArray *labels;
@property (nonatomic,strong) NSString *opdracht;
-(id)initMetSoortOpdracht:(NSString *)opdracht;
@end
