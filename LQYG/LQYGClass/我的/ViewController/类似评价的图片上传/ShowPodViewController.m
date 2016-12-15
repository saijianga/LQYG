//
//  ShowPodViewController.m
//  LQYG
//
//  Created by issuser on 2016/12/8.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "ShowPodViewController.h"

@interface ShowPodViewController ()

@end

@implementation ShowPodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    /*
    CGSize size = self.image.size;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH , size.height / (size.width / SCREEN_WIDTH))];//size.width / (size.height / 150.0)
    imageView.contentMode = UIViewContentModeScaleToFill;
    imageView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2);
    imageView.image = self.image;
    [self.view addSubview:imageView];
    */
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:scrollView];
    scrollView.pagingEnabled = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    for (int i = 0; i < _dataArr.count; i++) {
        UIImage *inage = _dataArr[i];
        CGSize size = inage.size;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH , size.height / (size.width / SCREEN_WIDTH))];//size.width / (size.height / 150.0)
        imageView.contentMode = UIViewContentModeScaleToFill;
        imageView.center = CGPointMake(SCREEN_WIDTH / 2 + SCREEN_WIDTH * i, SCREEN_HEIGHT / 2);
        imageView.image = inage;
        
        [scrollView addSubview:imageView];
    }
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * _dataArr.count, 0);
    
    // Do any additional setup after loading the view.
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
