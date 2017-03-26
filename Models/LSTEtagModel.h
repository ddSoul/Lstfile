//
//  LSTEtagModel.h
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/21.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSTEtagModel : NSObject

/**
 * 电子标签号
 */
@property (nonatomic, copy) NSString *eTagNumber;

/**
 * 车牌号
 */
@property (nonatomic, copy) NSString *carNumber;

/**
 * 车牌颜色
 */
@property (nonatomic, copy) NSString *carColor;

/**
 * 速通卡号
 */
@property (nonatomic, copy) NSString *stCarNumber;

/**
 * 手机号
 */
@property (nonatomic, copy) NSString *phoneNumber;

@end
