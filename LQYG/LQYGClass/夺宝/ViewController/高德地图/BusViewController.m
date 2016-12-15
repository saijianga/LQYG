//
//  BusViewController.m
//  LQYG
//
//  Created by issuser on 2016/11/30.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "BusViewController.h"

@interface BusViewController ()

@end

@implementation BusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
    [self.view addSubview:_mapView];
    _mapView.showsUserLocation = YES;
    [_mapView setUserTrackingMode:MAUserTrackingModeFollow animated:YES];
    [_mapView setZoomLevel:16.1 animated:YES];
    
    _locationManager = [[AMapLocationManager alloc] init];
    _locationManager.delegate = self;
    [_locationManager setPausesLocationUpdatesAutomatically:NO];
    [_locationManager setAllowsBackgroundLocationUpdates:YES];
    [_locationManager startUpdatingLocation];
    
    _textFiled = [[UITextField alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_mapView.frame)+20, 200, 44)];
    _textFiled.placeholder = @"sdh";
    _textFiled.delegate = self;
    _textFiled.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_textFiled];
    
    _search = [[AMapSearchAPI alloc] init];
    _search.delegate = self;
    
    // Do any additional setup after loading the view.
}
#pragma mark locationmanager delegate
-(void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location{
    
}
#pragma mark textfile delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"jsh");
    AMapGeocodeSearchRequest *geo = [[AMapGeocodeSearchRequest alloc] init];
    geo.city = @"北京";
    geo.address = textField.text;
    [_search AMapGeocodeSearch:geo];
    return YES;
}
#pragma mark search delegate
-(void)onGeocodeSearchDone:(AMapGeocodeSearchRequest *)request response:(AMapGeocodeSearchResponse *)response{
    if (response.geocodes.count == 0) {
        return;
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
