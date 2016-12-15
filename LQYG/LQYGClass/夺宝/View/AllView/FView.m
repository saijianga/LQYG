//
//  FView.m
//  LQYG
//
//  Created by issuser on 2016/10/21.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "FView.h"

@implementation FView
+(FView *)instanceView{
    NSArray *Farr = [[NSBundle mainBundle] loadNibNamed:@"FView" owner:nil options:nil];
    return [Farr objectAtIndex:0];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)AllButtonAction:(id)sender {
}
@end
