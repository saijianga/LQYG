//
//  MyCusView.h
//  LQYG
//
//  Created by issuser on 2016/11/2.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "shareBlackView.h"

//@protocol MyViewDelegate;

@interface MyCusView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *checkImageView;
@property (weak, nonatomic) IBOutlet UIImageView *heardImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *userJYLabel;
@property (weak, nonatomic) IBOutlet UILabel *userGetMoLabel;

@property (weak, nonatomic) IBOutlet UILabel *userPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *userCZLabel;
- (IBAction)ChongZhiAction:(id)sender;
- (IBAction)addQQ:(id)sender;
- (IBAction)userShareAction:(id)sender;
- (IBAction)userStardGet:(id)sender;
+(MyCusView *)instanceMyCusView;
- (IBAction)checkMessageAction:(id)sender;
@property(nonatomic,strong)shareBlackView *shareView;

//@property(nonatomic,assign)id<MyViewDelegate>deleage;
@end

