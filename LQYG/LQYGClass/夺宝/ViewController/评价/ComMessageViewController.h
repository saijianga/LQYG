//
//  ComMessageViewController.h
//  LQYG
//
//  Created by issuser on 2016/11/16.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "writeView.h"
@interface ComMessageViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)writeView *writeView;
@end
