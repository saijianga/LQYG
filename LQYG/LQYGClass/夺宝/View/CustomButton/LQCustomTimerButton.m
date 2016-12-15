//
//  LQCustomTimerButton.m
//  LQYG
//
//  Created by issuser on 2016/10/21.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "LQCustomTimerButton.h"

@implementation LQCustomTimerButton
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _TimImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 3, frame.size.width - 20, frame.size.height - 20)];
        _TImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(_TimImageView.frame)+5, 10, 10)];
        _TImageView.image = [UIImage imageNamed:@"list_publish.png"];
        _TimerLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_TImageView.frame)+10, CGRectGetMaxY(_TimImageView.frame)+2, frame.size.width - CGRectGetMaxX(_TImageView.frame), 15)];
        _TimerLabel.font = [UIFont systemFontOfSize:10];
        _TimerLabel.textColor = [UIColor colorWithRed:253 / 255.0 green:203 / 255.0 blue:37 / 255.0 alpha:1];
       // _TimerLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_TImageView];
        [self addSubview:_TimImageView];
        [self addSubview:_TimerLabel];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
