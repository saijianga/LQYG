//
//  ListViewController.m
//  LQYG
//
//  Created by issuser on 2016/10/19.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "ListViewController.h"
#import "ListTableViewCell.h"
#import "addAndSubtractView.h"
#import "listView.h"

@interface ListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)listView *list;
@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.navigationController.tabBarItem setBadgeValue:[NSString stringWithFormat:@"%@",@"1"]];
    
  
    
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 40) style:UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    
     [_table registerNib:[UINib nibWithNibName:@"ListTableViewCell" bundle:nil] forCellReuseIdentifier:@"ListTableViewCell"];
    [self.view addSubview:_table];
    
    _list = [listView instanceView];
    _list.frame = CGRectMake(0, SCREEN_HEIGHT -80, SCREEN_WIDTH, 40);
    _list.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_list];
    
    _keyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    _keyView.backgroundColor = [UIColor colorWithRed:239 / 255.0 green:239 / 255.0 blue:239 / 255.0 alpha:1];
    NSArray *btnArr = @[@"取消",@"完成"];
    for (int i =0; i < 2; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        if (i == 0) {
             btn.frame = CGRectMake(5, 5, 40, 20);
            [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        }
        else{
        btn.frame = CGRectMake(_keyView.frame.size.width - 45, 5, 40, 20);
        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        }
        btn.tag = i;
        [btn addTarget:self action:@selector(keyBoardAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [btn setTitle:btnArr[i] forState:UIControlStateNormal];
        [_keyView addSubview:btn];
    }
    
    // Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.subView.numberTextFiled.inputAccessoryView = _keyView;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 95;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 隐藏键盘
-(void)keyBoardAction:(UIButton *)button{
    [self.view endEditing:YES];
    if (button.tag == 0) {
        
    }
    else{
        
    }
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
