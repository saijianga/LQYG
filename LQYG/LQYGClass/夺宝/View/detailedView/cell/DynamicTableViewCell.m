//
//  DynamicTableViewCell.m
//  LQYG
//
//  Created by issuser on 2016/10/28.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "DynamicTableViewCell.h"

@implementation DynamicTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
_NewCreateLabel.numberOfLines = 0;
}
#pragma mark 设置滚动视图
-(void)setScrollViewPage:(NSArray *)imageArr{
    _ScrollView.contentSize = CGSizeMake(10+(80 + 20) * imageArr.count, 60);
    for (int i=0; i<imageArr.count; i++) {
        
//        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10+(80 + 20) * i, 10, 80, 80)];
//        imageView.image = [UIImage imageNamed:imageArr[i]];
//        [_ScrollView addSubview:imageView];
//        
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageAction:)];
//        tap.numberOfTouchesRequired = 1;
//        
//        [imageView addGestureRecognizer:tap];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(10+(80 + 20) * i, 10, 80, 80);
        btn.backgroundColor = [UIColor redColor];
        [_ScrollView addSubview:btn];
        [btn addTarget:self action:@selector(hah:) forControlEvents:UIControlEventTouchUpInside];
        [btn setBackgroundImage:[UIImage imageNamed:imageArr[i]] forState:UIControlStateNormal];
    }
}
-(void)hah:(UIButton *)btn{
    if (_delegate && [_delegate respondsToSelector:@selector(showImage)]) {
        [_delegate showImage];
    }
}
-(void)tapImageAction:(UITapGestureRecognizer *)tap{
    NSLog(@"点击%ld",tap.view.tag);
    NSLog(@"点击");
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
