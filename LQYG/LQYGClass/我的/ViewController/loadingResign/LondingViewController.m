//
//  LondingViewController.m
//  LQYG
//
//  Created by issuser on 2016/11/1.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "LondingViewController.h"

@interface LondingViewController ()

@end

@implementation LondingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[UIDevice currentDevice].systemVersion floatValue]>=7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)loadingApp:(id)sender {
    NSUserDefaults *defaults = [[NSUserDefaults alloc] init];
    [defaults setObject:@"loading" forKey:@"loading"];
    [defaults synchronize];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)forgetPassWorld:(id)sender {
}

- (IBAction)resignByPhone:(id)sender {
}

- (IBAction)loadingByQQ:(id)sender {
}

- (IBAction)loadingByWetchat:(id)sender {
}
@end
