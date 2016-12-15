//
//  PersonViewController.h
//  LQYG
//
//  Created by issuser on 2016/11/3.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonTableViewCell.h"
#import "PeTableViewCell.h"
#import "blackView.h"
#import "NameViewController.h"
@interface PersonViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)NSArray *arr;
@end
