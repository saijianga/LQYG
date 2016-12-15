//
//  OrdinalViewController.m
//  LQYG
//
//  Created by issuser on 2016/12/6.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "OrdinalViewController.h"
#import "SDCycleScrollView.h"
@interface OrdinalViewController ()<SDCycleScrollViewDelegate>

@end

@implementation OrdinalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if ([[UIDevice currentDevice].systemVersion floatValue]>=7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
//    SDCycleScrollView *pictureScroll  = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100) imageNamesGroup:@[@"1.png",@"2.png",@"3.png",@"4.png"]];
    
   SDCycleScrollView *pictureScroll = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100) delegate:self placeholderImage:[UIImage imageNamed:@"千库网-淘宝海报图片"]];
    pictureScroll.autoScrollTimeInterval = 3.0f;//时间
    pictureScroll.delegate = self;
    pictureScroll.localizationImageNamesGroup = @[@"1.png",@"2.png",@"3.png",@"千库网-淘宝海报图片.jpg"];
    pictureScroll.titlesGroup = @[@"sdjshdsfj",@"sdsd",@"sdsd",@"sdsdsd"];
    pictureScroll.showPageControl = YES;
    
    pictureScroll.currentPageDotColor = [UIColor redColor];
    pictureScroll.pageDotColor = [UIColor blackColor];
    
    [self.view addSubview:pictureScroll];
    
    // Do any additional setup after loading the view.
}
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    /** 图片滚动回调 */
    NSLog(@"%ld",index);
}
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    /** 点击图片回调 */
    NSLog(@"%ld",index);
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
