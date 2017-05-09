//
//  LSTListTitleCell.h
//  DirectorySpecification
//
//  Created by Pactera_Admin on 2017/4/10.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSTCarModel;
@interface LSTListTitleCell : UITableViewCell

/**
 * 是否被选中
 */
@property (assign, nonatomic, getter=isSelect) BOOL select;

/**
 * 赋值
 */
- (void)congigRightLabelsTitleWithModel:(LSTCarModel *)model type:(LSTSpecialBussibeType)type;

@end
