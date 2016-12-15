//
//  CustomCollectionViewCell.h
//  LQYG
//
//  Created by issuser on 2016/11/1.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *NImageView;
@property (weak, nonatomic) IBOutlet UILabel *NNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *NQiLabel;
@property (weak, nonatomic) IBOutlet UILabel *NLuckLabel;
@property (weak, nonatomic) IBOutlet UILabel *NLuckNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *NCanLabel;
@property (weak, nonatomic) IBOutlet UILabel *NCanNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *NJLabel;
@property (weak, nonatomic) IBOutlet UILabel *NJTimerLabel;
@property (weak, nonatomic) IBOutlet UILabel *NGLabel;
@property (weak, nonatomic) IBOutlet UILabel *NGDLabel;

@end
