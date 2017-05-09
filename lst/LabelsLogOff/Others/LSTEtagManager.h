//
//  LSTEtagManager.h
//  DirectorySpecification
//
//  Created by Pactera_Admin on 2017/4/10.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSTEtagManager : NSObject


/**
 * 得到标签管理模块单利对象
 *
 * 可能后面有需要用到
 */
+ (instancetype)shareLSTEtagManager;

/**
 * 特殊业务模块操作类型
 */
@property (nonatomic, assign) NSInteger handleType;

@end
