//
//  GetViewController.m
//  LQYG
//
//  Created by issuser on 2016/10/19.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "GetViewController.h"
#import "CollectionViewCell.h"
#import "moodsCollectModel.h"
#import "MyCollectionReusableView.h"
#import "WebViewController.h"
#import "BaiDuViewController.h"//百度
#import "GoDeMapViewController.h"//高德

#import "AdverViewController.h"
@interface GetViewController ()<CollectionAddListDelegate,resDelegate,TSAnimationDelegate>

@end
static NSString *headerView = @"headerView";
@implementation GetViewController

- (UIImageView *)productView {
    if (!_productView) {
        _productView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _productView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _productView;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //通知不能使用 不知道为什么 在这里使用了本地存储
    NSUserDefaults *defaults = [[NSUserDefaults alloc] init];
    NSString *str = [defaults objectForKey:@"one"];
    if ([str isEqualToString:@"one"]) {
        [defaults removeObjectForKey:@"one"];
        AdverViewController *control = [[AdverViewController alloc] init];
        [self.navigationController pushViewController:control animated:YES];
    }

    
    
    
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:255/255.0 green:197/255.0 blue:2/255.0 alpha:1]];
    self.tabBarController.tabBar.hidden = NO;
    

}
-(void)goAdverPage{
    NSLog(@"测试数据信息");
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    _imageUrl = @[@"1.jpg",@"2.jpg",@"3.jpg"];
    _moodsArr = [[NSMutableArray alloc] init];
    _page = 1;
    _page1 = 1;
    _page2 = 1;
    _st1 = @"1";
    [self setNavr];
    _LQView = [[LQHeaderView alloc] initWithFrame:CGRectMake(0, -411, SCREEN_WIDTH, 411)];

    LQCollectionViewFlowLayout *layout = [[LQCollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate=self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    [_collectionView addSubview:_LQView];
  
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"shopeCell"];
  
    [_collectionView registerClass:[MyCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerView];
    
    
    _collectionView.contentInset = UIEdgeInsetsMake(411, 0, 0, 0);
   
    
   _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//
       [self freshAdvancePage];
       [self getNewData];
       [self getNewThings];
       [self getPrizePerson];
       if ([_st1 isEqualToString:@"1"]) {
           [self getGetData];
       }
       else if ([_st2 isEqualToString:@"1"]){
           [self getLastData];
       }
       else if ([_st3 isEqualToString:@"1"]){
           [self getProgressData];
       }
       else{
           
       }
       [self.collectionView.mj_header endRefreshing];
       
   }];
    _collectionView.mj_header.ignoredScrollViewContentInsetTop = 411;/** 忽略多少scrollView的contentInset的top */
    [self.collectionView.mj_header beginRefreshing];
    
    [self pullGetData];
    // Do any additional setup after loading the view.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
   
    return _moodsArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
   
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"shopeCell" forIndexPath:indexPath];
    cell.delegate = self;
    moodsCollectModel *item = _moodsArr[indexPath.row];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",item.imageUrl]] placeholderImage:[UIImage imageNamed:@""]];
    cell.nameLabel.text = [NSString stringWithFormat:@"%@",item.nameStr];
    cell.numberLabel.text = [NSString stringWithFormat:@"%d%@",(int)([item.join_num floatValue] / [item.need_num floatValue]*100),@"%"];
    cell.progress.progress =[item.join_num floatValue] / [item.need_num floatValue];


        return cell;
   
    
    
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((SCREEN_WIDTH - 10)/2, (SCREEN_WIDTH - 10)/2+40);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5.f;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5.f;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
   
        MyCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerView forIndexPath:indexPath];
    header.delegate = self;
        return header;
   
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
   
         return CGSizeMake(SCREEN_WIDTH, _moodsArr.count > 0 ? 40:0);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
//    WebViewController *webControl = [[WebViewController alloc] init];
//    [self.navigationController pushViewController:webControl animated:YES];
    self.tabBarController.tabBar.hidden = YES;
    //这里在搜索按钮中测试
    detailedViewController *deController = [[detailedViewController alloc] init];
