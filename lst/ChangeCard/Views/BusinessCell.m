//
//  BusinessCell.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/17.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "BusinessCell.h"

@interface BusinessCell ()
{
    /** 业务类型显示*/
    UILabel *_businessTypeLabel;
    /** 左边的图*/
    UIImageView *_leftImageView;
    /** 右边的图*/
    UIImageView *_rightImageView;
}
@end

@implementation BusinessCell

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
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _leftImageView = [[UIImageView alloc] init];
    _leftImageView.image = [UIImage imageNamed:@"chenlian"];
    [self.contentView addSubview:_leftImageView];
    
    _businessTypeLabel = [[UILabel alloc] init];
    _businessTypeLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_businessTypeLabel];
    
    _rightImageView = [[UIImageView alloc] init];
    _rightImageView.image = [UIImage imageNamed:@"you1"];
    [self.contentView addSubview:_rightImageView];
    
    [self layoutCustomViews];
    
}

/**
 * 使用MAS布局
 */
- (void)layoutCustomViews
{
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
        make.height.width.mas_equalTo(30);
    }];
    
    [_businessTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_leftImageView.mas_right).mas_offset(10);
        make.top.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
    }];
    
    [_rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(10);
        make.width.height.mas_equalTo(30);
    }];
}


/**
 * label赋值
 *
 */
- (void)setBusinessTypeString:(NSString *)businessTypeString
{
    _businessTypeLabel.text = businessTypeString;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
