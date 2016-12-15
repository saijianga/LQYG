//
//  CommendViewController.h
//  LQYG
//
//  Created by issuser on 2016/10/28.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DynamicTableViewCell.h"
@interface CommendViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)NSArray *kArr;
@property(nonatomic,strong)NSArray *imageArr;
@end
