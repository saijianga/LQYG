//
//  GoDeMapViewController.m
//  LQYG
//
//  Created by issuser on 2016/11/28.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "GoDeMapViewController.h"

@interface GoDeMapViewController ()
{
    CLLocationCoordinate2D *runningCoords;
    MAMultiPolyline *polyline;
}
@end

@implementation GoDeMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    
    
    //初始化大头针
    _pointAnnotation = [[MAPointAnnotation alloc] init];
    
    _locationArr = [[NSMutableArray alloc] init];
    //初始化地图
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:_mapView];
    _mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _mapView.delegate = self;
    _mapView.showsUserLocation = YES;
    
    /*
     MAUserTrackingModeFollow  跟随用户位置移动，并将定位点设置成地图中心点
     MAUserTrackingModeFollowWithHeading 跟随用户的位置和角度移动
     MAUserTrackingModeNone 仅在地图上显示，不跟随用户位置
     */
    [_mapView setUserTrackingMode:MAUserTrackingModeFollow animated:YES];
    [_mapView setZoomLevel:16.1 animated:YES];
    //使用locationManager方法定位
    _locationManager = [[AMapLocationManager alloc] init];
    _locationManager.delegate = self;
    [_locationManager setPausesLocationUpdatesAutomatically:NO];
    [_locationManager setAllowsBackgroundLocationUpdates:YES];
    [_locationManager startUpdatingLocation];
    
    _regions = [[NSMutableArray alloc] init];
    
    //设置播放警告音
    [self playWaringSound];
#warning 设置固定经纬度
    /*
     116.291307,40.050827
     */
    
    CLLocation *currentLocation = [[CLLocation alloc] initWithLatitude:40.043800 longitude:116.284037];
   
    //设置地理围栏中心点
    [self addCircleReionForCoordinate:currentLocation.coordinate];
    
       // Do any additional setup after loading the view.
}
#pragma mark 添加地理围栏
- (void)addCircleReionForCoordinate:(CLLocationCoordinate2D)coordinate{
    
    int radius = 100;
    //创建 circleRegion
    AMapLocationCircleRegion *cirRengion = [[AMapLocationCircleRegion alloc] initWithCenter:coordinate radius:radius identifier:@"circleRegion"];
    //添加地理围栏
    [_locationManager startMonitoringForRegion:cirRengion];
    //保存地理围栏
    [self.regions addObject:cirRengion];
    
    //添加Overlay
    MACircle *circle = [MACircle circleWithCenterCoordinate:coordinate radius:radius];
    [self.mapView addOverlay:circle];
    [self.mapView setVisibleMapRect:circle.boundingMapRect];
}
#pragma mark 地理围栏回调
-(void)amapLocationManager:(AMapLocationManager *)manager didStartMonitoringForRegion:(AMapLocationRegion *)region{
    NSLog(@"开始监听地理围栏%@",region);
    [self startPlay];
}
-(void)amapLocationManager:(AMapLocationManager *)manager monitoringDidFailForRegion:(AMapLocationRegion *)region withError:(NSError *)error{
    NSLog(@"监听地理围栏失败%@",error.localizedDescription);
}
-(void)amapLocationManager:(AMapLocationManager *)manager didEnterRegion:(AMapLocationRegion *)region{
    NSLog(@"进入地理围栏%@",region);
    [self startPlay];
    [self ceshi:@"进来"];
}
-(void)amapLocationManager:(AMapLocationManager *)manager didExitRegion:(AMapLocationRegion *)region{
    NSLog(@"退出地理围栏%@",region);
    [self startPlay];
    [self ceshi:@"出去"];
    
}
-(void)amapLocationManager:(AMapLocationManager *)manager didDetermineState:(AMapLocationRegionState)state forRegion:(AMapLocationRegion *)region{
    NSLog(@"didDetermineState:%@; state:%ld", region, (long)state);
}
#pragma mark 测试
-(void)ceshi:(NSString *)st{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"信息"
                                                                             message:st
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"查看"style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消"style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    [alertController addAction:confirmAction];
    [alertController addAction:cancelAction];
     [self presentViewController:alertController animated:YES completion:nil];
}
#pragma mark 设置自定义定位效果

