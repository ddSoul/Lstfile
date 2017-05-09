//
//  LSTNetWorkYTKTool.h
//  DirectorySpecification
//
//  Created by Pactera_Admin on 2017/5/2.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTNetwrokApi.h"

@interface LSTNetWorkYTKTool : LSTNetwrokApi


/**
 * lst_ get请求
 *
 * @param url url
 * @param parameters 参数
 * @param complete 完成回调
 */
- (void)lst_getRequestServiceWithUrl:(NSString *)url parameters:(NSDictionary *)parameters complete:(void (^)(BOOL, NSDictionary *))complete;

/**
 * lst_ post请求
 *
 * @param url url
 * @param parameters 参数
 * @param complete 完成回调
 */
- (void)lst_postRequestServiceWithUrl:(NSString *)url parameters:(NSDictionary *)parameters complete:(void (^)(BOOL, NSDictionary *))complete;

/**
 * lst_ put请求
 *
 * @param url url
 * @param parameters 参数
 * @param complete 完成回调
 */
- (void)lst_putRequestServiceWithUrl:(NSString *)url parameters:(NSDictionary *)parameters complete:(void (^)(BOOL, NSDictionary *))complete;

/**
 * lst_ del请求
 *
 * @param url url
 * @param parameters 参数
 * @param complete 完成回调
 */
- (void)lst_delRequestServiceWithUrl:(NSString *)url parameters:(NSDictionary *)parameters complete:(void (^)(BOOL, NSDictionary *))complete;

/**
 * lst_ head请求
 *
 * @param url url
 * @param parameters 参数
 * @param complete 完成回调
 */
- (void)lst_headRequestServiceWithUrl:(NSString *)url parameters:(NSDictionary *)parameters complete:(void (^)(BOOL, NSDictionary *))complete;

@end
