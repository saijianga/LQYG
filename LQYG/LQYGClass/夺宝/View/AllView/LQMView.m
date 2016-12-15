//
//  LQMView.m
//  LQYG
//
//  Created by issuser on 2016/10/21.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "LQMView.h"

@implementation LQMView

+(LQMView *)instanceLQView{
    NSArray *nibArr = [[NSBundle mainBundle] loadNibNamed:@"LQMView" owner:nil options:nil];
    return [nibArr objectAtIndex:0];
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
- (IBAction)FButtonAction:(id)sender {
}

- (IBAction)SbuttonAction:(id)sender {
}
- (IBAction)THButtonAction:(id)sender {
}
@end
