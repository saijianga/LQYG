//
//  subAddView.m
//  LQYG
//
//  Created by issuser on 2016/11/15.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "subAddView.h"

@implementation subAddView
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        UIView *containerView = [[[UINib nibWithNibName:@"subAddView" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        CGRect newFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        containerView.frame = newFrame;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor colorWithRed:217 / 255.0 green:217 / 255.0 blue:217 / 255.0 alpha:1].CGColor;
        self.layer.cornerRadius = 5.0f;
       
        [self addSubview:containerView];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)subAction:(id)sender {
     UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [window endEditing:YES];
   int number = [_numberTextFiled.text intValue];
    if (number > 1) {
        number --;
        _numberTextFiled.text = [NSString stringWithFormat:@"%d",number];
    }
    else{

        [[SwitchController sharedSVC] showMessage:@"至少购入1件" inView:window];
    }
}

- (IBAction)addAction:(id)sender {
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [window endEditing:YES];
    int number = [_numberTextFiled.text intValue];
    number++;
    _numberTextFiled.text = [NSString stringWithFormat:@"%d",number];
}

@end
