//
//  LondingViewController.h
//  LQYG
//
//  Created by issuser on 2016/11/1.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LondingViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberText;
@property (weak, nonatomic) IBOutlet UITextField *passWorldText;
@property (weak, nonatomic) IBOutlet UIButton *loadingButton;
- (IBAction)loadingApp:(id)sender;
- (IBAction)forgetPassWorld:(id)sender;
- (IBAction)resignByPhone:(id)sender;
- (IBAction)loadingByQQ:(id)sender;
- (IBAction)loadingByWetchat:(id)sender;


@end
