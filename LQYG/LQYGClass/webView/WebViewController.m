//
//  WebViewController.m
//  LQYG
//
//  Created by issuser on 2016/10/26.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
   //@"http://db.3z.cc/index.php?tp=front/activity_detail&act_id=2324572&sign=f4876f49eec70073d8a3b46577792554&pt=2&ver=1.0.8&uid=3845648&imei=96F2AFD1-9B2B-4C95-BAAC-52733E3B3856&device_type=10.0.2&qyb=0&appid=14"
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
    [self.view addSubview:_webView];
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
