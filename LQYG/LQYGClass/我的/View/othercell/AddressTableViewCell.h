//
//  AddressTableViewCell.h
//  LQYG
//
//  Created by issuser on 2016/11/7.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol addressTableCellDelegate ;



@interface AddressTableViewCell : UITableViewCell<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *addressNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *addressTextFiled;

@property(nonatomic,assign)id<addressTableCellDelegate>delegate;
@end

@protocol addressTableCellDelegate <NSObject>

-(void)clickCellText:(AddressTableViewCell *)cell;

@end
