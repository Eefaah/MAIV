//
//  PhotoOverviewViewController.m
//  GROEP15_MAIV_ENROUTE
//
//  Created by Sophia Verhoeff on 07/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "PhotoOverviewViewController.h"
#import "AFNetworking.h"

@interface PhotoOverviewViewController ()

@end

@implementation PhotoOverviewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[PhotoOverviewView alloc] initWithFrame:bounds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view.btn_story addTarget:self action:@selector(btnStoryTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.navBar.btnBack addTarget:self action:@selector(btnBackTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    
    for(UIButton *btnPersoonToevoegen in self.view.arrButtons){
        [btnPersoonToevoegen addTarget:self action:@selector(btnToevoegenTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    NSLog(@"%@", self.view.dictImages);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(retakePhoto:) name:@"RETAKE_PHOTO" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(maskDone:) name:@"MASK_DONE" object:nil];

    // uit show photo
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backToOverview:) name:@"OP3_BACK_TO_PICTURES" object:nil];
    
    // knoppen uit save or retake scherm
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteRetakeScreen:) name:@"OP3_RETAKE_TAPPED" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showSecondScreen:) name:@"OP3_USE_TAPPED" object:nil];
}

-(void)backToOverview:(id)sender{
    [self.navigationController popToViewController:self animated:YES];
}

-(void)btnStoryTapped:(id)sender{
    NSLog(@"btn story tapped");
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)btnBackTapped:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)maskDone:(id)sender{
    [self.view.photoLayerButton addTarget:self action:@selector(photoLayerButtonTapped :) forControlEvents:UIControlEventTouchUpInside];
}

- (void)photoLayerButtonTapped:(id)sender{
    
    self.buttonIndex = [sender tag];
    //self.tappedButtonId = [sender tag];
    self.imageForView = [self.view.dictImages objectForKey:[NSString stringWithFormat:@"%li", (long)[sender tag]]];

    self.showPhotoVC = [[ShowPhotoViewController alloc] initWithNibName:nil bundle:nil];
    [self.showPhotoVC initWithImage:self.imageForView andId:self.tappedButtonId];
    [self.navigationController pushViewController:self.showPhotoVC animated:YES];
}

- (void)retakePhoto:(id)sender{
    [self.view.dictImages removeObjectForKey:[NSString stringWithFormat:@"%li", (long)self.buttonIndex]];
    [self showCamera];
}

- (void)terugNaarVerhaalTapped:(id)sender{
    
    [self.view maskImage:self.squarePhoto withID:self.buttonIndex];
}

