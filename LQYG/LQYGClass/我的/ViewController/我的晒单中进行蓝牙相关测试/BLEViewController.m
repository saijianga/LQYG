//
//  BLEViewController.m
//  LQYG
//
//  Created by issuser on 2016/11/25.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "BLEViewController.h"

@interface BLEViewController ()

@end

@implementation BLEViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setSearchBlueItem];
    //列表
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
  //  [self.view addSubview:_table];
    // Do any additional setup after loading the view.
}
#pragma mark 在navr 上设置一个搜索按键
-(void)setSearchBlueItem{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"搜索周边设备" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 100, 30);
    [button addTarget:self action:@selector(searchBlueAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = item;
    
}
#pragma mark 判断蓝牙是否打开代理方法
-(void)centralManagerDidUpdateState:(CBCentralManager *)central{
    NSString *message = nil;
    switch (central.state) {
        case 1:
         message = @"该设备不支持蓝牙功能,请检查系统设置";
            break;
        case 2:
            message = @"该设备蓝牙未授权,请检查系统设置";
            break;
        case 3:
            message = @"该设备蓝牙未授权,请检查系统设置";
            break;
        case 4:
            message = @"该设备尚未打开蓝牙,请在设置中打开";
            break;
        case 5:
            message = @"蓝牙已打开";
            break;
        default:
            break;
    }
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"信息"
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"查看"style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       //搜索蓝牙
        [self searchAroundLbe];
    }];
    
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消"style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    [alertController addAction:confirmAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
    

}
#pragma mark 按钮事件
-(void)searchBlueAction{
#warning 判断蓝牙是否打开
    _cm = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    
    
    
    
    /*
     //暂且屏蔽 三方蓝牙库
    __weak typeof (self) weakSelf = self;
    _centralManager = [[MPCentralManager alloc] initWithQueue:nil];
    [_centralManager setUpdateStateBlock:^(MPCentralManager * centralManager){
        if (centralManager.state == CBCentralManagerStatePoweredOn) {
            [weakSelf scanPeripehrals];
        }
        else{
            [weakSelf.table reloadData];
            NSLog(@"没有");
        }
    }];
    
    */
}
#pragma mark 搜索蓝牙
-(void)searchAroundLbe{
    __weak typeof (self) weakSelf = self;
    _centralManager = [[MPCentralManager alloc] initWithQueue:nil];
    [_centralManager setUpdateStateBlock:^(MPCentralManager * centralManager){
        if (centralManager.state == CBCentralManagerStatePoweredOn) {
            [weakSelf scanPeripehrals];
        }
        else{
            [weakSelf.table reloadData];
            NSLog(@"没有");
        }
    }];
}
- (void)scanPeripehrals
{
    if(_centralManager.state == CBCentralManagerStatePoweredOn){
        [_centralManager scanForPeripheralsWithServices:nil options:nil withBlock:^(MPCentralManager *centralManager, MPPeripheral *peripheral, NSDictionary *advertisementData, NSNumber *RSSI) {
            NSLog(@"信息");
          [_table reloadData];
        }];
    }
}

- (void)connectPeripheral:(MPPeripheral *)peripheral
{
    [_centralManager connectPeripheral:peripheral options:nil withSuccessBlock:^(MPCentralManager *centralManager, MPPeripheral *peripheral) {
        LinkBleViewController *controller = [[LinkBleViewController alloc] init];
        controller.peripheral = peripheral;
        [self.navigationController pushViewController:controller animated:YES];
    } withDisConnectBlock:^(MPCentralManager *centralManager, MPPeripheral *peripheral, NSError *error) {
        NSLog(@"disconnectd %@",peripheral.name);
    }];
}
#pragma mark tableview delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_centralManager.discoveredPeripherals count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    MPPeripheral *peripheral = [_centralManager.discoveredPeripherals objectAtIndex:indexPath.row];
    cell.textLabel.text = peripheral.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",[peripheral.RSSI integerValue]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MPPeripheral *peripheral = [_centralManager.discoveredPeripherals objectAtIndex:indexPath.row];
    [self connectPeripheral:peripheral];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
