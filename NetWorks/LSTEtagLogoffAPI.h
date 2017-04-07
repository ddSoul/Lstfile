//
//  LSTEtagLogoffAPI.h
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/22.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSTCarModel;
@class LSTEtagOrderModel;

/** 成功失败处理*/
typedef void(^successHandler) (id result);
typedef void(^failureHandler) (NSError *error);


@interface LSTEtagLogoffAPI : NSObject

/**
 * 获取发送验证码所需要的paasWordToken
 */
+ (void)getPassWordTokenWithPhoneNumber:(NSString *)phoneNumber success:(successHandler)success failure:(failureHandler)failure;

/**
 * 获取短信验证码
 */
+ (void)getAuthCodeWithPassWordToken:(NSString *)passwordToken success:(successHandler)success failure:(failureHandler)failure;

/**
 * 校验短信验证码
 */
+ (void)vertifyAuthCodeWithCode:(NSString *)authCode pwdtoken:(NSString *)pwdToken success:(successHandler)success failure:(failureHandler)failure;


/**
 * 获取注销电子标签的卡列表
 */
+ (void)getOffEtagCardListSuccess:(successHandler)success failure:(failureHandler)failure;


/**
 * 手动输入卡信息校验下一步操作
 */
+ (void)verfityEtagCardWithPhoneNo:(NSString *)phoneNo lincensePlateNumber:(NSString *)licensePlateNumber vehicleColor:(NSInteger)vehicleColor success:(successHandler)success failure:(failureHandler)failure;


/**
 * 获取电子标签注销业务的订单号
 */
+ (void)getOrderNumberSuccess:(successHandler)success failure:(failureHandler)failure;


/**
 * 提交注销标签业务订单
 */
+ (void)postOrderWithOrder:(LSTEtagOrderModel *)order carModel:(LSTCarModel *)carModel success:(successHandler)success failure:(failureHandler)failure;

/**
 * 修改注销电子标签业务订单状态
 */
+ (void)alterOrderStatusWithOderNo:(NSString *)orderNo success:(successHandler)success failure:(failureHandler)failure;

/**
 * 提交注销申请到后台
 */
+ (void)commitEtagLogOffApplyWithOrderNo:(NSString *)orderNo carModel:(LSTCarModel *)carModel success:(successHandler)success failure:(failureHandler)failure;

/**
 * 获取订单列表
 *
 */
+ (void)getOrderListSuccess:(successHandler)success failure:(failureHandler)failure;

/**
 * 获取订单详情
 *
 */
+ (void)getOrderDetailWithOrderNo:(NSString *)orderNo success:(successHandler)success failure:(failureHandler)failure;

@end
