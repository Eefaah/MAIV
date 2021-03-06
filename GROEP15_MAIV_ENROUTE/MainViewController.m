//
//  MainViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 04/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        NSLog(@"main controller");
        
        self.arrClasses = [NSArray array];
        self.arrClasses = @[@"Werken",@"Geluiden",@"Mensen",@"GPSDrawing",@"Speeltuin"];
        
        self.xduif = 0;
        
        int i = 0;
        for(UIButton *scrollViewButton in self.view.arrScrollViewButtons){
            
            self.className = self.arrClasses[i];
            [scrollViewButton addTarget:self action:@selector(scrollViewButtonTapped :) forControlEvents:UIControlEventTouchUpInside];
            [scrollViewButton setRestorationIdentifier:self.className];
            
            i ++;
        }
        
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"we komen hier in");
    [self.GPSVC removeFromParentViewController];
    [self.werkenVC removeFromParentViewController];
    [self.peopleVC removeFromParentViewController];
    [self.soundVC removeFromParentViewController];
    [self.playgroundVC removeFromParentViewController];
    self.GPSVC = nil;
    self.werkenVC = nil;
    self.peopleVC = nil;
    self.soundVC = nil;
    self.playgroundVC = nil;
    NSLog(@"self.GPSVC %@",self.GPSVC);
    NSLog(@"werkenVC %@",self.werkenVC);
    NSLog(@"peopleVC %@",self.peopleVC);
    NSLog(@"soundVC %@",self.soundVC);
    NSLog(@"playgroundVC %@",self.playgroundVC);
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [super viewWillAppear:animated];
    
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"isUserRegistered"] == NO){
        NSLog(@"show register vc");
        self.registerVC = [[RegisterViewController alloc] initWithBounds:self.view.bounds];
        [self presentViewController:self.registerVC animated:NO completion:^{}];
    }
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[MainView alloc] initWithFrame:bounds];
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)scrollViewButtonTapped:(id)sender{
    NSString *className = [sender restorationIdentifier];
    NSLog(@"%@", className);
    
    if([className isEqualToString:@"Werken"]){
        self.werkenVC = [[WerkenViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:self.werkenVC animated:YES];
    }
    else if ([className isEqualToString:@"Mensen"]){
        self.peopleVC = [[PeopleViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:self.peopleVC animated:YES];
    }
    else if ([className isEqualToString:@"GPSDrawing"]){
        self.GPSVC = [[GPSViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:self.GPSVC animated:YES];
    }
    else if ([className isEqualToString:@"Speeltuin"]){
        self.playgroundVC = [[PlaygroundViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:self.playgroundVC animated:YES];
    }else if([className isEqualToString:@"Geluiden"]){
        NSLog(@"else if geluiden");
        self.soundVC = [[RecordingViewController alloc] initWithNibName:nil bundle:nil];
        self.soundVC = [[RecordingViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:self.soundVC animated:YES];
    }
    
    //[self.navigationController pushViewController:self.werkenVC animated:YES];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.scrollView.delegate = self;
    [self.view.btn_map addTarget:self action:@selector(showMap:) forControlEvents:UIControlEventTouchUpInside];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backToStory:) name:@"MAP_BACK_TO_STORY" object:nil];
    
}

-(void)backToStory:(id)sender{
    [self.navigationController popToViewController:self animated:YES];
    self.mainMapViewVC = nil;
}

-(void)showMap:(id)sender{
    NSLog(@"Show Map");
    self.mainMapViewVC = [[MainMapViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:self.mainMapViewVC animated:YES];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [UIView animateWithDuration:0.3 animations:^{
        self.view.btn_map.alpha = 1;
    }];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [UIView animateWithDuration:0.3 animations:^{
        self.view.btn_map.alpha = 1;
    }];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    // button wegdoen
    self.view.btn_map.alpha = 0;
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    // button wegdoen
    self.view.btn_map.alpha = 0;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //[self.view.btn_map setHidden:YES];

    //NSLog(@"scrollview content offset = %f",scrollView.contentOffset.y);
    
    CGPoint offset = scrollView.contentOffset;
    float yOffset = offset.y;

    
    if(scrollView.isDragging){
        CGPoint offset = scrollView.contentOffset;
        //NSLog(@"%@",NSStringFromCGPoint(offset));

        CGFloat rotateDegrees = offset.y;
        CGFloat rotateRadians = rotateDegrees * (M_PI / 180);
        self.view.windmolen.layer.affineTransform = CGAffineTransformMakeRotation(rotateRadians);
    }
    
    if(self.view.scrollView.contentOffset.y < 1266){
        //NSLog(@"duif moet vliegen!");
        ///vlieg duif!
//        CGPoint offset = scrollView.contentOffset;
//        CGFloat rotateDegrees = offset.y;
//        CGFloat rotateRadians = rotateDegrees * (M_PI / 180);
//        float yOffset = offset.y;
        //NSLog(@"offset update = %@",NSStringFromCGPoint(offset));
        //self.xduif+=1;
        float yPostDuif = yOffset+300;
        yPostDuif+= 50;
        float xPostDuif = 1266-yOffset;
        //NSLog(@"y offset = %f",yOffset);
        //NSLog(@"berekening xpos = %f",xPostDuif);
        //NSLog(@"xpos = %f",xPos);
        self.view.duif.layer.position = CGPointMake(xPostDuif, 1402);

        //self.view.duif.layer.affineTransform = CGAffineTransformMakeTranslation(xPos, 1730);
    }else{
        CGPoint offset = scrollView.contentOffset;
        float yOffset = offset.y;
        float xPostDuif = 1266-yOffset;
        self.view.duif.layer.position = CGPointMake(xPostDuif, 1402);
    }
    
    if(self.view.scrollView.contentOffset.y < 929){
        self.xBoot = 320 - (929-yOffset);
        //NSLog(@"x van de boot = %f",self.xBoot);
        self.view.boot.layer.position = CGPointMake(self.xBoot, 1067);
        
        if(yOffset < 810){
            self.view.boot.layer.position = CGPointMake(202, 1067);
        }
    }
    else{
        // zonder deze else verdwijnt de boot niet altijd helemaal terug uit beeld
        float xBoot = 320 - (929-yOffset);
        self.view.boot.layer.position = CGPointMake(xBoot, 1067);
    }
    
    if(self.view.boot.layer.position.x > 202){
        CALayer *layer = self.view.vlieger.layer;
        
        
        CAKeyframeAnimation *xTranslation;
        xTranslation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
        xTranslation.duration = 1.5f;
        xTranslation.cumulative = YES;
        xTranslation.repeatCount = 1;
        xTranslation.values = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:0.0],
                            [NSNumber numberWithFloat:30.0],
                            [NSNumber numberWithFloat:300.0], nil];
        xTranslation.keyTimes = [NSArray arrayWithObjects:
                              [NSNumber numberWithFloat:0],
                              [NSNumber numberWithFloat:0.3],
                              [NSNumber numberWithFloat:1.5],
                              nil];
        xTranslation.timingFunctions = [NSArray arrayWithObjects:
                                              [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],	// from keyframe 1 to keyframe 2
                                              [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut], nil];	// from keyframe 2 to keyframe 3
        xTranslation.removedOnCompletion = NO;
        xTranslation.fillMode = kCAFillModeForwards;
        [layer addAnimation:xTranslation forKey:@"x_translation"];
        
        
        CAKeyframeAnimation *yTranslation;
        yTranslation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
        yTranslation.duration = 1.5f;
        yTranslation.cumulative = YES;
        yTranslation.repeatCount = 1;
        yTranslation.values = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:0],
                               [NSNumber numberWithFloat:-80],
                               [NSNumber numberWithFloat:-200],nil];
        yTranslation.keyTimes = [NSArray arrayWithObjects:
                                 [NSNumber numberWithFloat:0],
                                 [NSNumber numberWithFloat:0.5],
                                 [NSNumber numberWithFloat:1.5],
                                 nil];
        yTranslation.timingFunctions = [NSArray arrayWithObjects:
                                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],	// from keyframe 1 to keyframe 2
                                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut], nil];	// from keyframe 2 to keyframe 3
        yTranslation.removedOnCompletion = NO;
        yTranslation.fillMode = kCAFillModeForwards;
        [layer addAnimation:yTranslation forKey:@"y_translation"];
        
        CAKeyframeAnimation *rotation;
        rotation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotation.duration = 1.5f;
        rotation.cumulative = YES;
        rotation.repeatCount = 1;
        rotation.values = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:-(0.0 * M_PI)],
                           [NSNumber numberWithFloat:-(0.2 * M_PI)],
                               [NSNumber numberWithFloat:-(M_PI*2)],
                           nil];
        rotation.keyTimes = [NSArray arrayWithObjects:
                                 [NSNumber numberWithFloat:0],
                                 [NSNumber numberWithFloat:0.2],
                                 [NSNumber numberWithFloat:0.7],
                                 nil];
        rotation.timingFunctions = [NSArray arrayWithObjects:
                                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],	// from keyframe 1 to keyframe 2
                                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut], nil];	// from keyframe 2 to keyframe 3
        rotation.removedOnCompletion = NO;
        rotation.fillMode = kCAFillModeForwards;
        [layer addAnimation:rotation forKey:@"rotation"];

    }
    
}

-(void) movePend
{

}

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
