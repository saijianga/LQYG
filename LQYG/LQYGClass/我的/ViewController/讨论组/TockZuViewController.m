//
//  TockZuViewController.m
//  LQYG
//
//  Created by issuser on 2016/12/5.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "TockZuViewController.h"

@interface TockZuViewController ()

@end

@implementation TockZuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *createButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [createButton setTitle:@"创建讨论组" forState:UIControlStateNormal];
    [createButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    createButton.frame = CGRectMake(10, 100, 100, 30);
    [createButton addTarget:self action:@selector(createTock) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:createButton];
    
    //加入讨论组
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [addButton setTitle:@"加入讨论组" forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    addButton.frame = CGRectMake(10, 200, 100, 30);
    [addButton addTarget:self action:@selector(addTock) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];

    
    
    
    
    // Do any additional setup after loading the view.
}
-(void)createTock{
    [[RCIM sharedRCIM] createDiscussion:@"哈哈哈哈" userIdList:@[@"fde32cad",@"88dfade"] success:^(RCDiscussion *discussion) {
        NSLog(@"讨论组ID%@",discussion.discussionId);
        NSLog(@"创建讨论组成功");
    } error:^(RCErrorCode status) {
        NSLog(@"创建讨论组失败");
        NSLog(@"%ld",status);
    }];
}

-(void)addTock{
    [[RCIM sharedRCIM] addMemberToDiscussion:@"" userIdList:@[@""] success:^(RCDiscussion *discussion) {
        
    } error:^(RCErrorCode status) {
        
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
