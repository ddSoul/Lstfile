//
//  LSTEtagOrderModel.h
//  DirectorySpecification
//
//  Created by Pactera_Admin on 2017/3/29.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSTEtagOrderModel : NSObject

/**
 * 订单创建时间
 */
@property (nonatomic, copy) NSString *createTime;

/**
 * 订单号
 */
@property (nonatomic, copy) NSString *orderNo;

@end
