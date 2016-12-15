//
//  ShowImageViewController.h
//  LQYG
//
//  Created by issuser on 2016/11/9.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowImageViewController : UIViewController
@property(nonatomic,strong)NSArray *imageArr;
@property(nonatomic,assign)BOOL isClick;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UITextView *textView;
@property(nonatomic,strong)UIScrollView *scrol;
@property(nonatomic,strong)UIToolbar *tool;
@end
