//
//  LSTAuthCodeVC.h
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/17.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSTCarModel.h"
#import "LSTEtagOrderModel.h"


@interface LSTAuthCodeVC : UIViewController

/**
 * 方便后面提交订单业务的处理
 */
@property (nonatomic, strong) LSTEtagOrderModel *orderModel;

/**
 * 卡信息Model,订单提交必要参数
 */
@property (nonatomic, strong) LSTCarModel *carModel;

/**
 * 短信类型
 */

@end
