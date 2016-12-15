//
//  userView.h
//  LQYG
//
//  Created by issuser on 2016/10/27.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface userView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *HeaderImageView;
@property (weak, nonatomic) IBOutlet UILabel *DimageLabel;
@property (weak, nonatomic) IBOutlet UIButton *HButton;
- (IBAction)CheckUserAttion:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *GoNumberLabel;
+(userView *)instanceView;
@end
