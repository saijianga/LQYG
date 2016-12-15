//
//  detailedViewController.h
//  LQYG
//
//  Created by issuser on 2016/10/27.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellView.h"
#import "TCellView.h"
#import "detailsOneTableViewCell.h"
#import "appraiseTableViewCell.h"
#import "userView.h"
#import "CommendViewController.h"
#import "OtherUserViewController.h"
@interface detailedViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)CellView *OneHeaderView;
@property(nonatomic,strong)TCellView *twoHeaderView;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)NSArray *oneArr;
@property(nonatomic,strong)UIToolbar *toolbar;
@end