- (void)showMask{
    
    NSLog(@"%lu", (unsigned long)self.view.dictImages.count);
    NSLog(@"%@", self.view.dictImages);

    if(self.view.dictImages.count == 3){
        self.view.btnSave.alpha = 1;
        [self.view.btnSave addTarget:self action:@selector(btnSaveTapped :) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self.view maskImage:self.squarePhoto withID:self.buttonIndex];
}

- (void)btnSaveTapped:(id)sender{
    
    // hier de waiting button tonen
    [self.view removeButtons];
    [self.view.btnSave removeTarget:self action:@selector(btnSaveTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    // alle buttons disablen van de fotos
    
    for(UIButton *photoLayerButton in self.view.arrPhotoLayerButtons){
        [photoLayerButton removeTarget:self action:@selector(photoLayerButtonTapped :) forControlEvents:UIControlEventTouchUpInside];
    }
    
    for(int i = 1; i < 5; i++){
        
        UIImage *imageForUpload = [self.view.dictImages objectForKey:[NSString stringWithFormat:@"%i", i]];
        NSData *dataFromImage = UIImageJPEGRepresentation(imageForUpload, 0.5);
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        NSDictionary *parameters = @{@"dag_groep_id": [[NSUserDefaults standardUserDefaults] objectForKey:@"dag_groep_id"],
                                     @"groep_id" : [[NSUserDefaults standardUserDefaults] objectForKey:@"groep_id"],
                                     @"opdracht_id": @1,
                                     @"opdracht_onderdeel_id":@0
                                    };
        
        [manager POST:@"http://student.howest.be/tim.beeckmans/20132014/MAIV/ENROUTE/uploads/index.php" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            [formData appendPartWithFileData:dataFromImage name:@"file" fileName:@"fileName" mimeType:@"image/jpeg"];
        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
            //-[[NSNotificationCenter defaultCenter] postNotificationName:@"OPBTN_SAVE_TAPPED" object:nil];
            NSLog(@"Success: %@", responseObject);
            [self.view changeButton];
            if(self.view.btn_story){
                [self.view.btn_story addTarget:self action:@selector(btnStoryTapped:) forControlEvents:UIControlEventTouchUpInside];
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
    }
}

- (void)tick:(id)sender{
    
}

- (void)btnToevoegenTapped:(id)sender{
    
    self.buttonIndex = [sender tag];
    
    [self showCamera];
}

- (void)showCamera{
    
    self.imagePicker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        self.imagePicker.view.frame = self.view.frame;
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.imagePicker.mediaTypes = [NSArray arrayWithObject:@"public.image"];
        self.photoPickerView = [[CustomPhotoPicker alloc] initWithFrame:self.imagePicker.view.frame andFaceOverlay:YES];
        self.imagePicker.cameraOverlayView = self.photoPickerView;
        
        CGSize screenSize = [[UIScreen mainScreen] bounds].size;   // 320 x 568
        
        float scale = screenSize.height / screenSize.width*3/4;  // screen height divided by the pickerController height
        
        CGAffineTransform translate=CGAffineTransformMakeTranslation(0,(screenSize.height - screenSize.width*4/3)*0.5);
        CGAffineTransform fullScreen=CGAffineTransformMakeScale(scale, scale);
        self.imagePicker.cameraViewTransform =CGAffineTransformConcat(fullScreen, translate);

        self.imagePicker.allowsEditing = YES;
        self.imagePicker.showsCameraControls = NO;
    }else{
        
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:self.imagePicker animated:YES completion:^{
        [self.photoPickerView.btn_foto addTarget:self action:@selector(takePicture:) forControlEvents:UIControlEventTouchUpInside];
        if(self.saveOrRetakeVC){
            NSLog(@"we zijn in de self");
            [self.navigationController popViewControllerAnimated:NO];
            self.saveOrRetakeVC = nil;
        }
        if(self.showPhotoVC){
            [self.navigationController popViewControllerAnimated:YES];
            self.showPhotoVC = nil;
            NSLog(@"na presenten imagepicker -- self.showPhotoVC = %@",self.showPhotoVC);
        }
    }];
    self.imagePicker.delegate = self;
    
}

-(void)takePicture:(id)sender{
    [self.imagePicker takePicture];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    self.photo = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.squarePhoto = [self squareImageWithImage:self.photo scaledToSize:CGSizeMake(270, 270)];
    
    // zorgen dat het scherm er achter al klaar staat
    NSLog(@"imagePickerController didFinishPickingMediaWithInfo --- show retake vc");
    self.saveOrRetakeVC = [[SaveOrRetakeViewController alloc] initWithImage:self.photo];
    [self.navigationController pushViewController:self.saveOrRetakeVC animated:NO];
    NSLog(@"retake vc = %@",self.saveOrRetakeVC);
    
    [self.imagePicker dismissViewControllerAnimated:YES completion:^{}];
    
//    [self showMask];
}

-(void)deleteRetakeScreen:(id)sender{
    //[self.navigationController popViewControllerAnimated:YES];
    NSLog(@"deleteRetakeScreen -- na poppen retakeVC = %@",self.saveOrRetakeVC);
//    self.saveOrRetakeVC = nil;
    [self showCamera];
}

-(void)showSecondScreen:(id)sender{
    // remove save or retake
    //[self.navigationController popViewControllerAnimated:YES];
    //NSLog(@"show second screen -- na poppen retakeVC = %@",self.saveOrRetakeVC);
    [self showMask];
    
    [self.navigationController popViewControllerAnimated:NO];
    self.saveOrRetakeVC = nil;
    NSLog(@"show second screen -- na poppen retakeVC = %@",self.saveOrRetakeVC);
//    self.secondInfoVC = [[SecondInfoViewController alloc] initWithNibName:nil bundle:nil];
//    [self.navigationController pushViewController:self.secondInfoVC animated:YES];
}

- (UIImage *)squareImageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    double ratio;
    double delta;
    CGPoint offset;
    
    CGSize sz = CGSizeMake(newSize.width, newSize.width);

    if (image.size.width > image.size.height) {
        ratio = newSize.width / image.size.width;
        delta = (ratio*image.size.width - ratio*image.size.height);
        offset = CGPointMake(delta/2, 0);
    } else {
        ratio = newSize.width / image.size.height;
        delta = (ratio*image.size.height - ratio*image.size.width);
        offset = CGPointMake(0, delta/2);
    }
    
    CGRect clipRect = CGRectMake(-offset.x, -offset.y,
                                 (ratio * image.size.width) + delta,
                                 (ratio * image.size.height) + delta);
    
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(sz, YES, 0.0);
    } else {
        UIGraphicsBeginImageContext(sz);
    }
    
    UIRectClip(clipRect);
    [image drawInRect:clipRect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
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
