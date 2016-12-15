//
//  CommendViewController.m
//  LQYG
//
//  Created by issuser on 2016/10/28.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "CommendViewController.h"
#import "ShowImageViewController.h"
#import "ComMessageViewController.h"
@interface CommendViewController ()<DynamicTableViewCellDelegate>

@end

@implementation CommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _table = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
//    _table.rowHeight = UITableViewAutomaticDimension;
    _table.estimatedRowHeight = 44.0;
    [self.view addSubview:_table];
//    _table.backgroundColor = [UIColor clearColor];
    
    _kArr = @[@"手机号健身房双方都好风景都很费劲动画仿京东合肥京东方还记得发货大家好风景都很费劲的恢复的交换机",@"五代十国发神经的好时机地方电视剧和副驾驶的房间的书法家的复活节的书法家的书法家第三方还记得发货及第三方会九点十分还涉及到谁复活的时刻发挥的开发和代发货的发挥地方的发货的海景房",@"收到货就涉及到恢复和",@"是交换机反倒是福建省地方海事局的开发和电视剧更健康多少个交水电费和坚实的恢复圣诞节和房管局的树干上的经费和圣诞节光滑就是到工商局的分工会涉及到更合适的结构化束带结发坚实的粉红色的减肥哈就是的恢复圣诞节",@"说废话多思考和发动机更好地方看见过恢复的结构化的风景很高的疯狂就换个地方考合格的疯狂就更好的疯狂就更好的飞机客户给大家发广东话"];
    _imageArr = @[@"1.png",@"2.png",@"3.png",@"1.png",@"2.png"];
    
    // Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _kArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    DynamicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DynamicTableViewCell" owner:nil options:nil] objectAtIndex:0];
    }
    cell.NewCreateLabel.text = _kArr[indexPath.row];
    [cell setScrollViewPage:_imageArr];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.backgroundColor = [UIColor clearColor];
    cell.delegate = self;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return UITableViewAutomaticDimension;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ComMessageViewController *comMessageControl =[[ComMessageViewController alloc] init];
    [self.navigationController pushViewController:comMessageControl animated:YES];
}
-(void)showImage{
    NSLog(@"查看大图");
    ShowImageViewController *imageControl = [[ShowImageViewController alloc] init];
    imageControl.imageArr = _imageArr;
    [self.navigationController pushViewController:imageControl animated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
     
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
