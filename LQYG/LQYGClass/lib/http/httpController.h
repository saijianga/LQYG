//
//  httpController.h
//  ZHYL
//
//  Created by issuser on 16/10/13.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface httpController : NSObject
+ (void)requestWithPath:(NSString *)path WithJson:(NSDictionary *)parameters block:(void(^)(id JSON, NSError *error))block;

+ (void)imageRequestWithURL:(NSString *)path WithJson:(NSDictionary *)parameters formDate:(void(^)(id< AFMultipartFormData> formData))formDa  block:(void(^)(id JSON, NSError *error))block;

+ (void)getRequestWithURL:(NSString *)url block:(void(^)(id JSON,NSError *error))block;
@end
