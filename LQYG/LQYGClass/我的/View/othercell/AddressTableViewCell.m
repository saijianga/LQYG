//
//  AddressTableViewCell.m
//  LQYG
//
//  Created by issuser on 2016/11/7.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "AddressTableViewCell.h"

@implementation AddressTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _addressTextFiled.delegate = self;
  
    // Initialization code
}
//-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
//    NSLog(@"点击");
//    
////    if (_delegate && [_delegate respondsToSelector:@selector(clickCellText:)]) {
////        [_delegate clickCellText:self];
////    }
//    return YES;
//}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"开始点击");
   
    if (_delegate && [_delegate respondsToSelector:@selector(clickCellText:)]) {
                [_delegate clickCellText:self];
            }
}
-(void)clickCellText:(AddressTableViewCell *)cell{
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
