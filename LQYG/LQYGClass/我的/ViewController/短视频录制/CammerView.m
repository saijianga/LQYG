//
//  CammerView.m
//  LQYG
//
//  Created by issuser on 2016/12/7.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "CammerView.h"

@implementation CammerView
-(instancetype)init{
    if (self = [super init]) {
        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [cancelButton setTitle:@"返回" forState:UIControlStateNormal];
        [cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        cancelButton.frame = CGRectMake(10, 10, 60, 30);
        [self addSubview:cancelButton];
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
