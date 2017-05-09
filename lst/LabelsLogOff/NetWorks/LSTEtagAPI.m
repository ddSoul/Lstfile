//
//  LSTEtagAPI.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/22.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTEtagAPI.h"
#import "LSTNetWorkTool.h"
#import "LSTETagStaicString.h"

#import "LSTAuthentication.h"
#import "LSTStPrincipal.h"
#import "MJExtension.h"

#import "LSTVertifyCodeViewController.h"
#import "LSTCarModel.h"
#import "NSString+Tools.h"
#import "LSTCarModel.h"
#import "LSTEtagOrderModel.h"

@implementation LSTEtagAPI

/**
 * 获取发送验证码所需要的paasWordToken
 */
+ (void)getPassWordTokenWithPhoneNumber:(NSString *)phoneNumber success:(successHandler)success failure:(failureHandler)failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@v1/accounts/%@/passwordToken",ETC_BASE_API1,[phoneNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
    [LSTNetWorkTool getWithUrl:urlString params:nil success:^(id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

/** 获取短信验证码*/
+ (void)getAuthCodeWithPassWordToken:(NSString *)passwordToken success:(successHandler)success failure:(failureHandler)failure
{
    NSDictionary *parameters = @{
                                 @"businessType":[NSNumber numberWithInteger:LSTVertifyTypeForgetPassword],
                                 @"city_type":@"1",
                                 @"passwordToken":passwordToken
                                 };
    NSString *urlString = [NSString stringWithFormat:@"%@%@",ETC_BASE_API1,senderAuthCodeUrl];
    [LSTNetWorkTool getWithUrl:urlString params:parameters success:^(id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

/** 校验短信验证码的正确性*/
+ (void)vertifyAuthCodeWithCode:(NSString *)authCode pwdtoken:(NSString *)pwdToken success:(successHandler)success failure:(failureHandler)failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/v1/verifycode/verify",ETC_BASE_API1];
    
    NSDictionary *parmeters = @{
                                @"passwordToken":pwdToken,
                                @"verifyCode":authCode,
                                @"businessType":[NSNumber numberWithInteger:LSTVertifyTypeForgetPassword]
                                };

    
    [LSTNetWorkTool getWithUrl:urlString params:parmeters success:^(id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

/** 获取可办理电子标签注销业务的列表*/
+ (void)getOffEtagCardListSuccess:(successHandler)success failure:(failureHandler)failure
{
    
    LSTAuthentication *auth = [LSTAuthentication authentication];
    NSString *userId = auth.tgtPrincipal.principal.attributes.gid;
    
    LSTStPrincipal *stPrincipal = [auth.stPrincipals firstObject];
    
    NSDictionary *params = @{
                             @"Gid":@"ad2e1e40-f7a4-4a31-92f3-2185d22d1ca3"
                             };
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@",serverUrl172,stCarLabelListUrl];
    [LSTNetWorkTool getWithUrl:urlString params:nil success:^(id responseObject) {
        if (success) {
            
            //将Json转成Model返回
            NSArray *tempArray = responseObject[@"data"];
            NSMutableArray *modelArray = @[].mutableCopy;

            for (NSDictionary *value in tempArray) {
                LSTCarModel *lstCardModel =
                    [LSTCarModel mj_objectWithKeyValues:value];
                [modelArray addObject:lstCardModel];
            }

            success(modelArray);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];

}

/** 校验手动输入信息*/
+ (void)verfityEtagCardWithPhoneNo:(NSString *)phoneNo lincensePlateNumber:(NSString *)licensePlateNumber vehicleColor:(NSInteger )vehicleColor success:(successHandler)success failure:(failureHandler)failure
{
    
    NSDictionary *parameters = @{
                                 @"phone":phoneNo,
                                 @"licensePlateNumber":licensePlateNumber,
                                 @"vehicleColor":[NSString getVehicleColorWithType:vehicleColor]
                                 };

    NSString *urlString = [NSString stringWithFormat:@"%@%@",serverUrl172,validateWriteMessageUrl];
    [LSTNetWorkTool postWithUrl:urlString params:parameters success:^(id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }

    }];
}

/** 获取标签注销业务的订单号*/
+ (void)getOrderNumberSuccess:(successHandler)success failure:(failureHandler)failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@",serverUrl172,getOrderNumberUrl];
    NSDictionary *parameters = @{
                                 @"orderType":@"OFF_LABEL"
                                 };
    [LSTNetWorkTool getWithUrl:urlString params:parameters success:^(id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
        
    }];

}

/** 提交订单*/
+ (void)postOrderWithOrder:(LSTEtagOrderModel *)order carModel:(LSTCarModel *)carModel success:(successHandler)success failure:(failureHandler)failure{
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@",serverUrl172,commitOrderUrl];

    LSTAuthentication *auth = [LSTAuthentication authentication];
    NSString *gid = auth.tgtPrincipal.principal.attributes.gid;
    /** MJ_Model->Dic,AFN限制参数*/
    NSDictionary *vehicleInfoDic = carModel.vehicleInfo.mj_keyValues;
    NSDictionary *parameters = @{
                                 @"phone":carModel.phone,
                                 @"labelNo":carModel.labelNo,
                                 @"cardNo":carModel.cardNo,
                                 @"vehicleInfo":vehicleInfoDic,
                                 @"orderNo":order.orderNo,
                                 @"gid":@"ad2e1e40-f7a4-4a31-92f3-2185d22d1ca3",
                                 @"createTime":order.createTime,
                                 @"userType":@"1",
                                 @"orderType":@"OFF_LABEL"
                                 };
    
    [LSTNetWorkTool postWithUrl:urlString params:parameters success:^(id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
        
    }];

}

/** 修改注销电子标签业务订单状态*/
+ (void)alterOrderStatusWithOderNo:(NSString *)orderNo success:(successHandler)success failure:(failureHandler)failure
{
    NSString *tempUrl = [NSString stringWithFormat:@"v3/order/%@/cancelOff",orderNo];
    NSString *urlString = [NSString stringWithFormat:@"%@%@",serverUrl172,tempUrl];
    
    NSDictionary *parameters = @{
                                 @"orderNo":orderNo,
                                 @"type":@"cancelOff"
                                 };
    
    [LSTNetWorkTool putWithUrl:urlString params:parameters success:^(id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
        
    }];

}

/** 提价注销申请到后台*/
+ (void)commitEtagLogOffApplyWithOrderNo:(NSString *)orderNo carModel:(LSTCarModel *)carModel success:(successHandler)success failure:(failureHandler)failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@",serverUrl172,@"v4/offLabel/submitOffLabelApply"];
    
    NSDictionary *parameters = @{
                                 @"labelNo":carModel.labelNo,
                                 @"phone":carModel.phone,
                                 @"licensePlateNumber":carModel.vehicleInfo.vehicleLicense.licensePlateNumber,
                                 @"vehicleColor":carModel.vehicleInfo.vehicleColor,
                                 @"orderNo":orderNo
                                 };

    
    [LSTNetWorkTool postWithUrl:urlString params:parameters success:^(id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
        
    }];
}

/**
 * 获取订单列表
 */
+ (void)getOrderListSuccess:(successHandler)success failure:(failureHandler)failure
{
    
    NSDictionary *params = @{
                             @"userId":@"ad2e1e40-f7a4-4a31-92f3-2185d22d1ca3"
                             };
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@",@"https://www.bjetc.cn/etc-rest/service/",t_orderListUrl];
    [LSTNetWorkTool getWithUrl:urlString params:params success:^(id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}


/**
 * 获取订单详情
 */
+ (void)getOrderDetailWithOrderNo:(NSString *)orderNo success:(successHandler)success failure:(failureHandler)failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@v4/order/%@",serverUrl172,[LSTHelper encryptUseDES:orderNo andKey:KEY andIv:Iv]];
    [LSTNetWorkTool getWithUrl:urlString params:nil success:^(id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)getCounpSuccess:(successHandler)success failure:(failureHandler)failure
{
    NSString *urlString = [NSString stringWithFormat:@"http://202.106.235.45:8080/etc-rest/service/v3/coupon/searchByStatus"];
    
    LSTAuthentication *auth = [LSTAuthentication authentication];
    NSString *userId = auth.tgtPrincipal.principal.attributes.gid;
    
    NSDictionary *dic = @{
                          @"userId": userId,
                          @"status": @"0"

                          };
    [LSTNetWorkTool getWithUrl:urlString params:dic success:^(id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
