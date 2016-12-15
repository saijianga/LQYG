//
//  LinkBleViewController.h
//  LQYG
//
//  Created by issuser on 2016/11/25.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPBluetoothKit.h"
@interface LinkBleViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) MPPeripheral *peripheral;
@property(nonatomic,strong) UITableView *table;
@end
