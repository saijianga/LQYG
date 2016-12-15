//
//  SwitchController.m
//  ZHYL
//
//  Created by issuser on 16/10/12.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "SwitchController.h"
#import "MBProgressHUD.h"
@interface SwitchController ()<UIAlertViewDelegate>
{
    UINavigationController __weak* _topNavigationController;
    NSCache* _cacher;
}

@property(weak, nonatomic)UINavigationController* topNavigationController;
@property(strong, nonatomic)MBProgressHUD* hud;
@property (nonatomic, strong) MBProgressHUD *showMessage;
@end
@implementation SwitchController
+(instancetype)sharedSVC
{
    static SwitchController* instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [SwitchController new];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cacher = [[NSCache alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveMemoryWarning) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    }
    return self;
}

-(void)pushReuseObject:(NSObject*)obj {
    NSString* key = NSStringFromClass(obj.class);
    NSCache* cache = [_cacher objectForKey:key];
    if (!cache) {
        cache = [[NSCache alloc] init];
        [cache setCountLimit:1];
        [_cacher setObject:cache forKey:key];
    }
    [cache setObject:obj forKey:key];
}

-(NSObject*)popReuseObjectForClass:(Class)class {
    NSString* key = NSStringFromClass(class);
    NSCache* cache = [_cacher objectForKey:key];
    NSObject *obj = [cache objectForKey:key];
    [cache removeObjectForKey:key];
    return obj;
}

-(void)didReceiveMemoryWarning {
    [_cacher removeAllObjects];
}

-(void)showMessage:(NSString *)message
{
    [self showMessage:message duration:1.5];
}

-(void)showMessage:(NSString *)message duration:(NSTimeInterval)time
{
    self.hud.mode = MBProgressHUDModeText;
    self.hud.detailsLabel.text = message;
    [self.hud showAnimated:YES];
    [self.hud hideAnimated:YES afterDelay:time];
    
}

-(void)showLoadingWithMessage:(NSString*)message
{
    self.hud.mode = MBProgressHUDModeIndeterminate;
    self.hud.detailsLabel.text = message;
    [self.hud showAnimated:YES];
}

-(void)showMessage:(NSString *)message inView:(UIView *)view
{
    [_showMessage removeFromSuperview];
    
    _showMessage = [[MBProgressHUD alloc] initWithView:view];
    _showMessage.mode = MBProgressHUDModeText;
    [view addSubview:_showMessage];
    _showMessage.detailsLabel.text = message;
    [_showMessage showAnimated:YES];
    [_showMessage hideAnimated:YES afterDelay:1.5];
}

-(void)setHudMessage:(NSString*)message {
    self.hud.detailsLabel.text = message;
}

-(void)hideHud
{
    [self.hud hideAnimated:YES];
}

-(void)showLoadingWithMessage:(NSString *)message inView:(UIView *)view
{
    [_showMessage removeFromSuperview];
    _showMessage = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:_showMessage];
    _showMessage.detailsLabel.text = message;
    [_showMessage showAnimated:YES];
}

-(void)hideLoadingView{
    [_showMessage hideAnimated:NO];
}

-(void)hideHudAfterDelay:(NSTimeInterval)delay
{
    [self.hud hideAnimated:YES afterDelay:delay];
}

-(MBProgressHUD *)hud
{
    if (!_hud) {
        UIWindow* keyWindow = [UIApplication sharedApplication].keyWindow;
        _hud = [[MBProgressHUD alloc] initWithView:keyWindow];
        _hud.detailsLabel.font = [UIFont systemFontOfSize:16];
        _hud.animationType = MBProgressHUDAnimationZoom;
        [keyWindow addSubview:_hud];
    }
    return _hud;
}


-(UIWindow *)getTopLevelWindow {
    UIWindow *window = nil;
    for (UIWindow *_window in [[UIApplication sharedApplication] windows]) {
        if(window == nil){
            window = _window;
        }
        if(_window.windowLevel > window.windowLevel){
            window = _window;
        }
    }
    return window;
}



@end
