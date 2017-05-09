//
//  LSTLabelsOfNetCell.m
//  DirectorySpecification
//
//  Created by Pactera_Admin on 2017/4/11.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTLabelsOfNetCell.h"

@implementation LSTLabelsOfNetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.backgroundColor = LSTGlobalBgColor;
}

@end
