//
//  shareView.m
//  LQYG
//
//  Created by issuser on 2016/11/18.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "shareView.h"
#import "WXApi.h"

@implementation shareView
+(shareView *)intanceView{
    return [[[NSBundle mainBundle] loadNibNamed:@"shareView" owner:nil options:nil] lastObject];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (IBAction)wetshare:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"remove" object:nil];
}

- (IBAction)qqshare:(id)sender {
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.text = @"相关内容";
    req.bText = YES;
    req.scene = WXSceneSession;
    [WXApi sendReq:req];
}
@end
