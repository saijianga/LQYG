//
//  OtherUserViewController.m
//  LQYG
//
//  Created by issuser on 2016/11/21.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "OtherUserViewController.h"

@interface OtherUserViewController ()

@end

@implementation OtherUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _selectAction = @"100";
    [self setUserPage];
    // Do any additional setup after loading the view.
}
-(void)setUserPage{
    _otherView = [otherUserView instanceView];
    _otherView.userHeaderImage.layer.masksToBounds = YES;
    _otherView.userHeaderImage.layer.cornerRadius = 30;
    _otherView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 100);
    [self.view addSubview:_otherView];
    
    _SecView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_otherView.frame), SCREEN_WIDTH, 50)];
    _SecView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    [self.view addSubview:_SecView];
    NSArray *nameArr = @[@"夺宝记录",@"幸运记录",@"晒单界面"];
    for (int i = 0; i < nameArr.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:nameArr[i] forState:UIControlStateNormal];
        button.frame = CGRectMake(((SCREEN_WIDTH - 6) / 3 + 3) *i, 10, (SCREEN_WIDTH - 6) / 3, 30);
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected ];
        button.tag = 100+i;
        [button addTarget:self action:@selector(userPageAction:) forControlEvents:UIControlEventTouchUpInside];
        [_SecView addSubview:button];
        
        if (i == 0) {
            [button setSelected:YES];
        }
        
        if (i < 2) {
            UILabel *Helabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(button.frame)+1, 5, 1, 40)];
            Helabel.backgroundColor = [UIColor blackColor];
            [_SecView addSubview:Helabel];
        }

        
    }
    UIButton *btn = (UIButton *)[self.view viewWithTag:100];
    _lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, (SCREEN_WIDTH - 6) / 3 - 2, 1)];
    _lineLabel.center = CGPointMake(btn.center.x, btn.center.y + 15 + 9);
    _lineLabel.backgroundColor = [UIColor orangeColor];
    [_SecView addSubview:_lineLabel];
    //列表
    _nameArr = @[@"sjhdsjhfjsdhfjsdhfjsd",@"书法家的书法家的书法家的书法家收到货赶紧搭讪",@"凤凰军事的核辐射的考核分开始的恢复到就换个时间段可发货的收发货速度快发货的思考和副驾驶的花果山的尽快发货时大局观和"];
    _getArr = @[@"获得者: hhe (本期共参与1000001人次)",@"获得者: 你wo猜猜我是谁啊 (本期共参与1000001人次)",@"获得者: 你猜猜加速度后福建省的恢复金黄色的 (本期共参与1000001人次)"];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_SecView.frame), SCREEN_WIDTH, SCREEN_HEIGHT - CGRectGetMaxY(_SecView.frame)) style:UITableViewStylePlain];
    _tableView.estimatedRowHeight = 44.0;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:_tableView];
}

-(void)userPageAction:(UIButton *)btn{
    NSLog(@"%@",btn.titleLabel.text);
    _selectAction = [NSString stringWithFormat:@"%ld",btn.tag];
    for (int i = 0; i < 3; i++) {
        UIButton *button = (UIButton *)[self.view viewWithTag:100+i];
        if (btn == button) {
            [btn setSelected:YES];
            
        }
        else{
            [button setSelected:NO];
        }
    }
    [UIView animateWithDuration:0.5 animations:^{
        _lineLabel.center = CGPointMake(btn.center.x, btn.center.y + 15 + 9);
    }];
    
    [_tableView reloadData];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_selectAction isEqualToString:@"100"]) {
        if (indexPath.row % 2 == 0) {
            return UITableViewAutomaticDimension;
        }
        else
            return 170.f;
    }
    else if ([_selectAction isEqualToString:@"101"]){
        return UITableViewAutomaticDimension;
    }
    else
        return 0;
    
    
    
   
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (![_selectAction isEqualToString:@"102"]) {
         return _nameArr.count;
    }
    else
        return 0;
    
    
   
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_selectAction isEqualToString:@"100"]) {
        if (indexPath.row % 2 == 0) {
            static NSString *cellID = @"cellID";
            DBJLOverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"DBJLOverTableViewCell" owner:nil options:nil] objectAtIndex:0];
            }
            cell.nameLabel.text = _nameArr[indexPath.row];
            cell.getLabel.attributedText = [self changeNsstring:_getArr[indexPath.row]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        else{
            static NSString *cellID = @"cell";
            DBJLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"DBJLTableViewCell" owner:nil options:nil] objectAtIndex:0];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }

    }
    else if ([_selectAction isEqualToString:@"101"]){
        static NSString *celID = @"cell";
        LuckTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:celID];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LuckTableViewCell" owner:nil options:nil] objectAtIndex:0];
        }
        if (indexPath.row == 0) {
            cell.LuckNameLabel.text = @"加速度后附近的说法的首付款的世界观是第三方的爽肤水的很干净地方的减肥的股份给";
            
        }
        else
           cell.LuckNameLabel.text = @"sjhdjshfjdshfjdshfjhdsfjhdsjfhsdj";
        cell.LuckQiLabel.text = @"期号: 34738754875";
        cell.LuckPeLabel.text = @"总需: 84835843758";
        cell.LuckNuLabel.text = @"幸运号码: 84835843758";
        cell.LuckCanLabel.text = @"本期参与: 3746人次";
        cell.LuckTimerLabel.text = @"揭晓时间: 2016-11-21 09:34:00.000";
       
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else{
        return nil;
    }
    
    
    
}

#pragma mark 设置label  attributed 的属性 这里在xib里已经设置了 但是却不起作用
-(NSMutableAttributedString *)changeNsstring:(NSString *)str{
    NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] initWithString:str];
    NSString *string = @" (本期共参与1000001人次)";
//    获得者: hhe (本期共参与1000001人次)
    //这里把参与人数写成固定的人数
    NSRange range = NSMakeRange(5, str.length - string.length - 4);
    [attributed addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];
    
    
    return attributed;
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
