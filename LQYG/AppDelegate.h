//
//  AppDelegate.h
//  LQYG
//
//  Created by issuser on 2016/10/19.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXApi.h"
#import "JPUSHService.h"//引入JPush所需的头文件
//ios10需要注册APNs所需的头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif
@interface AppDelegate : UIResponder <UIApplicationDelegate,WXApiDelegate,JPUSHRegisterDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,assign)NSInteger value;
//+ (AppDelegate *)getAppDelegate;

@end

