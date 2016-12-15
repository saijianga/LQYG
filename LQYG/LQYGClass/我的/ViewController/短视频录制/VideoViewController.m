//
//  VideoViewController.m
//  LQYG
//
//  Created by issuser on 2016/12/7.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "VideoViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
//#import "CammerView.h"//相机UI视图
typedef void(^PropertyChangeBlock)(AVCaptureDevice *captureDevice);
@interface VideoViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImagePickerController *_imagePickerController;
    UIView *_cammerView;
    
}
@property (strong,nonatomic) AVCaptureDeviceInput *captureDeviceInput;//负责从AVCaptureDevice获得输入数据
@property(nonatomic,retain)AVCaptureSession * AVSession;

@end

@implementation VideoViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"录制" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(10, 100, 100, 30);
    [button addTarget:self action:@selector(VideoPlay) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [self setCammerUI];
    
    
    
    _imagePickerController = [[UIImagePickerController alloc] init];
    _imagePickerController.delegate = self;
    _imagePickerController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    _imagePickerController.allowsEditing = YES;
    _imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    
//    _cammerView = [[CammerView alloc] init];
//    _cammerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
#warning 使用自定义的相机UI视图
    _imagePickerController.showsCameraControls = NO;
    _imagePickerController.cameraOverlayView = _cammerView;
    
    //录制视频时长，默认10s
    _imagePickerController.videoMaximumDuration = 15;
    
    //相机类型（拍照、录像...）字符串需要做相应的类型转换
    _imagePickerController.mediaTypes = @[(NSString *)kUTTypeMovie,(NSString *)kUTTypeImage];
    
    //视频上传质量
    //UIImagePickerControllerQualityTypeHigh高清
    //UIImagePickerControllerQualityTypeMedium中等质量
    //UIImagePickerControllerQualityTypeLow低质量
    //UIImagePickerControllerQualityType640x480
    _imagePickerController.videoQuality = UIImagePickerControllerQualityTypeHigh;
    
    //设置摄像头模式（拍照，录制视频）为录像模式
    _imagePickerController.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
    
    
    // Do any additional setup after loading the view.
}
//适用获取所有媒体资源，只需判断资源类型
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSString *mediaType=[info objectForKey:UIImagePickerControllerMediaType];
    //判断资源类型
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]){
//        //如果是图片
//        self.imageView.image = info[UIImagePickerControllerEditedImage];
//        //压缩图片
//        NSData *fileData = UIImageJPEGRepresentation(self.imageView.image, 1.0);
//        //保存图片至相册
//        UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
//        //上传图片
//        [self uploadImageWithData:fileData];
        
    }else{
        self.view.backgroundColor = [UIColor brownColor];
        //如果是视频
        NSURL *url = info[UIImagePickerControllerMediaURL];
//        //播放视频
//        _moviePlayer.contentURL = url;
//        [_moviePlayer play];
        //保存视频至相册（异步线程）
        NSString *urlStr = [url path];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(urlStr)) {
                
                UISaveVideoAtPathToSavedPhotosAlbum(urlStr, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
            }
        });
        NSData *videoData = [NSData dataWithContentsOfURL:url];
        //视频上传
       // [self uploadVideoWithData:videoData];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark 视频保存完毕的回调
- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInf{
    if (error) {
        NSLog(@"保存视频过程中发生错误，错误信息:%@",error.localizedDescription);
        self.view.backgroundColor = [UIColor orangeColor];
    }else{
        NSLog(@"视频保存成功.");
        self.view.backgroundColor = [UIColor blueColor];
    }
}
-(void)VideoPlay{
  [self presentViewController:_imagePickerController animated:YES completion:nil];
}
#warning 相机的自定义UI视图
-(void)setCammerUI{
    _cammerView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _cammerView.backgroundColor = [UIColor clearColor];
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setTitle:@"返回" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    cancelButton.frame = CGRectMake(10, 10, 60, 30);
    [cancelButton addTarget:self action:@selector(cancelImagPicker) forControlEvents:UIControlEventTouchUpInside];
    [_cammerView addSubview:cancelButton];
#warning 闪光灯
    UIButton *FalshButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [FalshButton setTitle:@"闪光灯" forState:UIControlStateNormal];
    [FalshButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    FalshButton.frame = CGRectMake(SCREEN_WIDTH - 160, 10, 60, 30);
    [FalshButton addTarget:self action:@selector(flashImagePicker) forControlEvents:UIControlEventTouchUpInside];
    [_cammerView addSubview:FalshButton];
#warning 前后像头切换
    UIButton *changeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [changeButton setTitle:@"切换" forState:UIControlStateNormal];
    [changeButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    changeButton.frame = CGRectMake(SCREEN_WIDTH - 80, 10, 60, 30);
    [changeButton addTarget:self action:@selector(changeImagePicker) forControlEvents:UIControlEventTouchUpInside];
    [_cammerView addSubview:changeButton];
    
#warning 开始录制视频
    UIButton *luButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [luButton setTitle:@"开始" forState:UIControlStateNormal];
    [luButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    luButton.tag = 299;
    luButton.frame = CGRectMake(SCREEN_WIDTH - 80, 10, 60, 30);
    luButton.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT - 60);
    [luButton addTarget:self action:@selector(luImagePicker:) forControlEvents:UIControlEventTouchUpInside];
    [_cammerView addSubview:luButton];
    
}
#warning 返回
-(void)cancelImagPicker{
    [_imagePickerController dismissViewControllerAnimated:YES completion:nil];
}
#warning 闪光灯
-(void)flashImagePicker{
//    [self turnTouchOn:YES];
    [self openFlash];
}
//打开闪光灯
-(void)openFlash{
    AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device.torchMode == AVCaptureTorchModeOff) {
        //Create an AV session
        _AVSession = [[AVCaptureSession alloc]init];
        
        // Create device input and add to current session
        AVCaptureDeviceInput * input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
        [_AVSession addInput:input];
        
        // Create video output and add to current session
        AVCaptureVideoDataOutput * output = [[AVCaptureVideoDataOutput alloc]init];
        [_AVSession addOutput:output];
        
        // Start session configuration
        [_AVSession beginConfiguration];
        [device lockForConfiguration:nil];
        
        // Set torch to on
        [device setTorchMode:AVCaptureTorchModeOn];
        
        [device unlockForConfiguration];
        [_AVSession commitConfiguration];
        
        // Start the session
        [_AVSession startRunning];
        
        // Keep the session around
//        [self setAVSession:self.AVSession];
         [self setAVSession:_AVSession];
//        [output release];
    }
    else
        [self closeFlash];
}
#warning 关闭闪光灯
-(void)closeFlash{
    [self.AVSession stopRunning];
}

#warning 切换前后摄像头
-(void)changeImagePicker{
    
}


- (AVCaptureDevice *)cameraWithPosition:(AVCaptureDevicePosition)position
{
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *device in devices )
        if ( device.position == position )
            return device;
    return nil;
}

- (void)swapFrontAndBackCameras {
    // Assume the session is already running
    
    NSArray *inputs =self.AVSession.inputs;
    for (AVCaptureDeviceInput *input in inputs ) {
        AVCaptureDevice *device = input.device;
        if ( [device hasMediaType:AVMediaTypeVideo] ) {
            AVCaptureDevicePosition position = device.position;
            AVCaptureDevice *newCamera =nil;
            AVCaptureDeviceInput *newInput =nil;
            
            if (position ==AVCaptureDevicePositionFront)
                newCamera = [self cameraWithPosition:AVCaptureDevicePositionBack];
            else
                newCamera = [self cameraWithPosition:AVCaptureDevicePositionFront];
            newInput = [AVCaptureDeviceInput deviceInputWithDevice:newCamera error:nil];
            
            // beginConfiguration ensures that pending changes are not applied immediately
            [self.AVSession beginConfiguration];
            
            [self.AVSession removeInput:input];
            [self.AVSession addInput:newInput];
            
            // Changes take effect once the outermost commitConfiguration is invoked.
            [self.AVSession commitConfiguration];
            break;
        }
    }
}
#warning 录制
-(void)luImagePicker:(UIButton *)button{
    UIButton *btn = [self.view viewWithTag:299];
    if ([button.titleLabel.text isEqualToString:@"开始"]) {
         [_imagePickerController startVideoCapture];
        [btn setTitle:@"结束" forState:UIControlStateNormal];
    }
    else{
        [_imagePickerController stopVideoCapture];
        [btn setTitle:@"开始" forState:UIControlStateNormal];
    }
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
