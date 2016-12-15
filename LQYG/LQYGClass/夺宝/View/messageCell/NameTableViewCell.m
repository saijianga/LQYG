//
//  NameTableViewCell.m
//  LQYG
//
//  Created by issuser on 2016/11/16.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "NameTableViewCell.h"

@implementation NameTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _headerImageView.layer.masksToBounds = YES;
    _headerImageView.layer.cornerRadius = 20;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
