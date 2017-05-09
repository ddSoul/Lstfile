//
//  ETCModel.h
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/17.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ETCModel : NSObject

/**
 * 车牌号
 */
@property (copy, nonatomic) NSString *carNumberString;

/**
 * ETC卡号
 */
@property (copy, nonatomic) NSString *ectNumberString;

@end
