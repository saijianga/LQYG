//
//  MyCollectionReusableView.h
//  LQYG
//
//  Created by issuser on 2016/10/20.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LQHeaderView.h"

@protocol resDelegate;



@interface MyCollectionReusableView : UICollectionReusableView

@property(nonatomic,strong)LQHeaderView *LQView;
@property(nonatomic,strong)UILabel *lineLabel;
@property(nonatomic,assign)id<resDelegate>delegate;
@end

@protocol resDelegate <NSObject>

-(void)selectNormal:(NSInteger)num;

@end
