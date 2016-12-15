//
//  PodCollectionViewCell.h
//  LQYG
//
//  Created by issuser on 2016/12/8.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PodCollectionViewCellDelegate ;


@interface PodCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *PodImageView;
- (IBAction)deleCollection:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *PodCancelButton;
@property(nonatomic,assign)id<PodCollectionViewCellDelegate>delegate;
@end

@protocol PodCollectionViewCellDelegate <NSObject>

-(void)deleagteCell:(PodCollectionViewCell *)cell;

@end
