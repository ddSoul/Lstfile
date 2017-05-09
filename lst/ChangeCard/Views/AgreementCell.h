//
//  AgreementCell.h
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/17.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AgreementCell : UITableViewCell

/**
 * 同意按钮点击处理
 */
@property (copy, nonatomic) void (^agreeTapHandler)(UIButton *agreeButton);

@end
