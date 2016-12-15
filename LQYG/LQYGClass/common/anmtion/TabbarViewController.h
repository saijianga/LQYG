//
//  TabbarViewController.h
//  LQYG
//
//  Created by issuser on 2016/11/17.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabbarViewController : UIViewController<UITabBarControllerDelegate>
@property(readwrite, nonatomic)NSInteger selectedIndex;
-(NSUInteger)defaultSelectedIndex;
-(NSArray*)viewControllers;
/**
 *  是否可以选择当前某页面
 *
 *  @param index          页面所在index
 *  @param viewController 此VC
 *
 *  @return 默认为YES
 */
-(BOOL)shouldSelectIndex:(NSInteger)index viewController:(UIViewController*)viewController;
@end
