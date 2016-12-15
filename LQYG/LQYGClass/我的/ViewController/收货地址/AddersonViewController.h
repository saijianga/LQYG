//
//  AddersonViewController.h
//  LQYG
//
//  Created by issuser on 2016/11/7.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "addressHeView.h"
#import <ContactsUI/ContactsUI.h>
@interface AddersonViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,CNContactPickerDelegate>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)addressHeView *addView;
@end
