//
//  LinkBleViewController.m
//  LQYG
//
//  Created by issuser on 2016/11/25.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "LinkBleViewController.h"

@interface LinkBleViewController ()

@end

@implementation LinkBleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview:_table];
    
    [self discoverServices];
    
    // Do any additional setup after loading the view.
}

-(void)discoverServices{
    __weak typeof(self) weakSelf = self;
    [_peripheral discoverServices:nil withBlock:^(MPPeripheral *peripheral, NSError *error) {
        for (MPService *service in peripheral.services) {
            [weakSelf discoverCharacteristicForService:service];
        }
    }];
}
-(void)discoverCharacteristicForService:(MPService *)service{
    __weak typeof(self) weakSelf = self;
    [service discoverCharacteristics:nil withBlock:^(MPPeripheral *peripheral, MPService *service, NSError *error) {
        [weakSelf.table reloadData];
    }];
    
}
#pragma mark - UITableViewDelegate UITableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  [_peripheral.services count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    MPService *service = [_peripheral.services objectAtIndex:section];
    return [service.characteristics count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kCharacteristicCell" forIndexPath:indexPath];
    
    MPService *service = [_peripheral.services objectAtIndex:indexPath.section];
    MPCharacteristic *charactristic = [service.characteristics objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Charactristic UUID:%@",[charactristic.UUID UUIDString]];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"kServiceCell"];
    if(!headerView){
        headerView = [[UITableViewHeaderFooterView alloc] init];
    }
    
    MPService *service = [_peripheral.services objectAtIndex:section];
    headerView.textLabel.text = [NSString stringWithFormat:@"Service UUID:%@",[service.UUID UUIDString]];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0001f;
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
