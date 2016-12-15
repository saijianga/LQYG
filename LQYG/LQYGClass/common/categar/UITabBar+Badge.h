//
//  UITabBar+Badge.h
//  LQYG
//
//  Created by issuser on 2016/10/26.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (Badge)
- (void)showBadgeOnItemIndex:(int)index;    //显示小红点

- (void)hideBadgeOnItemIndex:(int)index;    //隐藏小红点

- (void)setBadgeValue:(NSInteger)value AtIndex:(NSInteger)index;

- (void)hideBadgeValueAtIndex:(NSInteger)index;
@end
