//
//  detailsOneTableViewCell.h
//  LQYG
//
//  Created by issuser on 2016/10/27.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailsOneTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *OneImageView;
@property (weak, nonatomic) IBOutlet UILabel *DeLabel;
@property (weak, nonatomic) IBOutlet UILabel *SLabel;
+(instancetype)xibTableCell;
@end