//定位效果由定位点处的标记（MAUserLocation）和精度圈（MACircle）组成。您可以自定义定位效果。
-(MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id<MAOverlay>)overlay{
    if ([overlay isKindOfClass:[MAMultiPolyline class]])
    {
        MAMultiColoredPolylineRenderer *polylineRenderer = [[MAMultiColoredPolylineRenderer alloc] initWithMultiPolyline:overlay];
        polylineRenderer.lineWidth = 2.f;
        polylineRenderer.strokeColor = [UIColor redColor];
        polylineRenderer.gradient = YES;
        return polylineRenderer;
    }
    else if ([overlay isKindOfClass:[MACircle class]]){
        MACircleRenderer *circleRenderer = [[MACircleRenderer alloc] initWithCircle:overlay];
        circleRenderer.lineWidth = 5.0f;
        circleRenderer.strokeColor = [UIColor blueColor];
        circleRenderer.fillColor = [UIColor clearColor];
        return circleRenderer;
    }
    
    return nil;
}

#pragma mark 获取定位经纬度
-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation{
    
    NSLog(@"定位");
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"信息"
                                                                             message:[NSString stringWithFormat:@"%f -- %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude]
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"查看"style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消"style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    [alertController addAction:confirmAction];
    [alertController addAction:cancelAction];
   // [self presentViewController:alertController animated:YES completion:nil];
    
    /*
    //地图旋转
    if (!updatingLocation && _userLocationAnnotationView != nil) {
        [UIView animateWithDuration:0.1 animations:^{
            double degree = userLocation.heading.trueHeading;
            _userLocationAnnotationView.transform = CGAffineTransformMakeRotation(degree * M_PI / 90.f);
        }];
    }
    */
    
   // [self addCircleReionForCoordinate:userLocation.coordinate];//设置地理围栏中心点  测试
   // [self startPlay];//测试播放音乐
    
    /*
    //绘制折线  方式一
    [_locationArr addObject:userLocation];
    CLLocationCoordinate2D commonPolylineCoords[_locationArr.count];
    for (long int i =0; i < _locationArr.count; i++) {
        MAUserLocation *location = _locationArr[i];
        commonPolylineCoords[i].latitude = location.coordinate.latitude;
        commonPolylineCoords[i].longitude = location.coordinate.longitude;
        
    }
    
    MAPolyline *commonPolyLine = [MAPolyline polylineWithCoordinates:commonPolylineCoords count:_locationArr.count];
    [_mapView addOverlay:commonPolyLine];
    
    */

    
}
#pragma mark 当设备移动的距离超过设置的经度范围时会被调用 传过来坐标
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
}

