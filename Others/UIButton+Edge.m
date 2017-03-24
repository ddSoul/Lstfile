//
//  UIButton+Edge.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/22.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "UIButton+Edge.h"

@implementation UIButton (Edge)

- (void)setImagePosition:(LSTImagePosition)postion spacing:(CGFloat)spacing {
    CGFloat imageWith = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
    CGFloat labelWidth = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}].width;
    CGFloat labelHeight = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}].height;
    
    //image中心移动的x距离
    CGFloat imageOffsetX = labelWidth / 2 ;
    //image中心移动的y距离
    CGFloat imageOffsetY = labelHeight / 2 + spacing / 2;
    //label中心移动的x距离
    CGFloat labelOffsetX = imageWith/2;
    //label中心移动的y距离
    CGFloat labelOffsetY = imageHeight / 2 + spacing / 2;
    
    switch (postion) {
        case LSTImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            break;
            
        case LSTImagePositionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, -(labelWidth + spacing/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageHeight + spacing/2), 0, imageHeight + spacing/2);
            break;
            
        case LSTImagePositionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            break;
            
        case LSTImagePositionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            break;
            
        default:
            break;
    }
    
}


/**根据图文距边框的距离调整图文间距*/
- (void)setImagePosition:(LSTImagePosition)postion WithMargin:(CGFloat )margin{
    CGFloat imageWith = self.imageView.image.size.width;
    CGFloat labelWidth = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}].width;
    CGFloat spacing = self.bounds.size.width - imageWith - labelWidth - 2*margin;
    
    [self setImagePosition:postion spacing:spacing];
}


@end
