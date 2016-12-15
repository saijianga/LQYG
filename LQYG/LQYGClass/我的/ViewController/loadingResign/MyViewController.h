//
//  MyViewController.h
//  LQYG
//
//  Created by issuser on 2016/10/19.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCusView.h"
#import "MyTableViewCell.h"
#import "PersonViewController.h"
@interface MyViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)NSArray *arr;
@property(nonatomic,strong)UIRefreshControl *freshControl;//自带刷新视图控件  目前只支持下拉刷新
@end
