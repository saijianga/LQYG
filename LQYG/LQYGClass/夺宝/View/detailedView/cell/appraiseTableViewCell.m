//
//  appraiseTableViewCell.m
//  LQYG
//
//  Created by issuser on 2016/10/27.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "appraiseTableViewCell.h"

@implementation appraiseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _appraisImageaView.layer.masksToBounds = YES;
    _appraisImageaView.layer.cornerRadius = 20.f;
    // Initialization code
}
+(appraiseTableViewCell *)instanceAppraiseCell{
    return [[[NSBundle mainBundle] loadNibNamed:@"appraiseTableViewCell" owner:nil options:nil] objectAtIndex:0];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
