//
//  NSString+PhoneNumber.h
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/17.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Tools)

/**
 * 格式化电话号码
 *
 * @param phoneNumber 电话号码
 * @return string
 */
+ (NSString *)formatePhoneNumber:(NSString *)phoneNumber;

/**
 * 电话号码加*处理
 *
 * @param phoneNumber 电话号码
 * @return string
 */
+ (NSString *)hiddenPhoneNumber:(NSString *)phoneNumber;

/**
 * 校验电话号码
 *
 * @param phoneNumber 电话号码
 * @return string
 */
+ (BOOL)isVerifyPhoneNumber:(NSString *)phoneNumber;

/**
 * 格式化速通卡号
 *
 * @param phoneNumber 速通卡号
 * @return string
 */
+ (NSString *)formateStNumber:(NSString *)stNumber;

/**
 * 数组判空处理

 @param string 传入的字符串
 @return 返回可用的字符串
 */
+ (NSString *)isNullToString:(id)string;

/**
 * 获取当前时间戳（s）
 *
 * @return 时间戳
 */
+ (NSString *)getNowTimeTimestamp;


/**
 * 校验车牌号
 *
 * @param carNumber 车牌号
 * @return BOOL
 */
+ (BOOL)isVertifyCarNumber:(NSString *)carNumber;

+ (NSString *)getVehicleColorWithType:(NSInteger )type;

@end
