//
//  MyViewController.m
//  LQYG
//
//  Created by issuser on 2016/10/19.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "MyViewController.h"
#import "LondingViewController.h"
#import "GiftViewController.h"
#import "BLEViewController.h"//蓝牙相关
#import "BusViewController.h"//公交路线
#import "ChatRccViewController.h"
#import "AntionmationViewController.h"//动画界面
#import "TockZuViewController.h"//讨论组创建
#import "GCDViewController.h"
#import "OrdinalViewController.h"
#import "VideoViewController.h"//视频
#import "PodPictureViewController.h"//上传图片

#import "SlideViewController.h"
#import "SubViewController1.h"
#import "SubViewController2.h"
#import "SubViewController3.h"
#import "SubViewController4.h"





@interface MyViewController ()

@end

@implementation MyViewController
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)viewWillAppear:(BOOL)animated{
    NSUserDefaults *defaults = [[NSUserDefaults alloc] init];
    NSString *str = [defaults objectForKey:@"loading"];
    if (![str isEqualToString:@"loading"]) {
        LondingViewController *loadingControl =[[LondingViewController alloc] init];
        [self.navigationController presentViewController:loadingControl animated:YES completion:nil];
        return;
        
    }
    
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[UIDevice currentDevice].systemVersion floatValue]>=7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    
    
    
    [self createTable];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeSharePage:) name:@"colseShare" object:nil];
    
    _freshControl = [[UIRefreshControl alloc] init];
    [_freshControl addTarget:self action:@selector(freshAction) forControlEvents:UIControlEventValueChanged];
    _freshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"数据刷新中........"];
    [_table addSubview:_freshControl];
   // [_freshControl beginRefreshing];
    // Do any additional setup after loading the view.
    
    

}
-(void)freshAction{
   // [_freshControl endRefreshing];
}

#pragma mark 关闭分享
-(void)closeSharePage:(NSNotification *)notif{
 
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"remove" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"remove" object:self userInfo:notif.userInfo];
}

