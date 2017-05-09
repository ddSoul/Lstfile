//
//  UITextField+Space.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/17.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "UITextField+Space.h"

@implementation UITextField (Space)

- (void)setLeftDistance:(CGFloat)distance
{
    CGRect frame = [self frame];
    frame.size.width = distance;
    UIView *leftview = [[UIView alloc] initWithFrame:frame];
    self.leftViewMode = UITextFieldViewModeAlways;
    self.leftView = leftview;
}

@end
