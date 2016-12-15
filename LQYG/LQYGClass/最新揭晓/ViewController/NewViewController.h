//
//  NewViewController.h
//  LQYG
//
//  Created by issuser on 2016/10/19.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCollectionViewCell.h"
@interface NewViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView *collectionView;
@end
