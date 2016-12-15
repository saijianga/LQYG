//
//  ListTableViewCell.h
//  LQYG
//
//  Created by issuser on 2016/11/10.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "addAndSubtractView.h"

#import "subAddView.h"
@interface ListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *ListImageView;
@property (weak, nonatomic) IBOutlet UILabel *ListNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ListNumberLabel;

@property (strong, nonatomic) IBOutlet subAddView *subView;

//@property (weak, nonatomic) IBOutlet CeView *numberAddOrSub;


- (IBAction)deleButtonAction:(id)sender;
- (IBAction)getAllButtonAction:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *addPersonLabel;
@end
