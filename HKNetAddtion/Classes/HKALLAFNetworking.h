//
//  HKALLAFNetworking.h
//  CommonCryptoDemo
//
//  Created by 胡凯 on 2020/4/18.
//  Copyright © 2020 胡凯. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

static NSString *urlstr_ = @"";

@protocol HKALLAFNetworkingDelegate <NSObject>

@optional
- (void)netResponseWithResult:(NSDictionary *)dic withURL:(NSString *)url withExtraMessage:(NSDictionary *)extraDic;
@end



@interface HKALLAFNetworking : NSObject

@property (nonatomic,weak) id<HKALLAFNetworkingDelegate> delegate;

///  get 并返回字典，通过代理接收
/// @param url url请求地址
/// @param para 请求额外参数
/// @param extraDic 额外参数，方便做请求区分的
- (void)getURL:(NSString *)url withPara:(NSDictionary *__nullable)para withExtraMessage:(NSDictionary *__nullable)extraDic;


///  get并返回字典，block返回
/// @param url url请求地址
/// @param para 请求参数
/// @param onResult 结果，字典返回
+ (void)getURL:(NSString *)url withPara:(NSDictionary *__nullable)para Result:(void (^)(NSDictionary *resultDic))onResult;

///  get 并返回字典
/// @param url url请求地址
/// @param para 请求额外参数
/// @param extraDic 额外参数，方便做请求区分的
- (void)getPlistURL:(NSString *)url withPara:(NSDictionary *__nullable)para withExtraMessage:(NSDictionary *__nullable)extraDic;


/// get并返回
/// @param url url请求参数
/// @param para 请求参数
/// @param onResult 结果，字典返回
+ (void)getPlistURL:(NSString *)url withPara:(NSDictionary *__nullable)para Result:(void (^)(NSDictionary *resultDic))onResult;

///  post 并返回字典
/// @param url url请求地址
/// @param para 请求额外参数
/// @param extraDic 额外参数，方便做请求区分的
- (void)postURL:(NSString *)url withPara:(NSDictionary *__nullable)para withExtraMessage:(NSDictionary *__nullable)extraDic;


/// post并返回字典
/// @param url url请求地址
/// @param para 请求参数
/// @param onResult 结果，字典返回
+ (void)postURL:(NSString *)url withPara:(NSDictionary *__nullable)para Result:(void (^)(NSDictionary *resultDic))onResult;

@end

NS_ASSUME_NONNULL_END
