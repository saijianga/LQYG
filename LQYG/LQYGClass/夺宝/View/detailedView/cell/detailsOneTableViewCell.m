//
//  detailsOneTableViewCell.m
//  LQYG
//
//  Created by issuser on 2016/10/27.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "detailsOneTableViewCell.h"

@implementation detailsOneTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _OneImageView.layer.masksToBounds = YES;
    _OneImageView.layer.cornerRadius = 25;
    // Initialization code
}
+(instancetype)xibTableCell{
    return [[[NSBundle mainBundle] loadNibNamed:@"detailsOneTableViewCell" owner:nil options:nil] objectAtIndex:0];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
