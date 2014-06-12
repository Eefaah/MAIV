//
//  EndViewController.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 11/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EndView.h"
#import <AFNetworking.h>
#import <MediaPlayer/MediaPlayer.h>

@interface EndViewController : UIViewController

@property (nonatomic, strong) EndView *view;

@property (nonatomic,strong) NSData *videoData;
@property (nonatomic, strong) MPMoviePlayerController *moviePlayerController;
@property (nonatomic, strong) NSURL *videoUrl;
@property (nonatomic, strong) UIImage *drawnImage;

-(void)getVideoWithUrl:(NSURL *)videoURL;
- (void)getDrawingImage:(UIImage *)image;

@end
