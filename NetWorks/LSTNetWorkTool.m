//
//  LSTNetWorkTool.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/22.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTNetWorkTool.h"
#import "AFNetworking.h"

#import "LSTAuthentication.h"
#import "LSTStPrincipal.h"

@implementation LSTNetWorkTool

// get形式请求网络数据
+ (void)getWithUrl:(NSString *)urlStr params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure
{
    /** 读取本地的用户标识信息*/
    LSTAuthentication *auth = [LSTAuthentication authentication];
    LSTStPrincipal *stPrincipal = [auth.stPrincipals firstObject];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:stPrincipal.st forHTTPHeaderField:@"Authorization"];
    manager.requestSerializer.timeoutInterval = 8.0f;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript",@"text/plain", nil];

    [manager GET:urlStr parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        /** 根据后台返回数据格式进行处理*/
        NSInteger errorCode = [responseObject[@"error"][@"errorCode"] integerValue];
        
        if (0 == errorCode) {
            if (success) {
                success(responseObject);
            }
        }else{
            /** 进行一些错误提示*/
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(error);
        }
    }];
    
}

// post形式请求网络数据
+ (void)postWithUrl:(NSString *)urlStr params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 8.0f;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [manager POST:urlStr parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        /** 根据后台返回数据格式进行处理*/
        NSInteger errorCode = [responseObject[@"error"][@"errorCode"] integerValue];
        
        if (0 == errorCode) {
            if (success) {
                success(responseObject);
            }
        }else{
            /** 进行一些错误提示*/
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

// put形式请求网络数据
+ (void)putWithUrl:(NSString *)urlStr params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 8.0f;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [manager PUT:urlStr parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}
// del形式请求网络数据
+ (void)delWithUrl:(NSString *)urlStr params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 8.0f;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [manager DELETE:@"" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            success(responseObject);
        }
                
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
                
        if (failure) {
            failure(error);
        }
    }];
    
}

// head形式请求网络数据
+ (void)headWithUrl:(NSString *)urlStr params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 8.0f;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [manager HEAD:urlStr parameters:params success:^(NSURLSessionDataTask * _Nonnull task) {
        if (success) {
            success(task);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}


@end
