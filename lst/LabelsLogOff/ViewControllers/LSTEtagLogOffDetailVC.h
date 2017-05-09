//
//  LSTLabelsLogOffDetailVC.h
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/20.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSTCarModel.h"
#import "LSTEtagOrderModel.h"

@interface LSTEtagLogOffDetailVC : UIViewController

/**
 * 卡信息Model
 */
@property (nonatomic, strong) LSTCarModel *model;

/**
 * 订单Model
 */
@property (nonatomic, strong) LSTEtagOrderModel *orderModel;

@end
