//
//  FindTableViewCell.m
//  LQYG
//
//  Created by issuser on 2016/10/31.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "FindTableViewCell.h"

@implementation FindTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _FindHotLabel.layer.cornerRadius = 5;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