//设置折线样式
- (MAOverlayView *)mapView:(MAMapView *)mapView viewForOverlay:(id <MAOverlay>)overlay
{
    if ([overlay isKindOfClass:[MAPolyline class]])
    {
        MAPolylineView *polylineView = [[MAPolylineView alloc] initWithPolyline:overlay];
        
        polylineView.lineWidth = 10.f;
        polylineView.strokeColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.6];
        polylineView.lineJoin = kCGLineJoinBevel;//连接类型
        polylineView.lineCap = kCGLineCapRound;//端点类型
        return polylineView;
    }
    
    return nil;
}
#pragma mark 自定义样式的定位点,地图旋转
-(void)mapView:(MAMapView *)mapView didAddAnnotationViews:(NSArray *)views{
    MAAnnotationView *view = views[0];
    //放到该方法中用以保证userlocation的annotationview 已经添加到地图上了.
    if ([view.annotation isKindOfClass:[MAUserLocation class]]) {
        MAUserLocationRepresentation *pre = [[MAUserLocationRepresentation alloc] init];
        pre.fillColor = [UIColor colorWithRed:0.9 green:0.1 blue:0.1 alpha:0.2];
        pre.strokeColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.9 alpha:1.0];
        pre.image = [UIImage imageNamed:@"userPosition"];
        pre.lineWidth = 2;
        [_mapView updateUserLocationRepresentation:pre];
      //  view.calloutOffset = CGPointMake(0, 0);//设置为中心点
        view.canShowCallout = NO;
        _userLocationAnnotationView = view;
    }
    
}
#pragma mark 设置大头针样式
-(MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation{
    if ([annotation isKindOfClass:[MAPointAnnotation class]]) {
        static NSString *pointReuserIndentifier = @"pointReuseIndentifier";
        MAPinAnnotationView *annotationView = (MAPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuserIndentifier];
        if (annotationView == nil) {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuserIndentifier];
        }
        annotationView.canShowCallout = YES;//设置气泡可以弹出
        annotationView.animatesDrop = YES;//设置标注动画显示
        annotationView.draggable = NO;//设置标注可以拖动,默认为no
        annotationView.pinColor = MAPinAnnotationColorPurple;//设置大头针的颜色
        return annotationView;
    }
    return nil;
}
#pragma mark locationManager 定位的代理方法
-(void)amapLocationManager:(AMapLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"定位失败");
}
-(void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location{
    NSLog(@"lat: %f  lon: %f",location.coordinate.latitude,location.coordinate.longitude);
    //绘制折线 方式二
    NSMutableArray * indexes = [NSMutableArray array];

    [_locationArr addObject:location];
    
    //设置第一个开始定位的大头针
    MAUserLocation *oneLocation = _locationArr[0];
    _pointAnnotation.coordinate = CLLocationCoordinate2DMake(oneLocation.coordinate.latitude, oneLocation.coordinate.longitude);
    _pointAnnotation.title = @"始点";
    [_mapView addAnnotation:_pointAnnotation];
    
    

    
    if (_locationArr.count > 2) {
        runningCoords = (CLLocationCoordinate2D *)malloc(_locationArr.count * sizeof(CLLocationCoordinate2D)) ;
        
        
        
        for (long int i =0; i < _locationArr.count; i++) {
            @autoreleasepool {
                MAUserLocation *location = _locationArr[i];
                runningCoords[i].latitude = location.coordinate.latitude;
                runningCoords[i].longitude = location.coordinate.longitude;
                [indexes addObject:@(i)];
            }
            
        }
        
        polyline = [MAMultiPolyline polylineWithCoordinates:runningCoords count:_locationArr.count drawStyleIndexes:indexes];
        [_mapView addOverlay:polyline];
//        const CGFloat screenEdgeInset = 20;
//        UIEdgeInsets inset = UIEdgeInsetsMake(screenEdgeInset, screenEdgeInset, screenEdgeInset, screenEdgeInset);
//        [self.mapView setVisibleMapRect:polyline.boundingMapRect edgePadding:inset animated:NO];
    }
    
    
    
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    _mapView.mapType = MAMapTypeStandard;
    //停止地理围栏
    [self.regions enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [_locationManager stopMonitoringForRegion:(AMapLocationRegion *)obj];
    }];
}
#pragma mark 播放器 播放警告
-(void)playWaringSound{
    NSString *string = [[NSBundle mainBundle] pathForResource:@"sound" ofType:@"caf"];
    NSURL *url = [NSURL fileURLWithPath:string];
    //初始化播放器
    _avAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    _avAudioPlayer.delegate = self;
    //初始化音量大小
    _avAudioPlayer.volume = 10;
    //设置音乐循环次数
    _avAudioPlayer.numberOfLoops = 1;
    //与播放
    [_avAudioPlayer prepareToPlay];
}
//停止
-(void)stopPlay{
    _avAudioPlayer.currentTime = 0;
    [_avAudioPlayer stop];
}
//开始
-(void)startPlay{
    [_avAudioPlayer play];
}
#pragma mark 播放完成实现代理
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    NSLog(@"播放完成");
   
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
