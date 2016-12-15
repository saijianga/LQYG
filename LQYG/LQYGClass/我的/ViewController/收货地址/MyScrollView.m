//
//  MyScrollView.m
//  LQYG
//
//  Created by issuser on 2016/11/11.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "MyScrollView.h"

@implementation MyScrollView
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    if (gestureRecognizer.state != 0) {
        return YES;
    }
    else
        return NO;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
