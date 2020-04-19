//
//  HKALLAFNetworking.m
//  CommonCryptoDemo
//
//  Created by 胡凯 on 2020/4/18.
//  Copyright © 2020 胡凯. All rights reserved.
//

#import "HKALLAFNetworking.h"
#import "HKBaseAFNetwoking.h"
@implementation HKALLAFNetworking

- (void)getURL:(NSString *)url withPara:(NSDictionary *__nullable)para withExtraMessage:(NSDictionary *__nullable)extraDic{
    __weak typeof(self) weakself = self;
    [HKBaseAFNetwoking getCIMSRequestWithUrl:url withParts:para onResultWithDic:^(NSDictionary * _Nonnull result) {
        __strong typeof(self) strongself = weakself;
        if ([strongself.delegate respondsToSelector:@selector(netResponseWithResult:withURL:withExtraMessage:)]) {
            [strongself.delegate netResponseWithResult:result withURL:url withExtraMessage:extraDic];
        }
    }];
}

+ (void)getURL:(NSString *)url withPara:(NSDictionary *__nullable)para Result:(void (^)(NSDictionary *resultDic))onResult{
    [HKBaseAFNetwoking getCIMSRequestWithUrl:url withParts:para onResultWithDic:^(NSDictionary * _Nonnull result) {
        if (onResult) {
            onResult(result);
        }
    }];
}

- (void)getPlistURL:(NSString *)url withPara:(NSDictionary *__nullable)para withExtraMessage:(NSDictionary *__nullable)extraDic{
    __weak typeof(self) weakself = self;
    [HKBaseAFNetwoking getCIMSRequestWithUrl:url withParts:para onResultWithPlist:^(NSDictionary * _Nonnull result) {
        __strong typeof(self) strongself = weakself;
        if ([strongself.delegate respondsToSelector:@selector(netResponseWithResult:withURL:withExtraMessage:)]) {
            [strongself.delegate netResponseWithResult:result withURL:url withExtraMessage:extraDic];
        }
    }];
}

+ (void)getPlistURL:(NSString *)url withPara:(NSDictionary *__nullable)para Result:(void (^)(NSDictionary * _Nonnull))onResult{
    [HKBaseAFNetwoking getCIMSRequestWithUrl:url withParts:para onResultWithPlist:^(NSDictionary * _Nonnull result) {
        if (onResult) {
            onResult(result);
        }
    }];
}
- (void)postURL:(NSString *)url withPara:(NSDictionary *__nullable)para withExtraMessage:(NSDictionary *__nullable)extraDic{
    __weak typeof(self) weakself = self;
    [HKBaseAFNetwoking postCIMSRequestWithUrl:url withParts:para onResultWithDic:^(NSDictionary * _Nonnull result) {
        __strong typeof(self) strongself = weakself;
        if ([strongself.delegate respondsToSelector:@selector(netResponseWithResult:withURL:withExtraMessage:)]) {
            [strongself.delegate netResponseWithResult:result withURL:url withExtraMessage:extraDic];
        }
    }];
}

+ (void)postURL:(NSString *)url withPara:(NSDictionary *__nullable)para Result:(void (^)(NSDictionary * resultDic))onResult{
//    __weak typeof(self) weakself = self;
    [HKBaseAFNetwoking postCIMSRequestWithUrl:url withParts:para onResultWithDic:^(NSDictionary * _Nonnull result) {
//        __strong typeof(self) strongself = weakself;
        if (onResult) {
            onResult(result);
        }
    }];
}

@end
