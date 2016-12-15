//
//  LQMView.h
//  LQYG
//
//  Created by issuser on 2016/10/21.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LQCustonButton.h"
@interface LQMView : UIView
@property (weak, nonatomic) IBOutlet UILabel *NewLabel;
- (IBAction)AllButtonAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *AllButton;
@property (weak, nonatomic) IBOutlet LQCustonButton *FButton;
- (IBAction)FButtonAction:(id)sender;
@property (weak, nonatomic) IBOutlet LQCustonButton *Sbutton;
- (IBAction)SbuttonAction:(id)sender;
@property (weak, nonatomic) IBOutlet LQCustonButton *THButton;
- (IBAction)THButtonAction:(id)sender;
+(LQMView *)instanceLQView;

@end
