//
//  userView.m
//  LQYG
//
//  Created by issuser on 2016/10/27.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "userView.h"

@implementation userView
+(userView *)instanceView{
    return [[[NSBundle mainBundle] loadNibNamed:@"userView" owner:nil options:nil] objectAtIndex:0];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)CheckUserAttion:(id)sender {
    NSLog(@"人员信息");
    UIButton *btn = (UIButton *)sender;
    NSString *str = [NSString stringWithFormat:@"%@",btn.titleLabel.text];
    NSDictionary *dic = @{@"user":str};
    NSLog(@"%@",btn.titleLabel.text);

    [[NSNotificationCenter defaultCenter] postNotificationName:@"userMessage" object:self userInfo:dic];
   
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
