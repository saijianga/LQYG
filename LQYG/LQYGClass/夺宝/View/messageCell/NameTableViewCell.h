//
//  NameTableViewCell.h
//  LQYG
//
//  Created by issuser on 2016/11/16.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NameTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *rankImageView;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

@end
