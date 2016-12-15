//
//  otherUserView.m
//  LQYG
//
//  Created by issuser on 2016/11/21.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "otherUserView.h"

@implementation otherUserView
+(otherUserView *)instanceView{

    return [[[NSBundle mainBundle] loadNibNamed:@"otherUserView" owner:nil options:nil] lastObject];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
