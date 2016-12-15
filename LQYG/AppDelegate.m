//
//  AppDelegate.m
//  LQYG
//
//  Created by issuser on 2016/10/19.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "AppDelegate.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <RongIMKit/RongIMKit.h>
#import "CYLTabBarControllerConfig.h"
#import "detailedViewController.h"//要跳转的页面
#import "LBLaunchImageAdView.h"
BMKMapManager *_mapManager;

@interface AppDelegate ()

@end

@implementation AppDelegate
//接受消息
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    //更改图标数据
    [UIApplication sharedApplication].applicationIconBadgeNumber = [change[@"new"] integerValue];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //极光
   
    //用来保存基于系统级别的通知设置(适用于ios8之后的情况)
    UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    [application registerUserNotificationSettings:setting];
    
     [self jgPush:launchOptions];
    //判断是否是通过点击通知打开了应用程序
    if (launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey]) {
        //跳转界面
        
        [self getPushMessageAtStateActive:@{@"aps":@"1"}];
    }
    else{
        
        [self getPushMessageAtStateActive:@{@"aps":@"1_1"}];
    }
    self.window.backgroundColor = [UIColor whiteColor];
    
    /***********广告图加载***************/
    LBLaunchImageAdView *adview = [[LBLaunchImageAdView alloc] initWithWindow:_window adType:FullScreenAdType];
    adview.localAdImgName = @"qidong.gif";
    adview.clickBlock = ^(NSInteger tag){
        switch (tag) {
            case 1100:
            {
//                [[NSNotificationCenter defaultCenter] postNotificationName:@"postAdverson" object:nil];
                [self setIsOneAdver];//存储标志
                CYLTabBarControllerConfig *tabBarControllerConfig = [[CYLTabBarControllerConfig alloc] init];
                [self.window setRootViewController:tabBarControllerConfig.tabBarController];
                [self.window makeKeyAndVisible];
                
            }
                break;
            case 1101:
            {
                CYLTabBarControllerConfig *tabBarControllerConfig = [[CYLTabBarControllerConfig alloc] init];
                [self.window setRootViewController:tabBarControllerConfig.tabBarController];
                [self.window makeKeyAndVisible];
            }
                break;
            case 1102:
            {
                CYLTabBarControllerConfig *tabBarControllerConfig = [[CYLTabBarControllerConfig alloc] init];
                [self.window setRootViewController:tabBarControllerConfig.tabBarController];
                [self.window makeKeyAndVisible];
            }
                break;
            default:
                break;
        }
    };
    

