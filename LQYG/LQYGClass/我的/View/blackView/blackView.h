//
//  blackView.h
//  LQYG
//
//  Created by issuser on 2016/11/4.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface blackView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong)UIPickerView *pickView;
@end
