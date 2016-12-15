//
//  BaiDuViewController.m
//  LQYG
//
//  Created by issuser on 2016/11/25.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "BaiDuViewController.h"

@interface BaiDuViewController ()

@end

@implementation BaiDuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mapView = [[BMKMapView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:_mapView];
    //初始化定位
    _locService = [[BMKLocationService alloc] init];
    _locService.delegate = self;
    [_locService startUserLocationService];
    //设置距离过滤器(默认距离是米)
    _locService.distanceFilter = 5;
    //设置定位精度
    _locService.desiredAccuracy = kCLLocationAccuracyBest;
    
    //展示定位信息
    _mapView.showsUserLocation = YES;//显示定位图层
    //跟随
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;
    
    // Do any additional setup after loading the view.
}
#pragma mark 实现相关delegate 处理位置信息更新
//处理方向变更信息
-(void)didUpdateUserHeading:(BMKUserLocation *)userLocation{
    
}
//处理位置坐标更新
-(void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation{
    [_mapView updateLocationData:userLocation];
}
-(void)viewWillAppear:(BOOL)animated{
    [_mapView viewWillAppear];
    _mapView.delegate = self;
    _locService.delegate = self;
}
-(void)viewWillDisappear:(BOOL)animated{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil;
    _locService.delegate = nil;
    self.tabBarController.tabBar.hidden = NO;
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
