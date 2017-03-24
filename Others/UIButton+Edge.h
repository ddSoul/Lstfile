//
//  UIButton+Edge.h
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/22.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LSTImagePosition) {
    LSTImagePositionLeft     = 0,            //图片在左，文字在右，默认
    LSTImagePositionRight    = 1,            //图片在右，文字在左
    LSTImagePositionTop      = 2,            //图片在上，文字在下
    LSTImagePositionBottom   = 3,            //图片在下，文字在上
};

@interface UIButton (Edge)

/**
 *  利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 *  注意：这个方法需要在设置图片和文字之后才可以调用，且button的大小要大于 图片大小+文字大小+spacing
 *
 *  @param spacing 图片和文字的间隔
 */
- (void)setImagePosition:(LSTImagePosition)postion spacing:(CGFloat)spacing;

/**
 *  利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 *  注意：这个方法需要在设置图片和文字之后才可以调用，且button的大小要大于 图片大小+文字大小+spacing
 *
 *  @param margin 图片、文字离button边框的距离
 */
- (void)setImagePosition:(LSTImagePosition)postion WithMargin:(CGFloat )margin;

@end
