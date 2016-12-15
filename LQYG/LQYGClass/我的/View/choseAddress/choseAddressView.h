//
//  choseAddressView.h
//  LQYG
//
//  Created by issuser on 2016/11/8.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyScrollView.h"
@interface choseAddressView : UIView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)UIToolbar *toolbar;
@property(nonatomic,strong)UIScrollView *scroll;
@property(nonatomic,strong)NSMutableArray *proArr;//省
@property(nonatomic,strong)NSMutableArray *cityArr;//市
@property(nonatomic,strong)NSMutableArray *countyArr;//县
@property(nonatomic,strong)NSDictionary *cityDic;//市名
@property(nonatomic,strong)NSDictionary *countyDic;//县名
@property(nonatomic,strong)NSMutableArray *tableArr;
@property(nonatomic,strong)NSArray *Jsonarr;
@end