#warning 添加页面跳转的动画效果
    /*
     　Fade = 1,                   //淡入淡出
     Push,                       //推挤
     Reveal,                     //揭开
     MoveIn,                     //覆盖
     Cube,                       //立方体
     SuckEffect,                 //吮吸
     OglFlip,                    //翻转
     RippleEffect,               //波纹
     PageCurl,                   //翻页
     PageUnCurl,                 //反翻页
     CameraIrisHollowOpen,       //开镜头
     CameraIrisHollowClose,      //关镜头
     CurlDown,                   //下翻页
     CurlUp,                     //上翻页
     FlipFromLeft,               //左翻转
     */
    //创建动画
    CATransition *animation = [CATransition animation];
    //设置运动轨迹的速度
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    //设置动画类型为立方体动画
    animation.type = @"FlipFromLeft";
    //设置动画时长
    animation.duration =0.5f;
    //设置运动的方向
    animation.subtype =kCATransitionFromRight;
    //控制器间跳转动画
    [[UIApplication sharedApplication].keyWindow.layer addAnimation:animation forKey:nil];
    
    
    [self.navigationController pushViewController:deController animated:YES];
    
    
}

#pragma mark 加入清单代理
-(void)addShoppingList:(CollectionViewCell *)cell{

    if ([TSAnimation sharedAnimation].isShowing) {
        return;
    }
    CGRect lisRect = self.tabBarController.tabBar.frame;
    lisRect.origin.x = 3*SCREEN_WIDTH / 5 + SCREEN_WIDTH / 5 / 2;
    lisRect.size.width = SCREEN_WIDTH / 5.0;

    CGRect parentRectA = [cell.contentView convertRect:cell.imageView.frame toView:self.tabBarController.view];
    CGRect parentRectB = [self.view convertRect:lisRect toView:self.tabBarController.view];
    [self.tabBarController.view addSubview:self.productView];
    self.productView.frame = parentRectA;
    self.productView.image = cell.imageView.image;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(self.productView.center.x, self.productView.center.y)];
    [path addQuadCurveToPoint:CGPointMake(parentRectB.origin.x, parentRectB.origin.y) controlPoint:CGPointMake(self.productView.center.x+30, self.productView.center.y+20)];
    [TSAnimation sharedAnimation].delegate = self;
    [[TSAnimation sharedAnimation] throwTheView:self.productView path:path isRotated:YES endScale:0.1];
    
    
    
}
#pragma mark TSAnimation 结束代理
-(void)animationFinished{
    NSLog(@"结束动画");
    // [self setBadgeValue:3 atIndex:3];
    [self.tabBarController.tabBar setBadgeValue:2 AtIndex:2];

}
- (void)setBadgeValue:(NSInteger)value atIndex:(NSInteger)index {
   // [self.tabBarController.tabBar setBadgeValue:value AtIndex:index];
}
#pragma mark 添加购物车  这里需要获取购物车内的商品数据
-(void)addCartNum:(NSString *)strId{
    [httpController getRequestWithURL:[NSString stringWithFormat:@"http://db.3z.cc/index.php?tp=front/index&op=addcar&act_id=%@&sign=20eb50b9863de36600571a1a86e49b05&pt=2&ver=1.0.8&uid=3845648&imei=96F2AFD1-9B2B-4C95-BAAC-52733E3B3856&device_type=10.0.2&qyb=0&appid=14",strId] block:^(id JSON, NSError *error) {
        if (!error) {
            NSLog(@"%@",JSON);
        }
        else{
            NSLog(@"%@",error.description);
        }
    }];
}

