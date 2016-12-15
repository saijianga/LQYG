//
//  ChooseTableViewCell.m
//  LQYG
//
//  Created by issuser on 2016/11/9.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "ChooseTableViewCell.h"

@implementation ChooseTableViewCell
-(void)setAttem:(AddressAttem *)attem{
    _attem = attem;
    _cityNameLabel.text = attem.name;
    _cityNameLabel.textColor =attem.isSelected ? [UIColor orangeColor] : [UIColor blackColor];
    _selectCityImage.hidden = !attem.isSelected;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
