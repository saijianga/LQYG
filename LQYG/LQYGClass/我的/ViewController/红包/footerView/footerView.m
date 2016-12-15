//
//  footerView.m
//  LQYG
//
//  Created by issuser on 2016/11/17.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "footerView.h"

@implementation footerView
+(footerView *)inatanceView{
    return [[[NSBundle mainBundle] loadNibNamed:@"footerView" owner:self options:nil] lastObject];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
