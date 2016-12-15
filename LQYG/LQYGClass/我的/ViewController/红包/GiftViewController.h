//
//  GiftViewController.h
//  LQYG
//
//  Created by issuser on 2016/11/17.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "footerView.h"
@interface GiftViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UILabel *lineLabel;
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)footerView *footerView;
@end
