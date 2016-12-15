//
//  GoDeMapViewController.h
//  LQYG
//
//  Created by issuser on 2016/11/28.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AVFoundation/AVFoundation.h>
#import "CLLocation+YCLocation.h"
@interface GoDeMapViewController : UIViewController<MAMapViewDelegate,AMapLocationManagerDelegate,AVAudioPlayerDelegate>
@property(nonatomic,strong)MAMapView *mapView;
@property (nonatomic, strong) MAAnnotationView *userLocationAnnotationView;
@property(nonatomic,strong)NSMutableArray *locationArr;
@property(nonatomic,strong)MAPointAnnotation *pointAnnotation;
@property(nonatomic,strong)AMapLocationManager *locationManager;
@property(nonatomic,strong)NSMutableArray *regions;
@property(nonatomic,strong)AVAudioPlayer *avAudioPlayer;//播放器player;
@end
