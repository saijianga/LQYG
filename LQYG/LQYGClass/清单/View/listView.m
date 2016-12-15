//
//  listView.m
//  LQYG
//
//  Created by issuser on 2016/11/10.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "listView.h"

@implementation listView
+(listView *)instanceView{
    return [[[NSBundle mainBundle] loadNibNamed:@"listView" owner:nil options:nil] firstObject];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)submitButtonAction:(id)sender {
}
@end
