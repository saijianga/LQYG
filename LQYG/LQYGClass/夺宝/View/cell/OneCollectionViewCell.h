//
//  OneCollectionViewCell.h
//  LQYG
//
//  Created by issuser on 2016/10/24.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FView.h"
@interface OneCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)UIScrollView *advertisementScr;
@property(nonatomic,strong)UIScrollView *prizeScr;
@property(nonatomic,strong)FView *announceView;
@property(nonatomic,strong)FView *recommendView;

@end