//    CYLTabBarControllerConfig *tabBarControllerConfig = [[CYLTabBarControllerConfig alloc] init];
//    [self.window setRootViewController:tabBarControllerConfig.tabBarController];
//    [self.window makeKeyAndVisible];

   
    [self customizeInterface];

    [self setOtherID];
    
    // Override point for customization after application launch.
    return YES;
}
#pragma mark 其他应用注册相关ID
-(void)setOtherID{
    [WXApi registerApp:@"wx1eabae2ef6ddbf6c"];//极光
    [AMapServices sharedServices].apiKey = @"466655b0163eca030cfa3d9f69c92726";//高德
    _mapManager = [[BMKMapManager alloc] init];
    
#warning 如果要关注网络及授权验证事件,请设定 generalDelegate
    BOOL ret = [_mapManager start:@"b9vFQaLVrUCHHcXOwX1SZXsO20oIvv5T" generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed");
    }
    
#warning 融云服务
    [[RCIM sharedRCIM] initWithAppKey:@"e0x9wycfed8nq"];//测试的appkey  上线的话 需要换成生产的
    /*
     QOJJK3BhwyTj1sGdby3rBaWYi3h7X69p/P938u0cKThWtmAcXAJsvrtijlUYpVvGt7xVWgROEkmbLrzUsKlTTBxtW+XPn3lq
     
     (jiangsai      uiyq231sbV8KFNEbsPjoJRusbRhUzMvbfgjXZ7pbn8hZXEE8TPyU9+tdxKd0wmypiSgYJQXd0FWWpPbHrqraHA==)
     */
    //链接融云服务器 通过Token
    [[RCIM sharedRCIM] connectWithToken:@"QOJJK3BhwyTj1sGdby3rBaWYi3h7X69p/P938u0cKThWtmAcXAJsvrtijlUYpVvGt7xVWgROEkmbLrzUsKlTTBxtW+XPn3lq" success:^(NSString *userId) {
        NSLog(@"登录成功");
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登录的错误码为%ld",status);
    } tokenIncorrect:^{
        //Token 过期或者不正确
        //如果设置了Token有效期并且Token过期,请重新请求您的服务器获取新的token
        //如果没有设置token有效期却提示token错误,请检查您的客户端和服务器的appkey是否匹配,还有检查您获取token流程
        NSLog(@"token错误");
    }];
    
    [[RCIMClient sharedRCIMClient] disconnect:YES];
}
#pragma mark 极光
-(void)jgPush:(NSDictionary *)launchOptions{
    //添加初始化JPush代码
    // Optional
    // 获取IDFA
    // 如需使用IDFA功能请添加此代码并在初始化方法的advertisingIdentifier参数中填写对应值
  //  NSString *advertisingId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    
    // Required
    // init Push
    // notice: 2.1.5版本的SDK新增的注册方法，改成可上报IDFA，如果没有使用IDFA直接传nil
    // 如需继续使用pushConfig.plist文件声明appKey等配置内容，请依旧使用[JPUSHService setupWithOption:launchOptions]方式初始化。
    [JPUSHService setupWithOption:launchOptions appKey:@"5e07358adbd5acc5f3cc50de"
                          channel:@""
                 apsForProduction:FALSE
            advertisingIdentifier:nil];
    
    //添加初始化APNs代码
    //Required
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
        JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
        entity.types = UNAuthorizationOptionAlert|UNAuthorizationOptionBadge|UNAuthorizationOptionSound;
        [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    }
    else if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //可以添加自定义categories
        [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                          UIUserNotificationTypeSound |
                                                          UIUserNotificationTypeAlert)
                                              categories:nil];
    }
    else {
        //categories 必须为nil
        [JPUSHService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                          UIRemoteNotificationTypeSound |
                                                          UIRemoteNotificationTypeAlert)
                                              categories:nil];
        
        
    }
    
   
    
    
}
- (void)customizeInterface {
    [self setUpNavigationBarAppearance];
}

/**
 *  设置navigationBar样式
 */
- (void)setUpNavigationBarAppearance {
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    
    UIImage *backgroundImage = nil;
    NSDictionary *textAttributes = nil;
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        backgroundImage = [UIImage imageNamed:@"navigationbar_background_tall"];
        
        textAttributes = @{
                           NSFontAttributeName : [UIFont boldSystemFontOfSize:18],
                           NSForegroundColorAttributeName : [UIColor blackColor],
                           };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        backgroundImage = [UIImage imageNamed:@"navigationbar_background"];
        textAttributes = @{
                           UITextAttributeFont : [UIFont boldSystemFontOfSize:18],
                           UITextAttributeTextColor : [UIColor blackColor],
                           UITextAttributeTextShadowColor : [UIColor clearColor],
                           UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetZero],
                           };
#endif
    }
    
    [navigationBarAppearance setBackgroundImage:backgroundImage
                                  forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
}
#pragma mark 注册APNs 成功并上报DEVICETOKEN
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
}
#pragma mark 注册APNs失败
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    //Optional
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_1
- (void)application:(UIApplication *)application
didRegisterUserNotificationSettings:
(UIUserNotificationSettings *)notificationSettings {
}

// Called when your app has been activated by the user selecting an action from
// a local notification.
// A nil action identifier indicates the default action.
// You should call the completion handler as soon as you've finished handling
// the action.
- (void)application:(UIApplication *)application
handleActionWithIdentifier:(NSString *)identifier
forLocalNotification:(UILocalNotification *)notification
  completionHandler:(void (^)())completionHandler {
}

// Called when your app has been activated by the user selecting an action from
// a remote notification.
// A nil action identifier indicates the default action.
// You should call the completion handler as soon as you've finished handling
// the action.
- (void)application:(UIApplication *)application
handleActionWithIdentifier:(NSString *)identifier
forRemoteNotification:(NSDictionary *)userInfo
  completionHandler:(void (^)())completionHandler {
   
    
}
#endif


//添加处理APNs通知回调方法

