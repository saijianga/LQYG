//
//  ISoFTStoneView.h
//  LQYG
//
//  Created by issuser on 2016/11/30.
//  Copyright © 2016年 JS. All rights reserved.
//

typedef enum {
    LogoAdType = 0,///带logo的广告
    FullScreenAdType = 1,///全屏的广告
}AdType;


#import <UIKit/UIKit.h>

@interface ISoFTStoneView : UIView
@property(nonatomic,strong)NSString *urlStr;
@property(nonatomic,strong)NSString *localStr;
@property(nonatomic,strong)UIButton *skinButton;
@property(nonatomic,strong)UIImageView *adverImageView;
- (instancetype)initWithWindow:(UIWindow *)window adType:(AdType)adType;
@end
