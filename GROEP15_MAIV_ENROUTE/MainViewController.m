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
        self.arrClasses = @[@"Werken", @"GPSDrawing",@"Fotos", @"Geluiden", @"Mensen", @"Zintuigen", @"Speeltuin"];
        
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
//    if([[NSUserDefaults standardUserDefaults] boolForKey:@"isUserRegistered"] == NO){
//        NSLog(@"show register vc");
//        self.registerVC = [[RegisterViewController alloc] initWithBounds:self.view.bounds];
//        [self presentViewController:self.registerVC animated:NO completion:^{}];
//    }
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

- (void)viewWillDisappear:(BOOL)animated {
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
//    [super viewWillDisappear:animated];
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
    
//    self.werkenVC = [[WerkenViewController alloc] initWithNibName:nil bundle:nil];
//    
//    if([className isEqualToString:@"Werken"]){
//        NSLog(@"werken");
//        [self.navigationController pushViewController:self.werkenVC animated:NO];
//    }
//
    self.GPSVC = [[GPSViewController alloc] initWithNibName:nil bundle:nil];
    self.werkenVC = [[WerkenViewController alloc] initWithNibName:nil bundle:nil];
    self.peopleVC = [[PeopleViewController alloc] initWithNibName:nil bundle:nil];
    self.soundVC = [[RecordingViewController alloc] initWithNibName:nil bundle:nil];
    
//    PeopleViewController *peopleVC = [[PeopleViewController alloc] initWithNibName:nil bundle:nil];
//    GPSViewController *gpsVC = [[GPSViewController alloc] initWithNibName:nil bundle:nil];
    PlaygroundViewController *playgroundVC = [[PlaygroundViewController alloc] initWithNibName:nil bundle:nil];
    
    if([className isEqualToString:@"Werken"]){
        [self.navigationController pushViewController:self.werkenVC animated:YES];
    }
    else if ([className isEqualToString:@"Mensen"]){
        [self.navigationController pushViewController:self.peopleVC animated:YES];
    }
    else if ([className isEqualToString:@"GPSDrawing"]){
        [self.navigationController pushViewController:self.GPSVC animated:YES];
    }
    else if ([className isEqualToString:@"Speeltuin"]){
        [self.navigationController pushViewController:playgroundVC animated:YES];
    }else if([className isEqualToString:@"Zintuigen"]){
        
        // hier wordt beslist welk zintuig deze groep krijgt
        
        self.zintuigVC = [[MainZintuigViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:self.zintuigVC animated:YES];
    }else if([className isEqualToString:@"Geluiden"]){
        NSLog(@"else if geluiden");
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
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
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
    
    if(self.view.scrollView.contentOffset.y < 2009){
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
        float xPostDuif = 2009-yOffset;
        //NSLog(@"y offset = %f",yOffset);
        //NSLog(@"berekening xpos = %f",xPostDuif);
        //NSLog(@"xpos = %f",xPos);
        self.view.duif.layer.position = CGPointMake(xPostDuif, 2066);

        //self.view.duif.layer.affineTransform = CGAffineTransformMakeTranslation(xPos, 1730);
    }else{
        CGPoint offset = scrollView.contentOffset;
        float yOffset = offset.y;
        float xPostDuif = 2009-yOffset;
        self.view.duif.layer.position = CGPointMake(xPostDuif, 2066);
    }
    
    if(self.view.scrollView.contentOffset.y < 1674){
        self.xBoot = 320 - (1647-yOffset);
        //NSLog(@"x van de boot = %f",self.xBoot);
        self.view.boot.layer.position = CGPointMake(self.xBoot, 1803);
        
        if(yOffset < 1528){
            self.view.boot.layer.position = CGPointMake(202, 1803);
        }
    }
    else{
        // zonder deze else verdwijnt de boot niet altijd helemaal terug uit beeld
        float xBoot = 320 - (1647-yOffset);
        self.view.boot.layer.position = CGPointMake(xBoot, 1803);
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
