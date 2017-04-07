//
//  LSTETageLogoffURL.h
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/22.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSTETageLogoffURL : NSObject

/** 服务器地址*/
UIKIT_EXTERN NSString *const serverUrl;
UIKIT_EXTERN NSString *const serverUrl172;

/** 获取订单列表*/
UIKIT_EXTERN NSString *const orderListUrl;

/** 获取注销电子标签的速通卡列表Url*/
UIKIT_EXTERN NSString *const stCarLabelListUrl;

/** 发送验证码*/
UIKIT_EXTERN NSString *const senderAuthCodeUrl;

/** 校验验证码*/
UIKIT_EXTERN NSString *const verfityAuthCodeUrl;

/** 手动输入信息提交*/
UIKIT_EXTERN NSString *const validateWriteMessageUrl;

/** 获取此业务生成的订单号*/
UIKIT_EXTERN NSString *const getOrderNumberUrl;

/** 提交此业务订单*/
UIKIT_EXTERN NSString *const commitOrderUrl;

/** 获取订单列表测试使用*/
UIKIT_EXTERN NSString *const c_orderListUrl;

/** 获取订单详情*/
UIKIT_EXTERN NSString *const orderDetialUrl;

@end
