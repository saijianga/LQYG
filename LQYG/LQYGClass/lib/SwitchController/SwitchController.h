//
//  SwitchController.h
//  ZHYL
//
//  Created by issuser on 16/10/12.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SwitchController : NSObject
+(instancetype)sharedSVC;



-(UINavigationController *)topNavigationController;


/**
 *  展示信息到window
 */
-(void)showMessage:(NSString *)message;
-(void)showMessage:(NSString *)message duration:(NSTimeInterval)time;
-(void)setHudMessage:(NSString*)message;
-(void)showMessage:(NSString *)message inView:(UIView *)view;

-(void)showLoadingWithMessage:(NSString*)message;
-(void)hideHud;
-(void)hideHudAfterDelay:(NSTimeInterval)delay;

-(void)showLoadingWithMessage:(NSString *)message inView:(UIView *)view;
-(void)hideLoadingView;
@end
