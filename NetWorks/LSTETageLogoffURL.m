//
//  LSTETageLogoffURL.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/22.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTETageLogoffURL.h"

@implementation LSTETageLogoffURL

NSString *const serverUrl = @"http://202.106.235.45:8080/";

NSString *const serverUrl172 = @"http://172.16.6.91:8080/etc-card/service/";

/** 获取订单列表*/
NSString *const orderListUrl = @"etc-rest/service/v4/orders";

/** 获取注销电子标签的速通卡列表Url*/
NSString *const stCarLabelListUrl = @"v4/offLabel/getCardLabelList";

/** 发送验证码*/
NSString *const senderAuthCodeUrl = @"v1/verifycode/send";

/** 校验验证码*/
NSString *const verfityAuthCodeUrl = @"v3/shortmessage/valid";

/** 手动输入信息提交*/
NSString *const validateWriteMessageUrl = @"v4/offLabel/validateWriteMessage";

/** 获取此业务生成的订单号*/
NSString *const getOrderNumberUrl = @"v3/order/order_no";

/** 提交此业务订单*/
NSString *const commitOrderUrl = @"/v4/offLabel/submitOffLabelOrder";

/** 获取订单列表，测试使用*/
NSString *const c_orderListUrl = @"v4/orders";

/** 获取订单详情*/
NSString *const orderDetialUrl = @"v4/order";

@end
