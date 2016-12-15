//
//  shareBlackView.m
//  LQYG
//
//  Created by issuser on 2016/11/18.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "shareBlackView.h"

@implementation shareBlackView
-(instancetype)init{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        
        [[[UIApplication sharedApplication] keyWindow] addSubview:self];
        _shareView = [shareView intanceView];
        _shareView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 180, [UIScreen mainScreen].bounds.size.width, 180);
        [self addSubview:_shareView];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeShare:) name:@"remove" object:nil];
        
    }
    return self;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self removeFromSuperview];
}
-(void)removeShare:(NSNotification *)notif{
    
    [self removeFromSuperview];
    NSString *str = notif.userInfo[@"code"];
    if ([str isEqualToString:@"0"]) {
        [[SwitchController sharedSVC] showMessage:@"分享成功" inView:[[UIApplication sharedApplication] keyWindow]];
    }
    else if ([str isEqualToString:@"-2"]){
         [[SwitchController sharedSVC] showMessage:@"分享失败" inView:[[UIApplication sharedApplication] keyWindow]];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
