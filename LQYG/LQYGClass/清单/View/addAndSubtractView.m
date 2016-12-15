//
//  addAndSubtractView.m
//  LQYG
//
//  Created by issuser on 2016/11/10.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "addAndSubtractView.h"

@implementation addAndSubtractView


-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self createView];
    }
    return self;
}
-(void)createView{
  [[NSBundle mainBundle] loadNibNamed:@"addAndSubtractView" owner:nil options:nil] ;
    [self addSubview:self.view];
    self.view.frame = self.frame;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/




@end
