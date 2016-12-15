//
//  BLEViewController.h
//  LQYG
//
//  Created by issuser on 2016/11/25.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPBluetoothKit.h"
#import <CoreBluetooth/CoreBluetooth.h>
#import "LinkBleViewController.h"
@interface BLEViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,CBCentralManagerDelegate>
@property(nonatomic,strong) MPCentralManager *centralManager;
@property(nonatomic,strong)CBCentralManager *cm;
@property(nonatomic,strong) UITableView *table;
@end
