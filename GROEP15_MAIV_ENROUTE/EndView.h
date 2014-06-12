//
//  EndView.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 11/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "NavigationBar.h"

@interface EndView : UIView

@property (nonatomic, strong) NSURL *videoUrl;
@property (nonatomic, strong)  NavigationBar *navBar;
@property (nonatomic, strong) UIButton *btnRetake;
@property (nonatomic, strong) UIButton *btnSave;
@property (nonatomic, strong) UIImage *drawnImage;
@property (nonatomic,strong) UILabel *lblFilmpje;

- (id)initWithFrame:(CGRect)frame videoUrl:(NSURL *)url;
- (void)drawImage:(UIImage *)image;

@property (nonatomic, strong) MPMoviePlayerController *moviePlayerController;


@end
