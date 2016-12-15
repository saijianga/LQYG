//
//  AddressAttem.m
//  LQYG
//
//  Created by issuser on 2016/11/9.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "AddressAttem.h"

@implementation AddressAttem
- (instancetype)initWithDict:(NSDictionary *)dict{
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