#pragma mark 数据解析
-(void)getGetData{
    _page = 1;
    [httpController getRequestWithURL:@"http://db.3z.cc/index.php?tp=ios/index&op=hot&page=1&sign=9a52edadc8ff90489f3918686db02278&pt=2&ver=1.0.8&uid=0&imei=96F2AFD1-9B2B-4C95-BAAC-52733E3B3856&device_type=10.0.2&qyb=0&appid=14" block:^(id JSON, NSError *error) {
        if (!error) {
            
            NSLog(@"数据解析%@",JSON[@"data"]);
            if (_moodsArr.count == 0) {
                _moodsArr = [[NSMutableArray alloc] init];
            }
            else{
                [_moodsArr removeAllObjects];
            }
           
            for (NSDictionary *dic in JSON[@"data"]) {
                moodsCollectModel *itemModel = [[moodsCollectModel alloc] init];
                [itemModel setValuesForKeysWithDictionary:dic];
                itemModel.imageUrl = dic[@"icon"];
                itemModel.nameStr = dic[@"name"];
                itemModel.join_num = dic[@"join_num"] ;
                itemModel.need_num = dic[@"need_num"] ;
                itemModel.SID = dic[@"id"];
               
                [_moodsArr addObject:itemModel];
            }
            [self.collectionView reloadData];
        }
        else{
            NSLog(@"错误原因%@",error.description);
        }
    }];
}
#pragma mark 最新
-(void)getLastData{
    _page1 = 1;
    [httpController getRequestWithURL:@"http://db.3z.cc/index.php?tp=ios/category&op=getlist&type=2&page=1&sort=asc&sign=3f0f041562fcbfeac19f27983d8237b7&pt=2&ver=1.0.8&uid=0&imei=96F2AFD1-9B2B-4C95-BAAC-52733E3B3856&device_type=10.0.2&qyb=0&appid=14" block:^(id JSON, NSError *error) {
        if (!error) {
            if (_moodsArr.count == 0) {
                _moodsArr = [[NSMutableArray alloc] init];
            }
            else{
                [_moodsArr removeAllObjects];
            }
            
            for (NSDictionary *dic in JSON[@"data"]) {
                moodsCollectModel *itemModel = [[moodsCollectModel alloc] init];
                [itemModel setValuesForKeysWithDictionary:dic];
                itemModel.imageUrl = dic[@"icon"];
                itemModel.nameStr = dic[@"name"];
                itemModel.join_num = dic[@"join_num"] ;
                itemModel.need_num = dic[@"need_num"] ;
                itemModel.SID = dic[@"id"];
                [_moodsArr addObject:itemModel];
            }
            [self.collectionView reloadData];
        }
        else{
            NSLog(@"错误原因%@",error.description);
        }
    }];
}
#pragma mark 进度
-(void)getProgressData{
    _page2 = 1;
    [httpController getRequestWithURL:@"http://db.3z.cc/index.php?tp=ios/category&op=getlist&type=3&page=1&sort=asc&sign=3f0f041562fcbfeac19f27983d8237b7&pt=2&ver=1.0.8&uid=0&imei=96F2AFD1-9B2B-4C95-BAAC-52733E3B3856&device_type=10.0.2&qyb=0&appid=14" block:^(id JSON, NSError *error) {
        if (!error) {
            if (_moodsArr.count == 0) {
                _moodsArr = [[NSMutableArray alloc] init];
            }
            else{
                [_moodsArr removeAllObjects];
            }
            
            for (NSDictionary *dic in JSON[@"data"]) {
                moodsCollectModel *itemModel = [[moodsCollectModel alloc] init];
                [itemModel setValuesForKeysWithDictionary:dic];
                itemModel.imageUrl = dic[@"icon"];
                itemModel.nameStr = dic[@"name"];
                itemModel.join_num = dic[@"join_num"] ;
                itemModel.need_num = dic[@"need_num"] ;
                itemModel.SID = dic[@"id"];
                [_moodsArr addObject:itemModel];
            }
            [self.collectionView reloadData];
        }
        else{
            NSLog(@"错误原因%@",error.description);
        }
    }];
}
#pragma mark 下拉刷新
-(void)pullGetData{
   
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        if ([_st1 isEqualToString:@"1"]) {
             [self getPullData];
        }
        else if ([_st2 isEqualToString:@"1"]){
            [self getPullData1];
        }
        else if ([_st3 isEqualToString:@"1"]){
            [self getPullData2];
        }
        else{
            
        }
       
       
        [self.collectionView.mj_footer endRefreshing];
    }];
}
-(void)getPullData{
    _page++;
    [httpController getRequestWithURL:[NSString stringWithFormat:@"http://db.3z.cc/index.php?tp=ios/index&op=hot&page=%ld&sign=9a52edadc8ff90489f3918686db02278&pt=2&ver=1.0.8&uid=0&imei=96F2AFD1-9B2B-4C95-BAAC-52733E3B3856&device_type=10.0.2&qyb=0&appid=14",_page] block:^(id JSON, NSError *error) {
        if (!error) {
            
            for (NSDictionary *dic in JSON[@"data"]) {
                moodsCollectModel *itemModel = [[moodsCollectModel alloc] init];
                [itemModel setValuesForKeysWithDictionary:dic];
                itemModel.imageUrl = dic[@"icon"];
                itemModel.nameStr = dic[@"name"];
                itemModel.join_num = dic[@"join_num"] ;
                itemModel.need_num = dic[@"need_num"] ;
                itemModel.SID = dic[@"id"];
                [_moodsArr addObject:itemModel];
            }
            [self.collectionView reloadData];
        }
        else{
            NSLog(@"错误原因%@",error.description);
        }
    }];

}
-(void)getPullData1{
    _page1++;
    [httpController getRequestWithURL:[NSString stringWithFormat:@"http://db.3z.cc/index.php?tp=ios/category&op=getlist&type=2&page=%ld&sort=asc&sign=3f0f041562fcbfeac19f27983d8237b7&pt=2&ver=1.0.8&uid=0&imei=96F2AFD1-9B2B-4C95-BAAC-52733E3B3856&device_type=10.0.2&qyb=0&appid=14",_page1] block:^(id JSON, NSError *error) {
        if (!error) {
            
            for (NSDictionary *dic in JSON[@"data"]) {
                moodsCollectModel *itemModel = [[moodsCollectModel alloc] init];
                [itemModel setValuesForKeysWithDictionary:dic];
                itemModel.imageUrl = dic[@"icon"];
                itemModel.nameStr = dic[@"name"];
                itemModel.join_num = dic[@"join_num"] ;
                itemModel.need_num = dic[@"need_num"] ;
                itemModel.SID = dic[@"id"];
                [_moodsArr addObject:itemModel];
            }
            [self.collectionView reloadData];
        }
        else{
            NSLog(@"错误原因%@",error.description);
        }
    }];
    
}
-(void)getPullData2{
    _page2++;
    [httpController getRequestWithURL:[NSString stringWithFormat:@"http://db.3z.cc/index.php?tp=ios/category&op=getlist&type=3&page=%ld&sort=asc&sign=3f0f041562fcbfeac19f27983d8237b7&pt=2&ver=1.0.8&uid=0&imei=96F2AFD1-9B2B-4C95-BAAC-52733E3B3856&device_type=10.0.2&qyb=0&appid=14",_page2] block:^(id JSON, NSError *error) {
        if (!error) {
            
            for (NSDictionary *dic in JSON[@"data"]) {
                moodsCollectModel *itemModel = [[moodsCollectModel alloc] init];
                [itemModel setValuesForKeysWithDictionary:dic];
                itemModel.imageUrl = dic[@"icon"];
                itemModel.nameStr = dic[@"name"];
                itemModel.join_num = dic[@"join_num"] ;
                itemModel.need_num = dic[@"need_num"] ;
                itemModel.SID = dic[@"id"];
                [_moodsArr addObject:itemModel];
            }
            [self.collectionView reloadData];
        }
        else{
            NSLog(@"错误原因%@",error.description);
        }
    }];
    
}
#pragma mark 最新揭晓
-(void)getNewData{
    [httpController getRequestWithURL:@"http://db.3z.cc/index.php?tp=ios/index&op=recentopen&sign=9a52edadc8ff90489f3918686db02278&pt=2&ver=1.0.8&uid=0&imei=96F2AFD1-9B2B-4C95-BAAC-52733E3B3856&device_type=10.0.2&qyb=0&appid=14&hb=1" block:^(id JSON, NSError *error) {
        if (!error) {
            
           
            [_LQView getLatestThings:JSON[@"data"][@"list"]];
        }
        else{
            
        }
    }];
}
#pragma mark 新品推荐
-(void)getNewThings{
    [httpController getRequestWithURL:@"http://db.3z.cc/index.php?tp=ios/index&op=new&sign=9a52edadc8ff90489f3918686db02278&pt=2&ver=1.0.8&uid=0&imei=96F2AFD1-9B2B-4C95-BAAC-52733E3B3856&device_type=10.0.2&qyb=0&appid=14&hb=1" block:^(id JSON, NSError *error) {
        if (!error) {
          
            [_LQView recomedLastThings:JSON[@"data"]];
        }
        else{
            NSLog(@"新品推荐错误原因%@",error.description);
        }
    }];
}
#pragma mark 获取获奖人信息
-(void)getPrizePerson{
    [httpController getRequestWithURL:@"http://db.3z.cc/system.php?tp=getawardnotice&sign=671653ca243a3f6a9ac7be3c9528b197&imei=0&pt=2&ver=1.0.8&uid=0&imei=96F2AFD1-9B2B-4C95-BAAC-52733E3B3856&device_type=10.0.2&qyb=0&appid=14" block:^(id JSON, NSError *error) {
        if (!error) {
            
           
            [_LQView getPricePersonPage:JSON[@"data"]];
            
        }
        else{
            NSLog(@"%@",error.description);
        }
    }];
}

