//
//  listView.h
//  LQYG
//
//  Created by issuser on 2016/11/10.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface listView : UIView
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
- (IBAction)submitButtonAction:(id)sender;
+(listView *)instanceView;
@end
