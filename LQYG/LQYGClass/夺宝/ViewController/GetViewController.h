//
//  GetViewController.h
//  LQYG
//
//  Created by issuser on 2016/10/19.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LQCollectionViewFlowLayout.h"
#import "LQHeaderView.h"
#import "detailedViewController.h"
@interface GetViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UIImageView *productView;
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *moodsArr;//上新数据源
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,assign)NSInteger page1;
@property(nonatomic,assign)NSInteger page2;
@property(nonatomic,strong)LQHeaderView *LQView;
@property(nonatomic,strong)NSArray *imageUrl;
@property(nonatomic,strong)NSArray *priceArr;
@property(nonatomic,strong)NSArray *lastArr;
@property(nonatomic,strong)NSArray *upArr;
@property(nonatomic,strong)NSString *st1;
@property(nonatomic,strong)NSString *st2;
@property(nonatomic,strong)NSString *st3;
@property(nonatomic,strong)NSString *st4;
@property(nonatomic,strong)NSString *scrFlag;
@end
