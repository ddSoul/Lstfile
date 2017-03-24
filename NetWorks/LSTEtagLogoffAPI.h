//
//  LSTEtagLogoffAPI.h
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/22.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 成功失败处理*/
typedef void(^successHandler) (id result);
typedef void(^failureHandler) (NSError *error);

@interface LSTEtagLogoffAPI : NSObject

/** 获取满足注销电子标签的卡片信息列表*/
+ (void)getStCardInfoListSuccess:(successHandler)success failure:(failureHandler)failure;

@end
