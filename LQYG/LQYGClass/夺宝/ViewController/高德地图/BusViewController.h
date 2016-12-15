//
//  BusViewController.h
//  LQYG
//
//  Created by issuser on 2016/11/30.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
@interface BusViewController : UIViewController<AMapLocationManagerDelegate,AMapSearchDelegate,UITextFieldDelegate>
@property(nonatomic,strong)MAMapView *mapView;
@property(nonatomic,strong)AMapLocationManager *locationManager;
@property(nonatomic,strong)AMapSearchAPI *search;
@property(nonatomic,strong)UITextField *textFiled;
@end
