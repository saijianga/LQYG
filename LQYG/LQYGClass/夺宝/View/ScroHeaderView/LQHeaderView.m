//
//  LQHeaderView.m
//  LQYG
//
//  Created by issuser on 2016/10/20.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "LQHeaderView.h"

@implementation LQHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

        self.scrImagePage = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 150)];
        self.scrImagePage.pagingEnabled = YES;
        [self addSubview:self.scrImagePage];
        
        
       // _NoticPageView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_scrImagePage.frame), self.frame.size.width, 40)];
        _GScroView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_scrImagePage.frame), self.frame.size.width, 40)];
        
        
       // [_NoticPageView addSubview:_GScroView];
        [self addSubview:_GScroView];

        
        _NView = [FView instanceView];
        _NView.frame = CGRectMake(0, CGRectGetMaxY(_GScroView.frame), frame.size.width, 100);
        _NView.AllNameLabel.text = @"最新揭晓";
        [self addSubview:_NView];
        
        _lqview = [FView instanceView];
        _lqview.frame = CGRectMake(0, CGRectGetMaxY(_NView.frame)+20, frame.size.width, 100);
        _lqview.AllNameLabel.text = @"新品推荐";
        
        [self addSubview:_lqview];
        
       
    }
    return self;
}
#pragma mark 广告滚动视图
-(void)advertisementScrollPage:(NSArray *)arr{
    self.scrImagePage.contentSize = CGSizeMake(self.frame.size.width * arr.count, 150);
    for (int i=0; i < arr.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width * i, 0, self.frame.size.width, 150)];
        imageView.image = [UIImage imageNamed:arr[i]];
        [self.scrImagePage addSubview:imageView];
        
    }
}

#pragma mark 获奖人员名单
-(void)getPricePersonPage:(NSArray *)arr{
    _nameArr = [NSMutableArray arrayWithArray:arr];
    _GScroView.contentSize = CGSizeMake(self.frame.size.width, 40 * arr.count);
//    _GScroView.backgroundColor = [UIColor redColor];
    if ([_GScroView subviews].count >0) {
       
        for (UIView * view in [_GScroView subviews]) {
            [view removeFromSuperview];
        }
    }
    
    for (int i =0; i < arr.count; i++) {
        
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, i * 40, self.frame.size.width, 40)];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
        
        imageView.image = [UIImage imageNamed:@"common_notify_19x18_.png"];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame)+5, 10, self.frame.size.width - 30, 20)];
        
        NSString *str = [NSString stringWithFormat:@"恭喜%@刚刚获得%@",_nameArr[i][@"username"],_nameArr[i][@"name"]];
        label.attributedText = [self setLabelTextColor:_nameArr[i][@"username"] andAllMessage:str];
        [view addSubview:imageView];
        [view addSubview:label];
        
        [_GScroView addSubview:view];
        
    }
    
    [self addTimer];
 
}
#pragma mark 最新揭晓
-(void)getLatestThings:(NSArray *)arr{
    
    if ([_NView subviews].count > 0) {
       
            for (LQCustomTimerButton *btn in [_NView subviews]) {
                 if ([_NView.superview isKindOfClass:[LQCustomTimerButton class]]) {
                     [btn removeFromSuperview]; 
                 }
               
            }
      
        
       
    }
    _timerArr = [NSArray arrayWithArray:arr];
    
    for (int i =0; i < _timerArr.count; i ++) {
        LQCustomTimerButton *btn = [[LQCustomTimerButton alloc] initWithFrame:CGRectMake(((self.frame.size.width - 6)/_timerArr.count + 3) *i, 20, (self.frame.size.width - 6)/_timerArr.count, 79)];
        
        if (i != _timerArr.count - 1) {
            UILabel *LineLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(btn.frame)+1, CGRectGetMinY(btn.frame), 1, 78)];
            LineLabel.backgroundColor = [UIColor colorWithRed:184 / 255.0 green:184 / 255.0 blue:184 / 255.0 alpha:1];
            [_NView addSubview:LineLabel];
        }
        
        btn.tag = 10+i;
        [btn.TimImageView sd_setImageWithURL:[NSURL URLWithString:_timerArr[i][@"icon"]] placeholderImage:[UIImage imageNamed:@""]];
        
        [_NView addSubview:btn];
    }
    [self NewTimerGet];
    
 
}
#pragma mark 新品推荐
-(void)recomedLastThings:(NSArray *)arr{
    if ([_lqview subviews].count > 0) {
        
       
            for (LQCustonButton *btn in [_lqview subviews]) {
                if ([btn isKindOfClass:[LQCustonButton class]]) {
                     [btn removeFromSuperview];
                     NSLog(@"移除");
                }
               
               
            }
    }

    for (int i =0; i < arr.count; i ++) {
        LQCustonButton *btn = [[LQCustonButton alloc] initWithFrame:CGRectMake(((self.frame.size.width - 6)/arr.count + 3) *i, 20, (self.frame.size.width - 6)/arr.count, 79)];
        [btn.BuImageView sd_setImageWithURL:[NSURL URLWithString:arr[i][@"icon"]] placeholderImage:[UIImage imageNamed:@""]];
        btn.BuLabel.text = arr[i][@"name"];
        if (i != arr.count - 1) {
            UILabel *LineLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(btn.frame)+1, CGRectGetMinY(btn.frame), 1, 78)];
            LineLabel.backgroundColor = [UIColor colorWithRed:184 / 255.0 green:184 / 255.0 blue:184 / 255.0 alpha:1];
            [_lqview addSubview:LineLabel];
            
        }
        [_lqview addSubview:btn];
    }
 
}












-(void)addTimer{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(nextPerson) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}
-(void)nextPerson{
    _nu ++;
    if (_nu >= _nameArr.count) {
        _nu = 0;
    }
    
    [_GScroView setContentOffset:CGPointMake(0, 40 * _nu) animated:YES];
}

-(void)NewTimerGet{
    if (!_STimer) {
        _STimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(getLastTimer) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_STimer forMode:NSRunLoopCommonModes];
    }
}
-(void)getLastTimer{
    
    
    
    //获取当前系统时间 并转为时间戳
    NSDate *currentData = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a = [currentData timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%.0f",a];
   
    
    for (int i = 0;i<_timerArr.count;i++) {
        LQCustomTimerButton *btn = [self viewWithTag:10+i];
        if ([_timerArr[i][@"open_time"] doubleValue] < [timeString doubleValue]) {
            btn.TimerLabel.text = @"查看揭晓结果";
            btn.TImageView.hidden = YES;
            
        }
        else{
            
            float timer =[_timerArr[i][@"open_time"] doubleValue] - [timeString doubleValue];
            int mm = timer / 60;
            int ss = (int)(timer - mm * 60);
          
            _fs++;
            if (_fs == 100) {
                _fs = 0;
                
            }
            
            btn.TimerLabel.text = [NSString stringWithFormat:@"%.2d:%.2d:%.2d",mm,ss,_fs];
            btn.TImageView.hidden = YES;
        }
    }
}
#pragma mark 设置字体颜色
-(NSMutableAttributedString *)setLabelTextColor:(NSString *)userName andAllMessage:(NSString *)allStr{
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:allStr];
    
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(2, userName.length)];
    return attrString;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