#pragma mark 刷新数据
-(void)freshAdvancePage{
    [_LQView advertisementScrollPage:_imageUrl];
}

-(void)selectNormal:(NSInteger)num{
    if (num == 0) {
        [self getGetData];
        _st1 = @"1";
        _st2 = @"0";
        _st3 = @"0";
        _st4 = @"0";
    }
    else if (num == 1){
        [self getLastData];
        _st1 = @"0";
        _st2 = @"1";
        _st3 = @"0";
        _st4 = @"0";
    }
    else if (num == 2){
        [self getProgressData];
        _st1 = @"0";
        _st2 = @"0";
        _st3 = @"1";
        _st4 = @"0";
    }
    else{
        _st1 = @"0";
        _st2 = @"0";
        _st3 = @"0";
        _st4 = @"1";
    }
    if ([_scrFlag isEqualToString:@"stop"]) {
        [_collectionView setContentOffset:CGPointMake(0, -64) animated:YES];
    }
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%lf",scrollView.contentOffset.y);
    if (scrollView.contentOffset.y >= -64.0) {
        _scrFlag = @"stop";
    }
    else{
        _scrFlag = @"top";
    }
}
#pragma mark 设置导航栏
-(void)setNavr{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 30, 30);
    [leftButton setImage:[UIImage imageNamed:@"main"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(presentLeftMenuViewController:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 30, 30);
    [rightButton setImage:[UIImage imageNamed:@"searchicon"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(searchPage) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
}
-(void)sideslipPage{
    //[self.viewDeckController toggleLeftViewAnimated:YES];
}
-(void)searchPage{
    self.tabBarController.tabBar.hidden = YES;
   //这里在搜索按钮中测试
//    //百度
//    BaiDuViewController *baiduController = [[BaiDuViewController alloc] init];
//    [self.navigationController pushViewController:baiduController animated:YES];
    //高德
    GoDeMapViewController *godeController = [[GoDeMapViewController alloc] init];
    [self.navigationController pushViewController:godeController animated:YES];
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