#pragma mark table
-(void)createTable{
    _arr = @[@{@"image":@"my_hb.png",@"name":@"我的红包",@"selec":@"0个红包"},@{@"image":@"my_db.png",@"name":@"夺宝记录",@"selec":@""},@{@"image":@"my_hj.png",@"name":@"幸运记录",@"selec":@""},@{@"image":@"my_award.png",@"name":@"充值记录",@"selec":@""},@{@"image":@"my_post.png",@"name":@"我的晒单",@"selec":@""},@{@"image":@"my_news.png",@"name":@"我的消息",@"selec":@""},@{@"image":@"my_card.png",@"name":@"我的成绩单",@"selec":@""},@{@"image":@"my_address.png",@"name":@"收货地址",@"selec":@""}];
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview:_table];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goToPersonControl) name:@"PersonControl" object:nil];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 220;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
//   MyCusView *sucView = [MyCusView instanceMyCusView];
//    sucView.deleage = self;
    return [MyCusView instanceMyCusView];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyTableViewCell" owner:nil options:nil] objectAtIndex:0];
    }
    cell.MyImageView.image = [UIImage imageNamed:_arr[indexPath.row][@"image"]];
    cell.MyLabel.text = _arr[indexPath.row][@"name"];
    cell.MyMeLabel.text = _arr[indexPath.row][@"selec"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        GiftViewController *giftControl = [[GiftViewController alloc] init];
        [self.navigationController pushViewController:giftControl animated:YES];
    }
    else if (indexPath.row == 4){
#warning 蓝牙页面
        BLEViewController *bleController = [[BLEViewController alloc] init];
        [self.navigationController pushViewController:bleController animated:YES];
    }
    else if (indexPath.row == 5){
        BusViewController *busControl = [[BusViewController alloc] init];
        [self.navigationController pushViewController:busControl animated:YES];
    }
    else if (indexPath.row == 6){
#warning  创建聊天界面
        //新建一个聊天会话view Controller对象
        ChatRccViewController *ChatController = [[ChatRccViewController alloc] init];
        //设置会话的类型,如单聊  讨论组 群聊 聊天室 客服 公众服务会话等
        /*
         ConversationType_PRIVATE 单聊
         
         */
        ChatController.conversationType = ConversationType_PRIVATE;
        //设置会话ID (单聊 客服 公众服务会话为对方的ID, 讨论组 群聊 聊天室为会话的ID)
        ChatController.targetId = @"88dfade";//对方的ID号 88dfade  (jiangsai  fde32cad)
        /*
         
         id  88dfade
         name 对方
         
         {"code":200,"userId":"88dfade","token":"uiyq231sbV8KFNEbsPjoJRusbRhUzMvbfgjXZ7pbn8hZXEE8TPyU9+tdxKd0wmypiSgYJQXd0FWWpPbHrqraHA=="}
         */
        //设置聊天会话界面要显示的标题
        ChatController.title = @"对方";//对方   jiangsai
        
        //显示聊天界面
        [self.navigationController pushViewController:ChatController animated:YES];
    }
    else if (indexPath.row == 1){
        AntionmationViewController *animationControl = [[AntionmationViewController alloc] init];
        [self.navigationController pushViewController:animationControl animated:YES];
    }
    else if (indexPath.row == 2){
#warning 创建讨论组
        TockZuViewController *tock = [[TockZuViewController alloc] init];
        [self.navigationController pushViewController:tock animated:YES];
    }
    else if (indexPath.row == 3){
        NSLog(@"添加通知信息");
#warning 线程问题
        GCDViewController *gcdControl = [[GCDViewController alloc] init];
      //  [self.navigationController pushViewController:gcdControl animated:YES];
#warning 设置本地推送
//        [self locationPush];
#warning 视频录制
        VideoViewController *VideoController = [[VideoViewController alloc] init];
        [self.navigationController pushViewController:VideoController animated:YES];
    }
    else if (indexPath.row == 7){
#warning 仿网易首页 滑动页面效果
        /*
        SubViewController1 *sub1 = [[SubViewController1 alloc] init];
        SubViewController2 *sub2 = [[SubViewController2 alloc] init];
        SubViewController3 *sub3 = [[SubViewController3 alloc] init];
        SubViewController4 *sub4 = [[SubViewController4 alloc] init];
        
        SlideViewController *slideControl =[[SlideViewController alloc] initWithViewControllerClasses:@[sub1,sub2,sub3,sub4] andTheirTitles:@[@"1",@"2",@"3",@"4"]];
         */
        
        SlideViewController *slideControl = [[SlideViewController alloc] init];
        [self.navigationController pushViewController:slideControl animated:YES];
        
#warning 图片轮播

        
        
        OrdinalViewController *ordinalControl = [[OrdinalViewController alloc] init];
       // [self.navigationController pushViewController:ordinalControl animated:YES];
#warning 仿购物图片上传
        PodPictureViewController *poController = [[PodPictureViewController alloc] init];
    //    [self.navigationController pushViewController:poController animated:YES];
    }
}
-(void)goToPersonControl{
    PersonViewController *personControl = [[PersonViewController alloc] init];
    [self.navigationController pushViewController:personControl animated:YES];
}

#warning mark 本地推送配置
-(void)locationPush{
    //创建一个本地通知
    UILocalNotification *locationNote = [[UILocalNotification alloc] init];
    //设置通知发出的时间
    locationNote.fireDate = [NSDate dateWithTimeIntervalSinceNow:2];
    //设置通知内容
    locationNote.alertBody = @"本地通知测试";
    locationNote.hasAction = YES;
    //设置启动图(通过通知打开)
//    locationNote.alertLaunchImage = @"";
    //设置通知声音
    locationNote.soundName = UILocalNotificationDefaultSoundName;
    //设置应用图标左上角显示的数字
    locationNote.applicationIconBadgeNumber = 999;
    //设置额外的信息(通知携带的信息)
    locationNote.userInfo = @{@"sdsd":@"sdsd",@"sdsdsdsd":@"sdsddsf"};
    
    //执行通知
    [[UIApplication sharedApplication] scheduleLocalNotification:locationNote];
    
}
//取消本地所有通知
-(void)cancelLocation{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
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
