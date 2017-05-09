//
//  LSTBottomPayView.h
//  DirectorySpecification
//
//  Created by Pactera_Admin on 2017/4/11.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSTBottomPayView : UIView

/**
 * 需要支付的金额
 */
@property (nonatomic, copy) NSString *moneyString;

/**
 * 提交按钮点击处理
 */
@property (nonatomic, copy) void (^commitHandler)();

@end
