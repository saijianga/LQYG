//
//  choseAddressView.m
//  LQYG
//
//  Created by issuser on 2016/11/8.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "choseAddressView.h"
#import "ChooseTableViewCell.h"
#import "AddressAttem.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGH [UIScreen mainScreen].bounds.size.height

@implementation choseAddressView
-(NSMutableArray *)tableArr{
    if (_tableArr == nil) {
        _tableArr = [NSMutableArray array];
    }
    return _tableArr;
}
-(instancetype)init{
    if (self = [super init]) {
        _tableArr = [[NSMutableArray alloc] init];
//        _proArr = @[@"北京",@"上海",@"河南",@"河北",@"湖南",@"湖北",@"安徽",@"四川",@"江苏",@"浙江",@"广州",@"云南"];
//        _cityDic = @{@"北京":@[@"密云",@"海淀",@"朝阳",@"大兴",@"西城",@"东城",@"顺义",@"通州",@"昌平"],@"上海":@[],@"河南":@[],@"湖南":@[],@"河北":@[],@"安徽":@[],@"湖北":@[],@"四川":@[],@"江苏":@[],@"浙江":@[],@"广州":@[],@"云南":@[]};
//        _countyDic = @{@"密云":@[@"城区",@"城区以外"],@"海淀":@[@"三环以内",@"三环到四环之间",@"四环到五环之间",@"五环到六环之间",@"六环以外",@"西二旗",@"西三旗"],@"朝阳":@[@"三环以内",@"三环到四环之间",@"四环到五环之间",@"五环到六环之间",@"管庄",@"北苑"],@"大兴":@[@"三环以内",@"三环到四环之间",@"四环到五环之间",@"五环到六环之间",@"亦庄经济开发区"],@"西城":@[@"内环到二环里",@"二环到三环"],@"东城":@[@"内环到三环里"],@"顺义":@[@"北石槽镇",@"北务镇",@"北小营镇"],@"通州":@[@"中仓街道",@"新华街道",@"玉桥街道",@"北苑街道"],@"昌平":@[@"六环以外",@"城区",@"城区以外"]};
        [self getJsonAddress];
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        [[[UIApplication sharedApplication] keyWindow] addSubview:self];
        _toolbar = [[UIToolbar alloc] init];
        _toolbar.frame = CGRectMake(0, HEIGH - 250, WIDTH, 50);
        [_toolbar setBarStyle:UIBarStyleBlackTranslucent];//
        _toolbar.backgroundColor = [UIColor whiteColor];
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        lable.text = @"所在地";
        lable.textAlignment = NSTextAlignmentCenter;
        lable.font = [UIFont systemFontOfSize:12];
        lable.textColor = [UIColor whiteColor];
        lable.center = CGPointMake(_toolbar.frame.size.width / 2, 10);
        [_toolbar addSubview:lable];
        
        _scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_toolbar.frame), WIDTH, 200)];
        _scroll.backgroundColor = [UIColor whiteColor];
        _scroll.pagingEnabled = YES;
        _scroll.bounces = NO;
        _scroll.showsVerticalScrollIndicator = NO;
        _scroll.showsHorizontalScrollIndicator = NO;
        [self addSubview:_scroll];
        
        [self addTableView];
        [self addSubview:_toolbar];
        
        
    }
    return self;
}
-(void)addTableView{
     NSLog(@"个数的%ld",_tableArr.count);
    _table = [[UITableView alloc] initWithFrame:CGRectMake(WIDTH * _tableArr.count, 0, WIDTH, 200) style:UITableViewStylePlain];
   
    [_tableArr addObject:_table];
    _table.delegate = self;
    _table.dataSource = self;
    
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftAction:)];
    [leftSwipe setDirection:UISwipeGestureRecognizerDirectionLeft];
    [leftSwipe setNumberOfTouchesRequired:1];
    
    [_table addGestureRecognizer:leftSwipe];
    
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_table registerNib:[UINib nibWithNibName:@"ChooseTableViewCell" bundle:nil] forCellReuseIdentifier:@"ChooseTableViewCell"];
    [_scroll addSubview:_table];
}
#pragma mark 手势问题
-(void)leftAction:(UISwipeGestureRecognizer *)swipe{
    NSLog(@"左划");
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30.f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ChooseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChooseTableViewCell"];
    if (!cell) {
        cell = [[ChooseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ChooseTableViewCell"];
    }
    if ([_tableArr indexOfObject:_table] == 0) {
        cell.cityNameLabel.text = _proArr[indexPath.row];
    }
    else if ([_tableArr indexOfObject:_table] == 1){
        cell.cityNameLabel.text = _cityArr[indexPath.row];
       
    }
    else if ([_tableArr indexOfObject:_table] == 2){
         cell.cityNameLabel.text = _countyArr[indexPath.row];
      
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([_tableArr indexOfObject:_table] == 0) {
        return _proArr.count;
    }
    else if ([_tableArr indexOfObject:_table] == 1){
        return _cityArr.count;
    }
    else if ([_tableArr indexOfObject:_table] == 2){
        return _countyArr.count;
    }
    return _proArr.count;
}
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"将要");
    //1.1 判断是否是第一次选择,不是,则重新选择省,切换省.
    NSIndexPath * indexPath0 = [_table indexPathForSelectedRow];
    
    if ([indexPath0 compare:indexPath] != NSOrderedSame && indexPath0) {
        NSLog(@"第一次");
    }
    else
        NSLog(@"第二次");
    return indexPath;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了");
    UITableViewCell *cell = [_table cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor redColor];

    
     [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
//调整scrollview的宽度
     [self addTableView];
    _scroll.contentSize = CGSizeMake(WIDTH*_tableArr.count, 200);
    [_scroll setContentOffset:CGPointMake(WIDTH, 0) animated:YES];
    NSLog(@"%@",[NSString stringWithFormat:@"省市选择--%@",_proArr[indexPath.row]]);
 
    if ([_tableArr indexOfObject:_table] == 1) {
        if (_cityArr == nil) {
            _cityArr = [[NSMutableArray alloc] init];
        }
        else
        [_cityArr removeAllObjects];
       
        NSString *proStr = [NSString stringWithFormat:@"%@",_proArr[indexPath.row]];
        for (NSDictionary *dic in _Jsonarr) {
            NSArray *arr = dic[proStr];
            if (arr.count > 0) {
                for (NSDictionary *sdic in arr) {
                    NSArray *ssarr = [sdic allKeys];
                    for (NSString *cityStr in ssarr) {
                        [_cityArr addObject:cityStr];
                    }
                }
           
            }
            
        }
        NSLog(@"%@",[NSString stringWithFormat:@"市级选择--%@",_cityArr[indexPath.row]]);
    
    }

}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"完成");
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == _scroll) {
        NSLog(@"滚动");
    }
    else
        NSLog(@"列表");
}

#pragma mark json数据解析
-(void)getJsonAddress{
    
    if (_proArr == nil) {
        _proArr = [[NSMutableArray alloc] init];
    }
    else
        [_proArr removeAllObjects];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"address" ofType:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
    _Jsonarr = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
   
    for (NSDictionary *dic in _Jsonarr) {
        NSArray *arr = [dic allKeys];
        for (NSString *str in arr) {
            [_proArr addObject:str];
        }
    }
    NSLog(@"数据%@",_proArr);
    [_table reloadData];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
