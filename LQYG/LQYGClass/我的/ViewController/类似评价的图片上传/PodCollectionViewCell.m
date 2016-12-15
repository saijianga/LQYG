//
//  PodCollectionViewCell.m
//  LQYG
//
//  Created by issuser on 2016/12/8.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "PodCollectionViewCell.h"

@implementation PodCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)deleCollection:(id)sender {
    if (self.delegate && [_delegate respondsToSelector:@selector(deleagteCell:)]) {
        [_delegate deleagteCell:self];
    }
}
@end
