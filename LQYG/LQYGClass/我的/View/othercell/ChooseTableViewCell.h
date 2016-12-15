//
//  ChooseTableViewCell.h
//  LQYG
//
//  Created by issuser on 2016/11/9.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressAttem.h"
@interface ChooseTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *selectCityImage;
@property(nonatomic,strong)AddressAttem *attem;
@end
