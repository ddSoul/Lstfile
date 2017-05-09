//
//  LSTOtherCardCell.h
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/20.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSTOtherCardCell : UITableViewCell

/**
 * 是否被选中
 */
@property (assign, nonatomic, getter=isSelect) BOOL select;
/**
 * 是否展开视图
 */
@property (assign, nonatomic, getter=isExpand) BOOL expand;

/**
 * 选择颜色按钮点击回调处理
 */
@property (copy, nonatomic) void (^chooseColorButtonTapHandler)(UIButton *button);

/**
 * 输入框击回调处理
 */
@property (copy, nonatomic) void (^textFiledEndEidtHandler)(NSString *cardNumber, NSString *phoneNumber);

@end
