//
//  TCellView.m
//  LQYG
//
//  Created by issuser on 2016/10/27.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "TCellView.h"

@implementation TCellView
+(TCellView *)instanceTCellView{
    return [[[NSBundle mainBundle] loadNibNamed:@"TCellView" owner:nil options:nil] objectAtIndex:0];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
