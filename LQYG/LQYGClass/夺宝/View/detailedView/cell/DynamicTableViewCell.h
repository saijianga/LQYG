//
//  DynamicTableViewCell.h
//  LQYG
//
//  Created by issuser on 2016/10/28.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DynamicTableViewCellDelegate;



@interface DynamicTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *DImageView;
@property (weak, nonatomic) IBOutlet UILabel *ZLabel;
@property (weak, nonatomic) IBOutlet UILabel *TLabel;
@property (weak, nonatomic) IBOutlet UILabel *SLabel;
@property (weak, nonatomic) IBOutlet UILabel *NLabel;
@property (weak, nonatomic) IBOutlet UILabel *QLabel;
//@property (weak, nonatomic) IBOutlet UILabel *KBLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *ScrollView;

@property (weak, nonatomic) IBOutlet UILabel *NewCreateLabel;
@property(nonatomic,assign)id<DynamicTableViewCellDelegate>delegate;
-(void)setScrollViewPage:(NSArray *)imageArr;
@end

@protocol DynamicTableViewCellDelegate <NSObject>

-(void)showImage;

@end
