//
//  footerView.h
//  LQYG
//
//  Created by issuser on 2016/11/17.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface footerView : UIView
@property (weak, nonatomic) IBOutlet UIScrollView *footerScrollView;
+(footerView *)inatanceView;
@end
