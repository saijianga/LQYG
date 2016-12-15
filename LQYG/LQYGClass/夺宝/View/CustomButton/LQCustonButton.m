//
//  LQCustonButton.m
//  LQYG
//
//  Created by issuser on 2016/10/21.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "LQCustonButton.h"

@implementation LQCustonButton
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _BuImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, frame.size.width-20, frame.size.height - 20)];
        _BuLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_BuImageView.frame), frame.size.width, 20)];
        _BuLabel.textAlignment = NSTextAlignmentCenter;
        _BuLabel.font = [UIFont systemFontOfSize:10];
        _BuLabel.textColor = [UIColor blackColor];
        [self addSubview:_BuImageView];
        [self addSubview:_BuLabel];
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
