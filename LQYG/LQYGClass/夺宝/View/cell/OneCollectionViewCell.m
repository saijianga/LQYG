//
//  OneCollectionViewCell.m
//  LQYG
//
//  Created by issuser on 2016/10/24.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "OneCollectionViewCell.h"

@implementation OneCollectionViewCell
-(instancetype)init{
    if (self = [super init]) {
        _advertisementScr = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 150)];
        _prizeScr = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_advertisementScr.frame), self.frame.size.width, 40)];
        _announceView = [FView instanceView];
        _announceView.frame = CGRectMake(0, CGRectGetMaxY(_prizeScr.frame), self.frame.size.width, 100);
        _recommendView = [FView instanceView];
        _recommendView.frame = CGRectMake(0, CGRectGetMaxY(_recommendView.frame)+20, self.frame.size.width, 100);
        [self.contentView addSubview:_advertisementScr];
        [self.contentView addSubview:_prizeScr];
        [self.contentView addSubview:_announceView];
        [self.contentView addSubview:_recommendView];
        _advertisementScr.backgroundColor = [UIColor orangeColor];
    }
    return self;
}
#pragma mark 广告视图
-(void)advertismentScrollver{
    
}
@end
