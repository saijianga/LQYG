//
//  CollectionViewCell.m
//  LQYG
//
//  Created by issuser on 2016/10/19.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _addButton.layer.cornerRadius = 4.0f;
    _addButton.layer.borderWidth = 1.f;
    _addButton.layer.borderColor = [UIColor colorWithRed:203/255.0 green:255/255.0 blue:160/255.0 alpha:1].CGColor;
    // Initialization code
}

- (IBAction)addButtonAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(addShoppingList:)]) {
        
        [_delegate addShoppingList:self];
    }
}
-(void)addShoppingList:(CollectionViewCell *)cell{
    
}
@end
