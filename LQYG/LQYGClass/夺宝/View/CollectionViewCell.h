//
//  CollectionViewCell.h
//  LQYG
//
//  Created by issuser on 2016/10/19.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CollectionAddListDelegate ;


@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *progress;

@property (weak, nonatomic) IBOutlet UIButton *addButton;
- (IBAction)addButtonAction:(id)sender;

@property(nonatomic,strong)NSIndexPath *indexPath;

@property(nonatomic,assign)id<CollectionAddListDelegate>delegate;

@end

@protocol CollectionAddListDelegate <NSObject>

-(void)addShoppingList:(CollectionViewCell *)cell;

@end
