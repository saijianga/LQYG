//
//  OtherUserViewController.h
//  LQYG
//
//  Created by issuser on 2016/11/21.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "otherUserView.h"
#import "DBJLTableViewCell.h"
#import "DBJLOverTableViewCell.h"
#import "LuckTableViewCell.h"
@interface OtherUserViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)otherUserView *otherView;
@property(nonatomic,strong)UILabel *lineLabel;
@property(nonatomic,strong)UIView *SecView;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *nameArr;
@property(nonatomic,strong)NSArray *getArr;
@property(nonatomic,strong)NSString *selectAction;
@end
