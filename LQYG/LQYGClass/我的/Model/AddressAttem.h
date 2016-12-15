//
//  AddressAttem.h
//  LQYG
//
//  Created by issuser on 2016/11/9.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressAttem : NSObject
@property (nonatomic,copy) NSString * code;
@property (nonatomic,copy) NSString * sheng;
@property (nonatomic,copy) NSString * di;
@property (nonatomic,copy) NSString * xian;
@property (nonatomic,copy) NSString * name;
@property (nonatomic,copy) NSString * level;
@property (nonatomic,assign) BOOL  isSelected;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
