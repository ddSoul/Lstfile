//
//  LSTCarInfoCell.h
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/20.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSTCarModel;
@interface LSTCarInfoCell : UITableViewCell

/**
 * 是否被选中
 */
@property (assign, nonatomic, getter=isSelect) BOOL select;


/**
 * 车辆信息Model
 */
@property (nonatomic, strong) LSTCarModel *carModel;

@end
