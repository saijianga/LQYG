//
//  BaiDuViewController.h
//  LQYG
//
//  Created by issuser on 2016/11/25.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>
@interface BaiDuViewController : UIViewController<BMKMapViewDelegate,BMKLocationServiceDelegate>
@property(nonatomic,strong)BMKMapView *mapView;
@property(nonatomic,strong)BMKLocationService *locService;
@end
