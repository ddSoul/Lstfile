//
//  LSTETageLogoffURL.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/22.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTETagStaicString.h"

@implementation LSTETagStaicString

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
NSString *const t_orderListUrl = @"v4/orders";

/** 获取订单详情*/
NSString *const orderDetialUrl = @"v4/order";

@end


/*   -----------------------------------  **/
@implementation LSTAlertTitle

/** 更换标签须知文字*/
NSString *const changeLabels_agreeTitle = @"须知：电子标签非人为损坏质保期内，提交订单审核通过后，携带车辆所有人行驶证原件预约服务网点优先办理。\n选择上门安装提交订单待标签寄回后，5个工作日之内完成更换，由专业的安装团队上门安装激活。";

/** 注销标签须知文字*/
NSString *const offLabels_agreeTitle = @"须知：电子标签注销后无法恢复使用，银行联名速通卡须先前往银行销卡后方能办理电子标签注销业务";

/** 更换车辆信息须知文字*/
NSString *const changeCarInfo_agreeTitle = @"须知：变更车辆所有人须与原开户人一致，提交订单审核通过后，可预约服务网点优先办理。";

@end



/*   -----------------------------------  **/
@implementation LSTCellID

/** 更换标签cellID*/
NSString *const changeLabels_cellID = @"changeLabels";

/** 注销标签cellID*/
NSString *const offLabels_cellID = @"offLabels";

/** 标签木块须知文字*/
NSString *const labelsAgree_cellID = @"labelsAgree";

/** 注销标签手动输入信息cellID*/
NSString *const offLabelsInput_cellID = @"offLabelsInput";

@end
