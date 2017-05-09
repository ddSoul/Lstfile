//
//  LSTETageLogoffURL.h
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/22.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSTETagStaicString : NSObject

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
UIKIT_EXTERN NSString *const t_orderListUrl;

/** 获取订单详情*/
UIKIT_EXTERN NSString *const orderDetialUrl;

@end



@interface LSTAlertTitle : NSObject

/** 更换标签须知文字*/
UIKIT_EXTERN NSString *const changeLabels_agreeTitle;

/** 注销标签须知文字*/
UIKIT_EXTERN NSString *const offLabels_agreeTitle;

/** 更换车辆信息须知文字*/
UIKIT_EXTERN NSString *const changeCarInfo_agreeTitle;

@end


@interface LSTCellID : NSObject

/** 更换标签cellID*/
UIKIT_EXTERN NSString *const changeLabels_cellID;

/** 注销标签cellID*/
UIKIT_EXTERN NSString *const offLabels_cellID;

/** 注销标签手动输入信息cellID*/
UIKIT_EXTERN NSString *const offLabelsInput_cellID;

/** 标签木块须知文字*/
UIKIT_EXTERN NSString *const labelsAgree_cellID;

@end
