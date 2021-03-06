//
//  PutInfoCell.h
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/17.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PutInfoCell : UITableViewCell

/**
 * select按钮点击回调
 */
@property (copy, nonatomic) void (^selectButtonTapHandler)(UIButton *selectButton);

@end
