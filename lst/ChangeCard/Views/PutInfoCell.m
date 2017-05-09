//
//  PutInfoCell.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/17.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "PutInfoCell.h"

@interface PutInfoCell ()
{
    /** 业务类型显示*/
    UILabel *_breakTypeLabel;
    /** 左边的图*/
    UIImageView *_leftImageView;
    /** 右边的单选按钮*/
    UIButton *_selectButton;
}
@end

@implementation PutInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self createControls];
    }
    return self;
}
/**
 *  创建控件
 */
- (void)createControls
{
    _leftImageView = [[UIImageView alloc] init];
    _leftImageView.image = [UIImage imageNamed:@"chenlian"];
    [self.contentView addSubview:_leftImageView];
    
    _breakTypeLabel = [[UILabel alloc] init];
    _breakTypeLabel.text = @"?人为损坏的么？？";
    _breakTypeLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_breakTypeLabel];
    
    _selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_selectButton setBackgroundImage:[UIImage imageNamed:@"shqbk_unchecked"] forState:UIControlStateNormal];
    [_selectButton setBackgroundImage:[UIImage imageNamed:@"shqbk_checked"] forState:UIControlStateSelected];
    [_selectButton addTarget:self action:@selector(selectTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_selectButton];
    
    [self layoutCustomViews];
}

/**
 * 布局
 */
- (void)layoutCustomViews
{
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
        make.height.width.mas_equalTo(30);
    }];
    
    [_breakTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_leftImageView.mas_right).mas_offset(10);
        make.top.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
    }];
    
    [_selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(10);
        make.width.height.mas_equalTo(30);
    }];
}

/**
 * 点击回调
 */
- (void)selectTap:(UIButton *)button
{
    if (self.selectButtonTapHandler) {
        self.selectButtonTapHandler(button);
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
