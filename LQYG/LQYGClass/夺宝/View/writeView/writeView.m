//
//  writeView.m
//  LQYG
//
//  Created by issuser on 2016/11/16.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "writeView.h"

@implementation writeView
+(instancetype)intanceWriteView{
    return [[[NSBundle mainBundle] loadNibNamed:@"writeView" owner:nil options:nil] lastObject];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
