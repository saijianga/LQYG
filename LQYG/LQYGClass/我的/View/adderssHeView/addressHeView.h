//
//  addressHeView.h
//  LQYG
//
//  Created by issuser on 2016/11/4.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>





@interface addressHeView : UIView

@property (weak, nonatomic) IBOutlet UITextField *nameTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextFiled;
@property (weak, nonatomic) IBOutlet UIButton *personButton;
- (IBAction)addPersonAction:(id)sender;

+(addressHeView *)instanceView;
@end
