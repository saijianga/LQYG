//
//  CommentTableViewCell.h
//  LQYG
//
//  Created by issuser on 2016/11/16.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *heImageView;
@property (weak, nonatomic) IBOutlet UILabel *nLabel;
@property (weak, nonatomic) IBOutlet UIImageView *markImageView;
@property (weak, nonatomic) IBOutlet UILabel *TiLabel;
@property (weak, nonatomic) IBOutlet UILabel *MeLabel;

@end
