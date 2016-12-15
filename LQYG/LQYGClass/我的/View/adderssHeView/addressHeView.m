//
//  addressHeView.m
//  LQYG
//
//  Created by issuser on 2016/11/4.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "addressHeView.h"

@implementation addressHeView
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
+(addressHeView *)instanceView{
    return [[[NSBundle mainBundle] loadNibNamed:@"addressHeView" owner:nil options:nil] firstObject];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)addPersonAction:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"address" object:nil];
    
}

@end
