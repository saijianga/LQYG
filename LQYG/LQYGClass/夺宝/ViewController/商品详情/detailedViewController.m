//
//  detailedViewController.m
//  LQYG
//
//  Created by issuser on 2016/10/27.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "detailedViewController.h"

@interface detailedViewController ()

@end

@implementation detailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[UIDevice currentDevice].systemVersion floatValue]>=7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    _dataArr = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3", nil];
    _oneArr = @[@"图文详情",@"往期揭晓",@"晒单分享",@"荣誉榜"];
    [self createTable];
    [self pullGetMoreData];
    //
    _toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_table.frame), SCREEN_WIDTH, 60)];
    [_toolbar setBarStyle:UIBarStyleBlackOpaque];
    [self.view addSubview:_toolbar];
    
    //
    NSArray *arr = @[@"立即购买",@"加入清单",@"购物车"];
    for (int i=0; i<3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(SCREEN_WIDTH / 3 * i, 0, SCREEN_WIDTH / 3, 60);
        if (i == 0) {
            button.backgroundColor = [UIColor blueColor];
        }
        else if (i == 1){
            button.backgroundColor = [UIColor orangeColor];
        }
        button.tag = 30+i;
        [button addTarget:self action:@selector(buttonAction1:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:arr[i] forState:UIControlStateNormal];
        [_toolbar addSubview:button];
    }
    
    //接收点击用户姓名的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkUserMessage:) name:@"userMessage" object:nil];
    // Do any additional setup after loading the view.
}
#pragma mark 通知
-(void)checkUserMessage:(NSNotification *)notifi{
    NSDictionary *dic = notifi.userInfo;
    NSLog(@"查看通知信息%@",dic);
    OtherUserViewController *otherControl = [[OtherUserViewController alloc] init];
    [self.navigationController pushViewController:otherControl animated:YES];
}
-(void)buttonAction1:(UIButton *)btn{
    
    if (btn.tag == 30) {
        
    }
    else if (btn.tag == 31){
        [[SwitchController sharedSVC] showMessage:@"添加购物车成功" inView:self.view];
    }
    else{
        
    }
}
#pragma mark tableView
-(void)createTable{
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 60 - 64 ) style:UITableViewStyleGrouped];
    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview:_table];
    NSArray *imageArray = @[@"goods1",@"goods2",@"goods3"];
    
    _OneHeaderView = [CellView instanceView];
    _OneHeaderView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 350);
    _twoHeaderView = [TCellView instanceTCellView];
    _twoHeaderView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 170);
    _OneHeaderView.GScrollView.contentSize = CGSizeMake(SCREEN_WIDTH *3,  150);
    _OneHeaderView.GScrollView.pagingEnabled = YES;
    for (int i=0; i<imageArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH *i, 0, SCREEN_WIDTH, 150)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageArray[i]]];
        [_OneHeaderView.GScrollView addSubview:imageView];
    }
    
    for (int i =0; i < 3; i++) {
        userView *uerView = [userView instanceView];
        uerView.frame = CGRectMake(SCREEN_WIDTH / 3 * i, 0, SCREEN_WIDTH / 3, 140);
        [_twoHeaderView addSubview:uerView];
    }
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 4;
    }
    else
    return _dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        static NSString *cellID = @"cellID";
        
        
        detailsOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [detailsOneTableViewCell xibTableCell];
        }
        
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.OneImageView.image = [UIImage imageNamed:@"2"];
        cell.DeLabel.text = _oneArr[indexPath.row];
        if (indexPath.row !=0) {
             cell.SLabel.text = @"";
        }
       
        return cell;
    }
    else if (indexPath.section == 1){
        static NSString *cellID = @"cellID1";
        
        
       
            appraiseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if (!cell) {
                cell = [appraiseTableViewCell instanceAppraiseCell];
            }
        
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
      
       
        return cell;
    }
    else
        return nil;
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 60;
    }
    else
        return 60;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 350;
    }
    else
        return 170;
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return _OneHeaderView;
    }
    else
        return _twoHeaderView;
    
}
-(void)pullGetMoreData{
    _table.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        for (int i=0; i<=3; i++) {
            [_dataArr addObject:@"5"];
        }
        [_table reloadData];
        [_table.mj_footer endRefreshing];
    }];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.tabBarController.tabBar.hidden = YES;
    CommendViewController *comControl = [[CommendViewController alloc] init];
    [self.navigationController pushViewController:comControl animated:YES];
}
-(void)viewWillDisappear:(BOOL)animated{
   // self.tabBarController.tabBar.hidden = NO;
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
