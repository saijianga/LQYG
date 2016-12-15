//
//  PersonTableViewCell.m
//  LQYG
//
//  Created by issuser on 2016/11/3.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "PersonTableViewCell.h"

@implementation PersonTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _PersonImageView.clipsToBounds = YES;
    _PersonImageView.layer.cornerRadius = 25;
   
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
