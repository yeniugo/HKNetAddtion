//
//  HKBaseAFNetwoking.m
//  CommonCryptoDemo
//
//  Created by 胡凯 on 2020/4/18.
//  Copyright © 2020 胡凯. All rights reserved.
//

#import "HKBaseAFNetwoking.h"
#import "AFNetworking.h"
@implementation HKBaseAFNetwoking

+ (void)getCIMSRequestWithUrl:(NSString *)url withParts:(NSDictionary * __nullable)postDic onResultWithDic:(void (^)(NSDictionary * __nullable result))onResult{
    AFHTTPSessionManager *manager  = [AFHTTPSessionManager manager];
    manager.requestSerializer =[AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json",@"text/javascript",nil];
    manager.requestSerializer.timeoutInterval = 30.0f;
    [manager GET:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (onResult) {
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:(NSDictionary *)responseObject];
                int status = [dic[@"status"] intValue];
                int result = (status == 1000 ? 0 : status);
                dic[@"status"] = [NSNumber numberWithInt:result];
                onResult(dic);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        dic[@"status"] = [NSNumber numberWithInt:-5004];
        if (onResult) {
            onResult(dic);
        }
    }];
}

+ (void)getCIMSRequestWithUrl:(NSString *)url withParts:(NSDictionary * __nullable)postDic onResultWithPlist:(void (^)(NSDictionary * __nullable result))onResult{
    AFHTTPSessionManager *manager  = [AFHTTPSessionManager manager];
    manager.requestSerializer =[AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 30.0f;
    [manager GET:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (onResult) {
            if ([responseObject isKindOfClass:[NSData class]]) {
                NSMutableDictionary *result = [NSPropertyListSerialization propertyListWithData:responseObject options:0 format:NULL error:NULL];
                NSMutableDictionary *dic = [NSMutableDictionary dictionary];
                dic[@"status"] = [NSNumber numberWithInt:0];
                dic[@"plist"] = result;
                onResult(dic);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        dic[@"status"] = [NSNumber numberWithInt:0];
        if (onResult) {
            onResult(dic);
        }
    }];
}


+ (void)postCIMSRequestWithUrl:(NSString *)url withParts:(NSDictionary *)postDic onResultWithDic:(void (^)(NSDictionary *result))onResult{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer]; // 上传JSON格式
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//返回格式
    // 超时时间
    manager.requestSerializer.timeoutInterval = 30.0f;
    // 设置接收的Content-Type
    manager.responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"application/xml", @"text/xml",@"text/html", @"application/json",@"text/plain",nil];
    [manager POST:url parameters:postDic headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (onResult) {
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:(NSDictionary *)responseObject];
                int status = [dic[@"status"] intValue];
                int result = (status == 1000 ? 0 : status);
                dic[@"status"] = [NSNumber numberWithInt:result];
                onResult(dic);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        dic[@"status"] = [NSNumber numberWithInt:-5004];
        if (onResult) {
            onResult(dic);
        }
    }];
}


@end
