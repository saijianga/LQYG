//
//  GiftTableViewCell.m
//  LQYG
//
//  Created by issuser on 2016/11/17.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "GiftTableViewCell.h"

@implementation GiftTableViewCell
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    _getButton.layer.cornerRadius = 5.0f;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)getGiftAction:(id)sender {
    NSLog(@"开始夺宝");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"getshop" object:nil];
}
@end
