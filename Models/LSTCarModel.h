//
//  LSTCarModel.h
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/22.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VehicleInfo;
@interface LSTCarModel : NSObject

/**
 * ID
 */
@property (nonatomic, copy) NSString *id;
/**
 * 手机号
 */
@property (nonatomic, copy) NSString *phone;
/**
 * 速通卡号
 */
@property (nonatomic, copy) NSString *cardNo;
/**
 * 标签号
 */
@property (nonatomic, copy) NSString *labelNo;
/**
 * vehicleInfo
 */
@property (nonatomic, strong) VehicleInfo *vehicleInfo;


@end

/** 
 *  多种写法，
 *  也可在.m利用.方法找到对应的模型属性
 */

/**-------------------------------------------------------------VehicleInfoModel--------------------------------------------------------------*/

@class VehicleLicense;
@interface VehicleInfo : NSObject

/**
 * vehicleLicense
 */
@property (nonatomic, strong) VehicleLicense *vehicleLicense;

/**
 * 车牌颜色
 */
@property (nonatomic, copy) NSString *vehicleColor;

@end


/**-------------------------------------------------------------VehicleLicenseModel--------------------------------------------------------------*/

@interface VehicleLicense : NSObject

/**
 * 车牌号
 */
@property (nonatomic, copy) NSString *licensePlateNumber;

@end
