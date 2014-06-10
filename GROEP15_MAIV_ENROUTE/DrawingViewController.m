//
//  DrawingViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 05/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "DrawingViewController.h"

@interface DrawingViewController ()

@end

@implementation DrawingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(btnAgainTapped :) name:@"BTN_AGAIN_TAPPED" object:nil];
    }
    return self;
}

- (void)updateWithImage:(UIImage *)image{
    
    self.image = image;
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[DrawingView alloc] initWithFrame:bounds andImage:self.image];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.brush = 4;
    self.opacity = 1;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    self.mouseSwiped = NO;
    UITouch *touch = [touches anyObject];
    self.lastPoint = [touch locationInView:self.view];
    
    if (CGRectContainsPoint(self.view.startImage.frame, self.lastPoint)){
        self.beginDraw = TRUE;
    }else{
        self.beginDraw = FALSE;
    }
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(self.beginDraw == TRUE){
        self.mouseSwiped = YES;
        UITouch *touch = [touches anyObject];
        CGPoint currentPoint = [touch locationInView:self.view];
        
        UIGraphicsBeginImageContext(self.view.frame.size);
        [self.view.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), self.lastPoint.x, self.lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), self.brush );
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0/255.0, 0.0/255.0, 0.0/255.0, 1.0);
        CGContextSetBlendMode(UIGraphicsGetCurrentContext(),kCGBlendModeNormal);
        
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        self.view.tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
        [self.view.tempDrawImage setAlpha:1];
        UIGraphicsEndImageContext();
        
        self.lastPoint = currentPoint;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(CGRectContainsPoint(self.view.endImage.frame, self.lastPoint)){
        self.endDraw = TRUE;
    }else{
        self.endDraw = FALSE;
    }
    
    if(self.endDraw == TRUE){
        NSLog(@"end draw true");
        if(!self.mouseSwiped) {
            UIGraphicsBeginImageContext(self.view.frame.size);
            [self.view.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
            CGContextSetLineWidth(UIGraphicsGetCurrentContext(), self.brush);
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0/255.0, 0.0/255.0, 0.0/255.0, 1);
            CGContextMoveToPoint(UIGraphicsGetCurrentContext(), self.lastPoint.x, self.lastPoint.y);
            CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), self.lastPoint.x, self.lastPoint.y);
            CGContextStrokePath(UIGraphicsGetCurrentContext());
            CGContextFlush(UIGraphicsGetCurrentContext());
            self.view.tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        }
        
        UIGraphicsBeginImageContext(self.view.mainImage.frame.size);
        [self.view.mainImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) blendMode:kCGBlendModeNormal alpha:1.0];
        [self.view.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) blendMode:kCGBlendModeNormal alpha:1];
        self.view.mainImage.image = UIGraphicsGetImageFromCurrentImageContext();
        self.view.tempDrawImage.image = nil;
        UIGraphicsEndImageContext();
        
        // notification uitzenden
        NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
        [userInfo setObject:self.view.mainImage.image forKey:@"drawnImage"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"CALL_END_DRAW_VIEW_CONTROLLER" object:self userInfo:userInfo];
        
    }else{
        self.view.tempDrawImage.image = nil;
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)btnAgainTapped:(id)sender{
    self.view.mainImage.image = nil;
}

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
