//
//  LSTLabelsAPI.h
//  DirectorySpecification
//
//  Created by Pactera_Admin on 2017/5/8.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 成功失败处理*/
typedef void(^SuccessHandler) (id result);
typedef void(^FailureHandler) (LSTExceptionType exceptionType,NSDictionary *error);

@interface LSTLabelsAPI : NSObject

#pragma mark - 注销电子标签 API

/**
 * 获取注销电子标签的卡列表
 */
- (void)lst_getOrderListSuccess:(SuccessHandler)success failure:(FailureHandler)failure;

@end
