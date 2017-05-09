//
//  LSTActionSheet.h
//  TTTTT
//
//  Created by Pactera_Admin on 2017/4/10.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSTActionSheet : UIView


/**
 * 点击SheetCell 回调
 */
@property (nonatomic,copy) void (^ClickIndex) (NSInteger index);


/**
 * 初始化方法
 *
 * @param titleArr 数组
 * @return SheetViews
 */
- (instancetype)initWithTitleArray:(NSArray *)titleArr;


@end
