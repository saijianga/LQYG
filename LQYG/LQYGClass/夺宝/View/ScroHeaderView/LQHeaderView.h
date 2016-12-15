//
//  LQHeaderView.h
//  LQYG
//
//  Created by issuser on 2016/10/20.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FView.h"
#import "LQCustonButton.h"
#import "LQCustomTimerButton.h"
@interface LQHeaderView : UIView

@property(nonatomic,strong)UIScrollView *scrImagePage;
@property(nonatomic,strong)UIView *NoticPageView;
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,strong)NSTimer *STimer;
//@property(nonatomic,strong)UIImageView *GImageView;
//@property(nonatomic,strong)UILabel *GLabel;
@property(nonatomic,strong)UIScrollView *GScroView;
@property(nonatomic,assign)int nu;
@property(nonatomic,strong)NSMutableArray *nameArr;
@property(nonatomic,strong)FView *lqview;
@property(nonatomic,strong)FView *NView;
//@property(nonatomic,strong)UIView *SView;
@property(nonatomic,strong)NSArray *timerArr;
@property(nonatomic,assign)int fs;


-(void)advertisementScrollPage:(NSArray *)arr;
-(void)getPricePersonPage:(NSArray *)arr;
-(void)getLatestThings:(NSArray *)arr;
-(void)recomedLastThings:(NSArray *)arr;
@end