//请在AppDelegate.m实现该回调方法并添加回调方法中的代码
#pragma mark- JPUSHRegisterDelegate

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
#warning 程序处于活跃状态时 调用此处
    [self getPushMessageAtStateActive:@{@"aps":@"2 -- iOS 10 Support willPresentNotification"}];//弹框
    
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler(UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionBadge | UNNotificationPresentationOptionSound); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以选择设置
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
#warning 程序处于非活跃状态时, 处于后台时 点击通知调用此处
    [self getPushMessageAtStateActive:@{@"aps":@"2 -- iOS 10 Support didReceiveNotificationResponse"}];//弹框
    // Required
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler();  // 系统要求执行这个方法
}
//ios 7以上调用
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    //跳转界面
    if (application.applicationState == UIApplicationStateActive) {
        //界面跳转
       
        [self getPushMessageAtStateActive:@{@"aps":@"2 -- ios 7以上调用 didReceiveRemoteNotification"}];//弹框
    }
    else{
        [self getPushMessageAtStateActive:@{@"aps":@"2--1 -- ios 7以上调用 didReceiveRemoteNotification"}];//弹框
        //不跳转
       
    }
        // Required, iOS 7 Support
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    //跳转界面
    if (application.applicationState == UIApplicationStateActive) {
        //界面跳转
        [self getPushMessageAtStateActive:@{@"aps":@"3 -- ios 7以上调用 didReceiveRemoteNotification"}];//弹框
        
    }
    else{
        //不跳转
        [self getPushMessageAtStateActive:@{@"aps":@"3--1 -- ios 7以上调用 didReceiveRemoteNotification"}];//弹框
        
    }
    
    
    
    // Required,For systems with less than or equal to iOS6
    [JPUSHService handleRemoteNotification:userInfo];
   
}
- (void)application:(UIApplication *)application
didReceiveLocalNotification:(UILocalNotification *)notification {
    [JPUSHService showLocalNotificationAtFront:notification identifierKey:nil];
}
#pragma mark 重写AppDelegate的handleOpenURL和openURL方法：
-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [WXApi handleOpenURL:url delegate:self];
}
-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    return [WXApi handleOpenURL:url delegate:self];
}

#pragma mark 现在，你的程序要实现和微信终端交互的具体请求与回应，因此需要实现WXApiDelegate协议的两个方法：
-(void)onReq:(BaseReq *)req{
    //onReq是微信终端向第三方程序发起请求，要求第三方程序响应。第三方程序响应完后必须调用sendRsp返回。在调用sendRsp返回时，会切回到微信终端程序界面。
    [[SwitchController sharedSVC] showMessage:@"成功" inView:_window];
}
-(void)onResp:(BaseResp *)resp{
    //如果第三方程序向微信发送了sendReq的请求，那么onResp会被回调。sendReq请求调用后，会切到微信终端程序界面。
    
    //把返回的类型换成与发送时相对于的返回类型,这里为SendMessageToWXResp
    SendMessageToWXResp *sendRest = (SendMessageToWXResp *)resp;
    //使用UIAlertView 显示回调信息
    NSString *str = [NSString stringWithFormat:@"%d",sendRest.errCode];
    NSDictionary *dic = [[NSDictionary alloc] init];
    if ([str isEqualToString:@"0"]) {
        //分享成功
        dic = @{@"code":@"0"};
       
    }
    else{
        dic = @{@"code":@"-2"};
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"colseShare" object:self userInfo:dic];
  
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    [application setApplicationIconBadgeNumber:0];
    [application cancelAllLocalNotifications];
    
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
#pragma mark 弹框
#pragma mark -- 程序运行时收到通知
-(void)getPushMessageAtStateActive:(NSDictionary *)pushMessageDic{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"信息"
                                                                             message:[pushMessageDic objectForKey:@"aps"]
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"查看"style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        detailedViewController *detailControl = [[detailedViewController alloc] init];
        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:detailControl];
        [self.window.rootViewController presentViewController:nc animated:YES completion:nil];
        }];
                                    
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消"style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    [alertController addAction:confirmAction];
    [alertController addAction:cancelAction];
    [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];
    
    
}
                                    
+(AppDelegate *)getAppDelegat{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}
-(void)dealloc{
   
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma Mark设置是否是同一张图片
-(void)setIsOneAdver{
    NSUserDefaults *defaults = [[NSUserDefaults alloc] init];
    [defaults setObject:@"one" forKey:@"one"];
    [defaults synchronize];
}


@end
