//
//  AntionmationViewController.m
//  LQYG
//
//  Created by issuser on 2016/12/2.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "AntionmationViewController.h"
#import "YXEasing.h"
@interface AntionmationViewController ()
@property(nonatomic,strong)CALayer *secLayer;//秒针layer
@property(nonatomic,strong)NSTimer *timer;//定时
@end

@implementation AntionmationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //基本动画
    [self basceAnimation];
    
    //关键帧动画
    [self keyAnimation];
    
    //时钟秒针动画
    [self secAnimation];
    
    //碰撞动画
    [self crashAnimation];
    
    //衰减效果 (屏幕向左滑动的背景衰减效果)
    [self attenuationAnimation];
    
    // Do any additional setup after loading the view.
}
#pragma mark 基本动画效果
/*
 (1) 创建原始 UI 或者画面；
 (2) 创建 CABasicAnimation 实例, 并设置； keypart/duration/fromValue/toValue ；
 (3) 设置动画最终停留的位置；
 (4) 将配置好的动画添加到 layer 层中；
 
 举个例子，实现一个圆形从上往下移动，实例代码如下
 */
-(void)basceAnimation{
    UIView *showView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    showView.layer.masksToBounds = YES;
    showView.layer.cornerRadius = 50.f;
    showView.layer.backgroundColor = [UIColor redColor].CGColor
    ;
    [self.view addSubview:showView];
    
    //创建基本动画效果
    CABasicAnimation *baseicAnimation = [CABasicAnimation animation];
    //设置属性
    baseicAnimation.keyPath = @"position";
    baseicAnimation.duration = 4.0f;
    baseicAnimation.fromValue = [NSValue valueWithCGPoint:showView.center];
    baseicAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 200)];
    //设置动画结束位置
    showView.center = CGPointMake(100, 200);
    //添加动画到layer层
    [showView.layer addAnimation:baseicAnimation forKey:nil];
    
}
#pragma mark 关键帧动画
/*
 其实跟基本动画差不多, 只是能设置多个动画路径 使用方法也类似, 大致为：
 1 创建原始 UI 或者画面；
 2 创建 CAKeyframeAnimation 实例, 并设置keypart/duration/values 相比基本动画只能设置开始和结束点, 关键帧动画能添加多个动画路径点；
 3 设置动画最终停留的位置；
 4 将配置好的动画添加到layer层中。
 举个例子，实现一个红色圆球左右晃动往下坠落，实例代码如下：
 */
-(void)keyAnimation{
    //设置原始动画
    UIView *showView = [[UIView alloc] initWithFrame:CGRectMake(150, 100, 100, 100)];
    showView.layer.masksToBounds = YES;
    showView.layer.cornerRadius = 50.f;
    showView.layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view addSubview:showView];
    //创建关键帧动画
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    //设置动画属性
    keyAnimation.keyPath = @"position";
    keyAnimation.duration = 5.0f;
    keyAnimation.values = @[[NSValue valueWithCGPoint:showView.center],[NSValue valueWithCGPoint:CGPointMake(100, 100)],[NSValue valueWithCGPoint:CGPointMake(50, 100)],[NSValue valueWithCGPoint:CGPointMake(200, 250)]];
    //设置动画结束位置
    showView.center = CGPointMake(200, 250);
    //添加动画到layer层
    [showView.layer addAnimation:keyAnimation forKey:nil];
}
#pragma mark 缓动函数实现动画效果
#warning 1 实现弹簧效果(时钟秒针震动效果)
-(void)secAnimation{
    //创建一个表盘
    UIView *showView = [[UIView alloc] initWithFrame:CGRectMake(100, 300, 300, 300)];
    showView.center = self.view.center;
    showView.layer.borderWidth = 1.0f;
    showView.layer.cornerRadius = 150.f;
    showView.layer.borderColor = [UIColor redColor].CGColor;
    [self.view addSubview:showView];
    //创建秒针
    self.secLayer = [CALayer layer];
    self.secLayer.anchorPoint = CGPointMake(0, 0);
    self.secLayer.frame = CGRectMake(150, 150, 1, 150);
    self.secLayer.backgroundColor = [UIColor blueColor].CGColor;
    [showView.layer addSublayer:_secLayer];
    //创建定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(timerEvent) userInfo:nil repeats:YES];
}
-(void)timerEvent{
    static int i=1;
    CGFloat oldValue = DEGREES_TO_RADIANS((360 / 60.f) * i++);
    CGFloat newValue = DEGREES_TO_RADIANS((360 / 60.f) * i);
    //创建关键帧动画
    CAKeyframeAnimation *keyFramdeAnimation = [CAKeyframeAnimation animation];
    keyFramdeAnimation.keyPath = @"transform.rotation.z";
    keyFramdeAnimation.duration = 0.5;
    keyFramdeAnimation.values = [YXEasing calculateFrameFromValue:oldValue toValue:newValue func:ElasticEaseOut frameCount:0.5 *30];
    self.secLayer.transform = CATransform3DMakeRotation(newValue, 0, 0, 1);
    [self.secLayer addAnimation:keyFramdeAnimation forKey:nil];
    
}
#warning 2 实现碰撞效果(指定图片往下的碰撞效果)
-(void)crashAnimation{
    //创建图片view
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    imageView.image = [UIImage imageNamed:@"1.png"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView];
    //创建关键帧动画(移动距离的动画)
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.keyPath = @"position";
    keyAnimation.duration = 2.f;
    keyAnimation.values = [YXEasing calculateFrameFromPoint:imageView.center toPoint:CGPointMake(320 / 2.f, 320 / 2.f + 240) func:BounceEaseOut frameCount:2 * 30];
    //添加动画
    imageView.center = CGPointMake(320 / 2.f, 320 / 2.f + 240);
    [imageView.layer addAnimation:keyAnimation forKey:nil];
}
#warning 3 实现衰减效果(屏幕向左滑动的背景衰减效果)
-(void)attenuationAnimation{
    //背景变暗的view
    UIView *backView = [[UIView alloc] initWithFrame:self.view.bounds];
    backView.alpha = 0;
    backView.backgroundColor = [UIColor brownColor];
    [UIView animateWithDuration:1.0f animations:^{
        backView.alpha = 0.3;
    }];
    [self.view addSubview:backView];
    //创建一个背景图
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(320, 0, 320, SCREEN_HEIGHT)];
    imageView.image = [UIImage imageNamed:@"2.png"];
    [self.view addSubview:imageView];
    //创建关键帧动画
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.keyPath = @"position";
    keyAnimation.duration = 1.0f;
    keyAnimation.values = [YXEasing calculateFrameFromPoint:imageView.center toPoint:CGPointMake(self.view.center.x + 200, self.view.center.y) func:CubicEaseOut frameCount:1 * 30];
    //加载关键帧动画
    imageView.center = CGPointMake(self.view.center.x + 200, self.view.center.y);
    [imageView.layer addAnimation:keyAnimation forKey:nil];
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
