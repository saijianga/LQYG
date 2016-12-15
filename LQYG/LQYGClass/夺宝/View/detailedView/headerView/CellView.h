//
//  CellView.h
//  LQYG
//
//  Created by issuser on 2016/10/27.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellView : UIView
@property (weak, nonatomic) IBOutlet UIScrollView *GScrollView;
@property (weak, nonatomic) IBOutlet UILabel *GNameLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *HProgressView;

@property (weak, nonatomic) IBOutlet UILabel *HNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *HQNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *HCLabel;
@property (weak, nonatomic) IBOutlet UILabel *HLastLabel;
@property (weak, nonatomic) IBOutlet UILabel *HWaringLabel;
+(CellView *)instanceView;
@end
