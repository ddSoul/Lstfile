//
//  LSTNetWorkYTKTool.m
//  DirectorySpecification
//
//  Created by Pactera_Admin on 2017/5/2.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTNetWorkYTKTool.h"
#import "LSTServiceManager.h"
#import "LSTApplyCardApi.h"

@interface LSTNetWorkYTKTool ()

@property (nonatomic, strong) LSTApplyCardApi *applyCardApi;

@end

@implementation LSTNetWorkYTKTool

/** 可所有请求方式放在一个方法内，多个参数 */


/**
 * lst_ get请求
 *
 * @param url url
 * @param parameters 参数
 * @param complete 完成回调
 */
- (void)lst_getRequestServiceWithUrl:(NSString *)url parameters:(NSDictionary *)parameters complete:(void (^)(BOOL, NSDictionary *))complete
{
    self.requestUrl = url;
    self.requestMethod = YTKRequestMethodGet;
    self.requestArgument = parameters;
    
    [self addAccessory:[LSTAnimatingRequestAccessory accessoryWithAnimatingView:nil animatingText:nil]];
    
    __weak typeof(self) weakSelf = self;
    [self startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
//        NSLog(@"___%@",request.responseJSONObject);
        [LSTServiceManager requestAPi:weakSelf response:request.responseJSONObject completeBlock:complete];
    } failure:^(YTKBaseRequest *request) {
//        NSLog(@"____%@",request.responseJSONObject);
    }];

}

/**
 * lst_ post请求
 *
 * @param url url
 * @param parameters 参数
 * @param complete 完成回调
 */
- (void)lst_postRequestServiceWithUrl:(NSString *)url parameters:(NSDictionary *)parameters complete:(void (^)(BOOL, NSDictionary *))complete
{
    self.requestUrl = url;
    self.requestMethod = YTKRequestMethodGet;
    self.requestArgument = parameters;
    
    [self addAccessory:[LSTAnimatingRequestAccessory accessoryWithAnimatingView:nil animatingText:nil]];
    
    __weak typeof(self) weakSelf = self;
    [self startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        NSLog(@"___%@",request.responseJSONObject);
        [LSTServiceManager requestAPi:weakSelf response:request.responseJSONObject completeBlock:complete];
    } failure:^(YTKBaseRequest *request) {
        NSLog(@"____%@",request.responseJSONObject);
    }];

};

/**
 * lst_ put请求
 *
 * @param url url
 * @param parameters 参数
 * @param complete 完成回调
 */
- (void)lst_putRequestServiceWithUrl:(NSString *)url parameters:(NSDictionary *)parameters complete:(void (^)(BOOL, NSDictionary *))complete
{
    self.requestUrl = url;
    self.requestMethod = YTKRequestMethodPost;
    self.requestArgument = parameters;
    
    [self addAccessory:[LSTAnimatingRequestAccessory accessoryWithAnimatingView:nil animatingText:nil]];
    
    __weak typeof(self) weakSelf = self;
    [self startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        NSLog(@"___%@",request.responseJSONObject);
        [LSTServiceManager requestAPi:weakSelf response:request.responseJSONObject completeBlock:complete];
    } failure:^(YTKBaseRequest *request) {
        NSLog(@"____%@",request.responseJSONObject);
    }];

};

/**
 * lst_ del请求
 *
 * @param url url
 * @param parameters 参数
 * @param complete 完成回调
 */
- (void)lst_delRequestServiceWithUrl:(NSString *)url parameters:(NSDictionary *)parameters complete:(void (^)(BOOL, NSDictionary *))complete
{
    self.requestUrl = url;
    self.requestMethod = YTKRequestMethodPut;
    self.requestArgument = parameters;
    
    [self addAccessory:[LSTAnimatingRequestAccessory accessoryWithAnimatingView:nil animatingText:nil]];
    
    __weak typeof(self) weakSelf = self;
    [self startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        NSLog(@"___%@",request.responseJSONObject);
        [LSTServiceManager requestAPi:weakSelf response:request.responseJSONObject completeBlock:complete];
    } failure:^(YTKBaseRequest *request) {
        NSLog(@"____%@",request.responseJSONObject);
    }];

};

/**
 * lst_ head请求
 *
 * @param url url
 * @param parameters 参数
 * @param complete 完成回调
 */
- (void)lst_headRequestServiceWithUrl:(NSString *)url parameters:(NSDictionary *)parameters complete:(void (^)(BOOL, NSDictionary *))complete
{
    self.requestUrl = url;
    self.requestMethod = YTKRequestMethodHead;
    self.requestArgument = parameters;
    
    [self addAccessory:[LSTAnimatingRequestAccessory accessoryWithAnimatingView:nil animatingText:nil]];
    
    __weak typeof(self) weakSelf = self;
    [self startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        NSLog(@"___%@",request.responseJSONObject);
        [LSTServiceManager requestAPi:weakSelf response:request.responseJSONObject completeBlock:complete];
    } failure:^(YTKBaseRequest *request) {
        NSLog(@"____%@",request.responseJSONObject);
    }];

};


@end
