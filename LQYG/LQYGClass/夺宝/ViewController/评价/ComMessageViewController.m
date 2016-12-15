//
//  ComMessageViewController.m
//  LQYG
//
//  Created by issuser on 2016/11/16.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "ComMessageViewController.h"
#import "NameTableViewCell.h"
#import "MesTableViewCell.h"
#import "ImageTableViewCell.h"
#import "CommentTableViewCell.h"

@interface ComMessageViewController ()

@end

@implementation ComMessageViewController
-(void)dealloc{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [center removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-40) style:UITableViewStyleGrouped];
    _table.estimatedRowHeight = 44.0;
    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview:_table];
    _writeView = [writeView intanceWriteView];
    _writeView.frame = CGRectMake(0, CGRectGetMaxY(_table.frame), SCREEN_WIDTH, 40);
    _writeView.writeTextFiled.delegate = self;
    _writeView.writeTextFiled.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_writeView];
    [self monKeyBoard];
    // Do any additional setup after loading the view.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 44;
        }
        else{
            return UITableViewAutomaticDimension;
        }
    }
    else{
        return UITableViewAutomaticDimension;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            static NSString *name = @"name";
            NameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:name];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"NameTableViewCell" owner:nil options:nil] firstObject];
            }
            cell.headerImageView.image = [UIImage imageNamed:@"2.png"];
            cell.nameLabel.text = @"shdg";
            cell.rankImageView.image = [UIImage imageNamed:@"1.png"];
            cell.timerLabel.text = @"2016-11-09 09:32";
            return cell;
        }
        else{
            static NSString *mes = @"mes";
            MesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mes];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"MesTableViewCell" owner:nil options:nil] firstObject];
            }
            cell.mesLabel.text = @"手机号绝对是附近开始的恢复加速度后福建省的核辐射的积分换时间段和方式的见好就收大会上的金凤凰是的减肥哈就是的复活节是东方红";
            return cell;
            
        }
    }
    if (indexPath.section == 1) {
        static NSString *imag = @"imag";
        ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:imag];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ImageTableViewCell" owner:nil options:nil] firstObject];
        }
        if (indexPath.row == 0) {
            cell.shopImageView.image = [UIImage imageNamed:@"1.png"];
        }
        else
        cell.shopImageView.image = [UIImage imageNamed:@"goods2.png"];
        
        return cell;
    }
    else{
        static NSString *mark = @"mark";
        CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mark];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"CommentTableViewCell" owner:nil options:nil] firstObject];
        }
        cell.heImageView.image = [UIImage imageNamed:@"2.png"];
        cell.nLabel.text = @"shdsdhg";
        cell.markImageView.image = [UIImage imageNamed:@"1.png"];
        cell.TiLabel.text = @"刚刚";
        cell.MeLabel.text = @"jshjdshfjd宿舍黑手规范化的股份的会更好的的辅导班v时间段是极好的健身房涉及到恢复对方的牛逼女方家动画仿京东恢复";
        
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.001;
    }
    else{
        return 10.0f;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001f;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        [_writeView.writeTextFiled becomeFirstResponder];
        _writeView.writeTextFiled.placeholder = @"对 xxx说";
    }
}
#pragma mark 设置键盘弹出 隐藏 
-(void)monKeyBoard{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(keboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [center addObserver:self selector:@selector(keyBoardWillMiss:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)keboardWillShow:(NSNotification *)notif{
   
    NSDictionary *dic = notif.userInfo;
    //键盘弹出时间
    CGFloat duration = [[dic objectForKey:@"UIKeyboardAnimationDurationUserInfoKey"] floatValue];
    //键盘高度
    NSValue *keyValue = [dic objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyrect = [keyValue CGRectValue];
    CGFloat heigh = keyrect.size.height;
    
    [UIView animateWithDuration:duration animations:^{
        _writeView.frame = CGRectMake(0, SCREEN_HEIGHT - heigh - 40, SCREEN_WIDTH, 40);
    }];
   
    
}
-(void)keyBoardWillMiss:(NSNotification *)notif{
    NSDictionary *dic = notif.userInfo;
    CGFloat duration = [[dic objectForKey:@"UIKeyboardAnimationDurationUserInfoKey"] floatValue];
    _writeView.writeTextFiled.text = @"";
    _writeView.writeTextFiled.placeholder = @"说点什么呗~";
    [UIView animateWithDuration:duration animations:^{
        _writeView.frame = CGRectMake(0, CGRectGetMaxY(_table.frame), SCREEN_WIDTH, 40);
    }];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
//    NSLog(@"点击完成");
    [textField resignFirstResponder];
    return YES;
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
