//
//  otherUserView.h
//  LQYG
//
//  Created by issuser on 2016/11/21.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface otherUserView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *userHeaderImage;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userIDLabel;
+(otherUserView *)instanceView;
@end
