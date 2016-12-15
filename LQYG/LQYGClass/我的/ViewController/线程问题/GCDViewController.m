//
//  GCDViewController.m
//  LQYG
//
//  Created by issuser on 2016/12/5.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
#warning 使用按钮实现线程问题
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 100, 100, 30);
    [button setTitle:@"依次执行" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(oneAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(110, 100, 100, 30);
    [button1 setTitle:@"并发(谁先完成谁加载)" forState:UIControlStateNormal];
    button1.backgroundColor = [UIColor redColor];
    [button1 addTarget:self action:@selector(oneAction1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(0, 200, 100, 30);
    [button2 setTitle:@"串行队列中只有一个线程执行任务" forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor redColor];
    [button2 addTarget:self action:@selector(oneAction2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
#warning 并发 串行 
/*   
    DISPATCH_QUEUE_CONCURRENT 并发
    DISPATCH_QUEUE_SERIAL 串行
 */

    // Do any additional setup after loading the view.
}
-(void)oneAction{
#warning 执行线程
    [self GCDOne];
}
#warning 依次执行 并发只能在异步函数下有效 name = main 还不会创建新的线程 所有的任务依次在主线程上执行
-(void)GCDOne{
    dispatch_queue_t queue = dispatch_queue_create("com.lai.www", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 10; i++) {
        //10个异步
        dispatch_sync(queue, ^{
            NSLog(@"依次执行%@ ---- %d",[NSThread currentThread],i);
        });
    }
    
}

-(void)oneAction1{
    [self GCDTwo];
}
#warning 并行执行 (谁先完成谁先显示)
-(void)GCDTwo{
    dispatch_queue_t queue = dispatch_queue_create("com.lai.www", DISPATCH_QUEUE_CONCURRENT);
    for (int i =0; i < 10; i++) {
#warning 10个异步
        dispatch_async(queue, ^{
            NSLog(@"%@ ---- %d",[NSThread currentThread],i);
        });
    }
}

-(void)oneAction2{
    [self THreee];
}
#warning 串行队列中只有一个线程执行任务
-(void)THreee{
    dispatch_queue_t queue = dispatch_queue_create("com.lai.www", DISPATCH_QUEUE_SERIAL);
    for (int i =0; i < 10; i++) {
        dispatch_async(queue, ^{
            NSLog(@"%@ --- %d",[NSThread currentThread],i);
        });
    }
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
