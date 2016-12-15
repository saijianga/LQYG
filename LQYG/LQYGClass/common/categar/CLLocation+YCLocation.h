//
//  CLLocation+YCLocation.h
//  地图
//
//  Created by issuser on 16/2/23.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLLocation (YCLocation)
//从地图坐标转化到火星坐标
- (CLLocation*)locationMarsFromEarth;
@end
