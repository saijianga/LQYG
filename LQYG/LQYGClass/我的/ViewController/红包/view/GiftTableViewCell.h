//
//  GiftTableViewCell.h
//  LQYG
//
//  Created by issuser on 2016/11/17.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GiftTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *getButton;
- (IBAction)getGiftAction:(id)sender;

@end
