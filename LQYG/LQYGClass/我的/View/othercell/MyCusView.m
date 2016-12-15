//
//  MyCusView.m
//  LQYG
//
//  Created by issuser on 2016/11/2.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "MyCusView.h"

@implementation MyCusView
-(void)dealloc{
    NSLog(@"移除通知");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(MyCusView *)instanceMyCusView{
    
    return [[[NSBundle mainBundle] loadNibNamed:@"MyCusView" owner:nil options:nil] objectAtIndex:0];
}

- (IBAction)checkMessageAction:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PersonControl" object:nil];
}
- (IBAction)ChongZhiAction:(id)sender {
}

- (IBAction)addQQ:(id)sender {
}

- (IBAction)userShareAction:(id)sender {

    _shareView = [[shareBlackView alloc] init];
    
   

}

- (IBAction)userStardGet:(id)sender {
}




@end
