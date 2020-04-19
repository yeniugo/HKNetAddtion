//
//  HKBaseAFNetwoking.h
//  CommonCryptoDemo
//
//  Created by 胡凯 on 2020/4/18.
//  Copyright © 2020 胡凯. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HKBaseAFNetwoking : NSObject

+ (void)getCIMSRequestWithUrl:(NSString *)url withParts:(NSDictionary * __nullable)postDic onResultWithDic:(void (^)(NSDictionary * __nullable result))onResult;

+ (void)getCIMSRequestWithUrl:(NSString *)url withParts:(NSDictionary * __nullable)postDic onResultWithPlist:(void (^)(NSDictionary * __nullable result))onResult;

+ (void)postCIMSRequestWithUrl:(NSString *)url withParts:(NSDictionary *)postDic onResultWithDic:(void (^)(NSDictionary * __nullable result))onResult;
@end

NS_ASSUME_NONNULL_END
