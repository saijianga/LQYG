//
//  FView.h
//  LQYG
//
//  Created by issuser on 2016/10/21.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FView : UIView
@property (weak, nonatomic) IBOutlet UILabel *AllNameLabel;
- (IBAction)AllButtonAction:(id)sender;
+(FView *)instanceView;
@end
