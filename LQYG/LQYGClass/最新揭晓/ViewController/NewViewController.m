//
//  NewViewController.m
//  LQYG
//
//  Created by issuser on 2016/10/19.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController ()

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"CustomCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"NewCustomCell"];
    [self.view addSubview:_collectionView];
    
    // Do any additional setup after loading the view.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NewCustomCell" forIndexPath:indexPath];
    
    if (indexPath.row == 0 || indexPath.row == 8) {
        cell.NLuckLabel.text = @"";
        cell.NLuckNameLabel.text = @"";
        cell.NCanLabel.text = @"";
        cell.NCanNumberLabel.text = @"";
        cell.NJLabel.text = @"";
        cell.NJTimerLabel.text = @"";
        cell.NGLabel.text = @"正在揭晓";
        cell.NGDLabel.text = @"10: 09: 06";
    }
    else{
    cell.NLuckLabel.text = @"幸运者:";
    cell.NLuckNameLabel.text = @"2654623546";
    cell.NCanLabel.text = @"参与人次:";
    cell.NCanNumberLabel.text = @"1人参与";
    cell.NJLabel.text = @"揭晓时间:";
    cell.NJTimerLabel.text = @"11-01 15:09";
        cell.NGLabel.text = @"";
        cell.NGDLabel.text = @"";
    }
    //cell.backgroundColor = [UIColor greenColor];
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((SCREEN_WIDTH - 20) / 2, 235);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 5, 0, 5);
}
-(void)getNewData{
    [httpController getRequestWithURL:@"http://db.3z.cc/index.php?tp=ios/index&op=recentopen&sign=9a52edadc8ff90489f3918686db02278&pt=2&ver=1.0.8&uid=0&imei=96F2AFD1-9B2B-4C95-BAAC-52733E3B3856&device_type=10.0.2&qyb=0&appid=14&hb=1" block:^(id JSON, NSError *error) {
        if (!error) {
            NSLog(@"最新数据%@",JSON);
        }
        else{
            NSLog(@"最新%@",error.description);
        }
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
