//
//  MyCollectionReusableView.m
//  LQYG
//
//  Created by issuser on 2016/10/20.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "MyCollectionReusableView.h"

@implementation MyCollectionReusableView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

     [self setSelectButton];
    }
    return self;
}
-(void)setSelectButton{
    self.backgroundColor = [UIColor whiteColor];
    _lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 38, (self.frame.size.width - 40) / 4, 2)];
    _lineLabel.backgroundColor = [UIColor colorWithRed:253 / 255.0 green:203 / 255.0 blue:37 / 255.0 alpha:1];
    [self addSubview:_lineLabel];
    NSArray *namerr = @[@"人气",@"最新",@"进度",@"总需人次"];
    for (int i=0;i<4;i++) {
        UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor whiteColor];
        btn.frame = CGRectMake(self.frame.size.width / 4 * i, 10, self.frame.size.width / 4, 20);
        [btn setTitle:namerr[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:10];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:253 / 255.0 green:203 / 255.0 blue:37 / 255.0 alpha:1] forState:UIControlStateSelected];
        if (i == 0) {
            [btn setSelected:YES];
        }
        btn.tag = 30+i;
        [btn addTarget:self action:@selector(selectThingsLine:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
}
-(void)selectThingsLine:(UIButton *)btn{
    
    for (int i =0; i< 4;i++) {
        UIButton *button = [self viewWithTag:30+i];
        if (button == btn) {
            [button setSelected:YES];
        }
        else{
            [button setSelected:NO];
        }
    }
    
    
    [btn setSelected:YES];
    [UIView animateWithDuration:0.5 animations:^{
        _lineLabel.frame = CGRectMake(5+(10 +(self.frame.size.width - 40) / 4 )* (btn.tag - 30), 38, (self.frame.size.width - 40) / 4, 2);
    }];
    if (_delegate && [_delegate respondsToSelector:@selector(selectNormal:)]) {
        [_delegate selectNormal:btn.tag - 30];
    }
}
-(void)selectNormal:(NSInteger)num{
    
}
@end
