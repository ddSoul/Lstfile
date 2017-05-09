//
//  LSTAgreeCell.h
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/20.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LSTAgreeCell : UITableViewCell

/**
 * 同意按钮点击处理
 */
@property (copy, nonatomic) void (^agreeTapHandler)(UIButton *agreeButton);
/**
 * 下一步点击处理
 */
//@property (copy, nonatomic) void (^nextStepTapHandler)(UIButton *agreeButton);


/**
 * cell类型
 */
@property (nonatomic, assign) LSTSpecialBussibeType type;

@end
