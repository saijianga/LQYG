//
//  GiftViewController.m
//  LQYG
//
//  Created by issuser on 2016/11/17.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "GiftViewController.h"
#import "GiftTableViewCell.h"
@interface GiftViewController ()

@end

@implementation GiftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[UIDevice currentDevice].systemVersion floatValue]>=7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *arr = @[@"可以使用",@"已用完/已过期"];
    for (int i =0; i < arr.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(((SCREEN_WIDTH-3) / 2 + 3)*i , 0, (SCREEN_WIDTH-3) / 2, 30);
        [button setTitle:arr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:255 / 255.0 green:190 / 255.0 blue:47 / 255.0 alpha:1] forState:UIControlStateSelected];
        button.tag = i+100;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        if (i == 0) {
            [button setSelected:YES];
        }
    }
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1, 15)];
    label.center = CGPointMake(SCREEN_WIDTH / 2, 15);
    label.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    [self.view addSubview:label];
    
    
    UIButton *btn = (UIButton *)[self.view viewWithTag:100];
 
    _lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 1)];
    _lineLabel.center = CGPointMake(btn.center.x, btn.center.y + 20);
    _lineLabel.backgroundColor = [[UIColor  colorWithRed:255 / 255.0 green:190 / 255.0 blue:47 / 255.0 alpha:1] colorWithAlphaComponent:0.8];
    [self.view addSubview:_lineLabel];
    
    UILabel *dlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_lineLabel.frame)+5, SCREEN_WIDTH, 1)];
   
    dlabel.backgroundColor = [UIColor colorWithRed:233 / 255.0 green:233 / 255.0 blue:233 / 255.0 alpha:1];
    [self.view addSubview:dlabel];
    
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(dlabel.frame), SCREEN_WIDTH, SCREEN_HEIGHT - CGRectGetMaxY(dlabel.frame)) style:UITableViewStyleGrouped];
    _table.dataSource = self;
    _table.delegate = self;
    [self.view addSubview:_table];
    
    _footerView = [footerView inatanceView];
    _footerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 120);
    //返回夺宝界面
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backGetController) name:@"getshop" object:nil];
    // Do any additional setup after loading the view.
}
#pragma mark tabledelegate 
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;//这里要查看是否有红包 这里主要是没有红包
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _table.frame.size.height - 120  - 64;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    GiftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GiftTableViewCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    _footerView.footerScrollView.backgroundColor = [UIColor redColor];
    return _footerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 120.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001f;
}
#pragma mark 红包事件
-(void)buttonAction:(UIButton *)button{
    [button setSelected:YES];
    _lineLabel.center = CGPointMake(button.center.x, button.center.y + 20);
    for (int i=100; i < 102; i++) {
        UIButton *btn = (UIButton *)[self.view viewWithTag:i];
        if (btn != button) {
           
            [btn setSelected:NO];
        }
        
    }
}
#pragma mark 通知
-(void)backGetController{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
