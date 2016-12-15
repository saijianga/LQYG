//
//  httpController.m
//  ZHYL
//
//  Created by issuser on 16/10/13.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "httpController.h"

@implementation httpController
+ (void)requestWithPath:(NSString *)path WithJson:(NSDictionary *)parameters block:(void(^)(id JSON, NSError *error))block{
    
    // 检测网络连接状态
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    // 连接状态回调处理
    /* AFNetworking的Block内使用self须改为weakSelf, 避免循环强引用, 无法释放 */
    //    __weak typeof(self) weakSelf = self;
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status)
     {
         /*
          AFNetworkReachabilityStatusUnknown	未知
          AFNetworkReachabilityStatusNotReachable	无网络连接
          AFNetworkReachabilityStatusReachableViaWWAN	手机自带网络
          AFNetworkReachabilityStatusReachableViaWiFi	WIFI
          */
         if (status == AFNetworkReachabilityStatusNotReachable) {
             [[SwitchController sharedSVC] showMessage:@"请检查网络" duration:1];
             return;
         }
     }];
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //设置请求头
    /*
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    [manager.requestSerializer setValue:[userDefault valueForKey:userID] forHTTPHeaderField:@"uid"];
    NSString *identifierForVendor = [[UIDevice currentDevice].identifierForVendor UUIDString];
    [manager.requestSerializer setValue:identifierForVendor forHTTPHeaderField:@"token"];
    */
    //    [SVProgressHUD showWithStatus:@"请稍后..."];
  
    manager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    
    manager.requestSerializer.timeoutInterval = 20.f;
    NSLog(@"path == %@",path);
    [manager POST:[NSString stringWithFormat:@"%@",path] parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        if (block) {
            block(dict,nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (block) {
            block(nil,error);
        }
    }];
    
}

+ (void)imageRequestWithURL:(NSString *)path WithJson:(NSDictionary *)parameters formDate:(void(^)(id< AFMultipartFormData> formData))formDa  block:(void(^)(id JSON, NSError *error))block{
    
    // 检测网络连接状态
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status)
     {
         if (status == AFNetworkReachabilityStatusNotReachable) {
              [[SwitchController sharedSVC] showMessage:@"请检查网络" duration:1];
             return;
         }
     }];
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //设置请求头
    /*
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [manager.requestSerializer setValue:[userDefault valueForKey:userID] forHTTPHeaderField:@"uid"];
    NSString *identifierForVendor = [[UIDevice currentDevice].identifierForVendor UUIDString];
    [manager.requestSerializer setValue:identifierForVendor forHTTPHeaderField:@"token"];
    */
   
    
    manager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    manager.requestSerializer.timeoutInterval = 100.f;
    
    [manager POST:[NSString stringWithFormat:@"%@",path] parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (formDa) {
            formDa(formData);
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //        [SVProgressHUD dismiss];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        if (block) {
            block(dict,nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //        [SVProgressHUD dismiss];
        if (block) {
            block(nil,error);
        }
    }];
    
}

+ (void)getRequestWithURL:(NSString *)url block:(void(^)(id JSON,NSError *error))block{
    
    
    // 检测网络连接状态
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    // 连接状态回调处理
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status)
     {
         if (status == AFNetworkReachabilityStatusNotReachable) {
              [[SwitchController sharedSVC] showMessage:@"请检查网络" duration:1];
             return;
         }
         
     }];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 20.f;
    //    [manager.requestSerializer setValue:@"application" forHTTPHeaderField:@"Content"];
    //设置请求头
    /*
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [manager.requestSerializer setValue:[userDefault valueForKey:userID] forHTTPHeaderField:@"uid"];
    NSString *identifierForVendor = [[UIDevice currentDevice].identifierForVendor UUIDString];
    [manager.requestSerializer setValue:identifierForVendor forHTTPHeaderField:@"token"];
    */
    [manager GET:[NSString stringWithFormat:@"%@",url] parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        if (block) {
            block(dict,nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        if (block) {
            block(nil,error);
        }
        
    }];
   
}

@end
