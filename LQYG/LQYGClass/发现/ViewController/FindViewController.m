//
//  FindViewController.m
//  LQYG
//
//  Created by issuser on 2016/10/19.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "FindViewController.h"

@interface FindViewController ()

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _table.tableFooterView = [[UIView alloc] init];
    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview:_table];
    _table.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getFindData];
        [_table.mj_header endRefreshing];
    }];
    [_table.mj_header beginRefreshing];

    // Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    FindTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FindTableViewCell" owner:nil options:nil] objectAtIndex:0];
    }
    NSDictionary *dic = _arr[indexPath.row];
    cell.FindNameLabel.text = _arr[indexPath.row][@"title"];
    cell.FindMessageLabel.text = _arr[indexPath.row][@"content"];
    [cell.FindImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://db.wanyige.com/%@",dic[@"src"]]] placeholder:nil];
    if (indexPath.row == 0) {
         cell.FindHotLabel.hidden = YES;
    }
    if ([dic[@"newicon"] isEqualToString:@"0"] && [dic[@"hoticon"] isEqualToString:@"0"]) {
        cell.FindHotLabel.hidden = YES;
    }
    else if ([dic[@"newicon"] isEqualToString:@"1"] && [dic[@"hoticon"] isEqualToString:@"0"]){
        cell.FindHotLabel.text = @"NEW";
        cell.FindHotLabel.backgroundColor = [UIColor colorWithRed:223 / 255.0 green:93 / 255.0 blue:38 / 255.0 alpha:1];
    }
    else{
        cell.FindHotLabel.text = @"HOT";
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WebViewController *webControl = [[WebViewController alloc] init];
    webControl.url = _arr[indexPath.row][@"url"];
    [self.navigationController pushViewController:webControl animated:YES];
}
-(void)getFindData{
    [httpController getRequestWithURL:@"http://db.3z.cc/index.php?tp=ios/find&sign=20eb50b9863de36600571a1a86e49b05&pt=2&ver=1.0.8&uid=3845648&imei=96F2AFD1-9B2B-4C95-BAAC-52733E3B3856&device_type=10.0.2&qyb=0&appid=14" block:^(id JSON, NSError *error) {
        if (!error) {
            _arr = JSON[@"data"];
        }
        else{
            NSLog(@"%@",error.description);
        }
        [_table reloadData];
    }];
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
