//
//  LSTNetWorkTool.h
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/22.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSTNetWorkTool : NSObject

/** get形式请求网络数据*/
+ (void)getWithUrl:(NSString *)urlStr params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

/** post形式请求网络数据*/
+ (void)postWithUrl:(NSString *)urlStr params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

/** put形式请求网络数据*/
+ (void)putWithUrl:(NSString *)urlStr params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

/** del形式请求网络数据*/
+ (void)delWithUrl:(NSString *)urlStr params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

/** head形式请求网络数据*/
+ (void)headWithUrl:(NSString *)urlStr params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

@end
