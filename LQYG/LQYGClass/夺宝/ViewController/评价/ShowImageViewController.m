//
//  ShowImageViewController.m
//  LQYG
//
//  Created by issuser on 2016/11/9.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "ShowImageViewController.h"

@interface ShowImageViewController ()

@end

@implementation ShowImageViewController

-(void)viewWillAppear:(BOOL)animated{
     [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:89/255.0 green:89/255.0 blue:89/255.0 alpha:1]];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[UIDevice currentDevice].systemVersion floatValue]>=7.0){
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.view.backgroundColor = [UIColor blackColor];
    _tool = [[UIToolbar alloc] initWithFrame:CGRectMake(0, -64, SCREEN_WIDTH, 64)];
    [_tool setBarStyle:UIBarStyleBlackTranslucent];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 17, 60, 30);
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(cancelAntion) forControlEvents:UIControlEventTouchUpInside];
    [_tool addSubview:button];
    
    _scrol = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _scrol.pagingEnabled = YES;
    _scrol.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_scrol];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [_scrol addGestureRecognizer:tap];
    [self setScro:_imageArr];
    [self.view addSubview:_tool];
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 100, SCREEN_WIDTH, 100)];
    //_textView.backgroundColor = [UIColor]
    [self.view addSubview:_textView];
    [_textView setEditable:NO];
    _textView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    _textView.textColor = [UIColor whiteColor];
    _textView.text = @"车上都很谨慎的换发动机号发动机号发动机号房间都很费劲的恢复的减肥活动经费回到家后发动机发货的减肥活动经费回到家发货的积分换时间段和风景都很费劲的复活节的复活节车上都很谨慎的换发动机号发动机号发动机号房间都很费劲的恢复的减肥活动经费回到家后发动机发货的减肥活动经费回到家发货的积分换时间段和风景都很费劲的复活节的复活节";
    // Do any additional setup after loading the view.
}
-(void)setScro:(NSArray *)arr{
    for (int i = 0;i < arr.count;i++) {
        CGSize size = [UIImage imageNamed:arr[i]].size;
        if (size.width > SCREEN_WIDTH) {
            size.width = SCREEN_WIDTH;
        }
        if (size.height > SCREEN_HEIGHT) {
            size.height = SCREEN_HEIGHT;
        }
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        imageView.image = [UIImage imageNamed:arr[i]];
        imageView.backgroundColor = [UIColor colorWithRed:arc4random() % 256 /255.0 green:arc4random() % 256 /255.0 blue:arc4random() % 256 /255.0 alpha:1];
        imageView.center = CGPointMake(SCREEN_WIDTH / 2 *(1+i*2), SCREEN_HEIGHT / 2);
        [_scrol addSubview:imageView];
        NSLog(@"实际%f --- %f",size.width,size.height);
    }
    _scrol.contentSize = CGSizeMake(arr.count * SCREEN_WIDTH, SCREEN_HEIGHT);
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:255/255.0 green:197/255.0 blue:2/255.0 alpha:1]];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
-(void)tapAction{
    NSLog(@"点击");
    _isClick = !_isClick;
    if (_isClick) {
        [UIView animateWithDuration:0.5 animations:^{
            _tool.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
        }];
       
    }
    else{
        [UIView animateWithDuration:0.5 animations:^{
            _tool.frame = CGRectMake(0, -64, SCREEN_WIDTH, 64);
        }];
 
    }
    
}
-(void)cancelAntion{
//    [self.navigationController popViewControllerAnimated:YES];
#warning 测试将图片保存在本地相册
    [self saveImage];
}

#pragma mark 这次测试将图片保存在本地相册中
-(void)saveImage{
    UIImage *image = [UIImage imageNamed:_imageArr[1]];
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error == nil) {
      
    [UIView animateWithDuration:0.1 animations:^{
        [[SwitchController sharedSVC] showMessage:@"保存成功" inView:self.view];
    } completion:^(BOOL finished) {
        if (finished) {
            [NSThread sleepForTimeInterval:2];
             [self.navigationController popViewControllerAnimated:YES];
        }
    }];
       
    }
    else
    {
        NSLog(@"失败");
    [UIView animateWithDuration:0.5 animations:^{
        [[SwitchController sharedSVC] showMessage:@"保存失败" inView:self.view];
    } completion:^(BOOL finished) {
        if (finished) {
            [NSThread sleepForTimeInterval:2];//线程延时一段时间
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
    }
    
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSLog(@"点击");
//    _isClick = !_isClick;
//    if (_isClick) {
//        [self.navigationController setNavigationBarHidden:NO animated:YES];
//    }
//    else
//        [self.navigationController setNavigationBarHidden:YES animated:YES];
    
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
