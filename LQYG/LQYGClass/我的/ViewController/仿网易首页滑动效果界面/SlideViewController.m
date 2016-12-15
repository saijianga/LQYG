//
//  SlideViewController.m
//  LQYG
//
//  Created by issuser on 2016/12/5.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "SlideViewController.h"


#import "SubViewController1.h"
#import "SubViewController2.h"
#import "SubViewController3.h"
#import "SubViewController4.h"
@interface SlideViewController ()

@end

@implementation SlideViewController
- (instancetype)init {
    if (self = [super init]) {
        /*
         WMMenuViewStyleDefault,      // 默认
         WMMenuViewStyleLine,         // 带下划线 (若要选中字体大小不变，设置选中和非选中大小一样即可)
         WMMenuViewStyleTriangle,     // 三角形 (progressHeight 为三角形的高, progressWidths 为底边长)
         WMMenuViewStyleFlood,        // 涌入效果 (填充)
         WMMenuViewStyleFloodHollow,  // 涌入效果 (空心的)
         WMMenuViewStyleSegmented,  涌入带边框,即网易新闻选项卡
         */
        self.menuViewStyle = WMMenuViewStyleLine;
        self.titleSizeSelected = 14.0f;
        self.titleSizeNormal = 14.0f;
        self.menuHeight = 44;
        self.titles = @[@"我的", @"他的"];
        self.progressViewWidths = @[@10, @10];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.selectIndex = 2;//默认选中第二个
    self.pageAnimatable = YES;
    // Do any additional setup after loading the view.
}
-(NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return 4;
}
-(UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    switch (index) {
        case 0:
        {
            SubViewController1 *sub1 = [[SubViewController1 alloc] init];
            return sub1;
        }
            break;
        case 1:
        {
            SubViewController2 *sub2 = [[SubViewController2 alloc] init];
            return sub2;
        }
            break;
        case 2:
        {
            SubViewController3 *sub3 = [[SubViewController3 alloc] init];
            return sub3;
        }
            break;
        case 3:{
            SubViewController4 *sub4 = [[SubViewController4 alloc] init];
            return sub4;
        }
            break;
        default:
            break;
    }
    return nil;
}
-(NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
    return @"111111";
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
