//
//  ViewController.m
//  等比压缩图片
//
//  Created by mac on 16/11/25.
//  Copyright © 2016年 xbk. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+BKExtension.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.headImageView.backgroundColor = [UIColor yellowColor];
    self.headImageView.layer.cornerRadius = 37;
    self.headImageView.layer.masksToBounds = YES;
    
    
}
- (IBAction)buttonClick:(id)sender {
    
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = YES;
        
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        [self presentViewController:imagePickerController animated:YES completion:nil];
    
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{

    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    UIImage *scaleImage = [image compressWithWidth:200];

    NSData *data1 = UIImagePNGRepresentation(scaleImage);
    [data1 writeToFile:@"/users/mac/desktop/1.png" atomically:YES];
    
    NSData *data2 = UIImageJPEGRepresentation(scaleImage, 0.5);
    [data2 writeToFile:@"/users/mac/desktop/2.png" atomically:YES];
    
    [self.headImageView setImage:scaleImage];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{

    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
