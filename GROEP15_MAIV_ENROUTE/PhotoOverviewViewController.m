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
    
    for(UIButton *btnPersoonToevoegen in self.view.arrButtons){
        [btnPersoonToevoegen addTarget:self action:@selector(btnToevoegenTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    NSLog(@"%@", self.view.dictImages);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(retakePhoto :) name:@"RETAKE_PHOTO" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(maskDone :) name:@"MASK_DONE" object:nil];
}

- (void)maskDone:(id)sender{
    [self.view.photoLayerButton addTarget:self action:@selector(photoLayerButtonTapped :) forControlEvents:UIControlEventTouchUpInside];
}

- (void)photoLayerButtonTapped:(id)sender{
    
    self.buttonIndex = [sender tag];
    //self.tappedButtonId = [sender tag];
    self.imageForView = [self.view.dictImages objectForKey:[NSString stringWithFormat:@"%li", (long)[sender tag]]];

    ShowPhotoViewController *showPhotoVC = [[ShowPhotoViewController alloc] initWithNibName:nil bundle:nil];
    [showPhotoVC initWithImage:self.imageForView andId:self.tappedButtonId];
    [self.navigationController pushViewController:showPhotoVC animated:YES];
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
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.mediaTypes = availableMediaTypes;
        
    }else{
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:imagePicker animated:YES completion:^{}];
    imagePicker.delegate = self;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    self.photo = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.squarePhoto = [self squareImageWithImage:self.photo scaledToSize:CGSizeMake(270, 270)];
    [self dismissViewControllerAnimated:YES completion:^{}];
    
    [self showMask];
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
