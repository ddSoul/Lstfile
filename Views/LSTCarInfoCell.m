
//
//  LSTCarInfoCell.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/20.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTCarInfoCell.h"

@interface LSTCarInfoCell ()
{
    /** 提示Label*/
    UILabel *_carNumberHintLabel;
    UILabel *_carColorHintLabel;
    UILabel *_stCarNumberHintLabel;
    UILabel *_telHintLabel;
    
    /** 显示Label*/
    UILabel *_carNumberLabel;
    UILabel *_carColorLabel;
    UILabel *_stCarNumberLabel;
    UILabel *_telLabel;
    
    UIImageView *_selectImageView;
    
    /** 美工线*/
    UIView *_1pLineView;
    UIView *_20pLineView;
    UIView *_bottomLineView;
}
@end

@implementation LSTCarInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createControls];
    }
    return self;
}
/**
 *  创建控件
 */
- (void)createControls
{
    _carNumberHintLabel = [[UILabel alloc] init];
    _carNumberHintLabel.font = [UIFont systemFontOfSize:14];
    _carNumberHintLabel.text = @"车  牌  号:";
    [self.contentView addSubview:_carNumberHintLabel];
    
    _carColorHintLabel = [[UILabel alloc] init];
    _carColorHintLabel.font = [UIFont systemFontOfSize:14];
    _carColorHintLabel.text = @"车牌颜色:";
    [self.contentView addSubview:_carColorHintLabel];
    
    _stCarNumberHintLabel = [[UILabel alloc] init];
    _stCarNumberHintLabel.font = [UIFont systemFontOfSize:14];
    _stCarNumberHintLabel.text = @"速通卡号:";
    [self.contentView addSubview:_stCarNumberHintLabel];
    
    _telHintLabel = [[UILabel alloc] init];
    _telHintLabel.font = [UIFont systemFontOfSize:14];
    _telHintLabel.text = @"手机号码:";
    [self.contentView addSubview:_telHintLabel];
    
    _carNumberLabel = [[UILabel alloc] init];
    _carNumberLabel.font = [UIFont systemFontOfSize:14];
    _carNumberLabel.textColor = LSTBlack24FontColor;
    _carNumberLabel.text = @"京A88888";
    [self.contentView addSubview:_carNumberLabel];
    
    _carColorLabel = [[UILabel alloc] init];
    _carColorLabel.font = [UIFont systemFontOfSize:14];
    _carColorLabel.text = @"彩色";
    _carColorLabel.textColor = LSTBlack24FontColor;
    [self.contentView addSubview:_carColorLabel];
    
    _stCarNumberLabel = [[UILabel alloc] init];
    _stCarNumberLabel.font = [UIFont systemFontOfSize:14];
    _stCarNumberLabel.text = @"6666666666666666";
    _stCarNumberLabel.textColor = LSTBlack24FontColor;
    [self.contentView addSubview:_stCarNumberLabel];
    
    _telLabel = [[UILabel alloc] init];
    _telLabel.font = [UIFont systemFontOfSize:14];
    _telLabel.text = @"18888999999";
    _telLabel.textColor = LSTBlack24FontColor;
    [self.contentView addSubview:_telLabel];
    
    _selectImageView = [[UIImageView alloc] init];
    _selectImageView.image = [UIImage imageNamed:@"shqbk_unchecked"];
    [self.contentView addSubview:_selectImageView];
    
    _1pLineView = [[UIView alloc] init];
    _1pLineView.backgroundColor = LSTLine1Color;
    [self.contentView addSubview:_1pLineView];
    
    _20pLineView = [[UIView alloc] init];
    _20pLineView.backgroundColor = LSTLineWColor;
    [self.contentView addSubview:_20pLineView];
    
    _bottomLineView = [[UIView alloc] init];
    _bottomLineView.backgroundColor = LSTLine1Color;
    [self.contentView addSubview:_bottomLineView];
    
    [self layoutCustomViews];
    
}
- (void)layoutCustomViews
{
    __weak typeof(self) weakSelf = self;
    
    [_20pLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(20);
    }];
    
    [_1pLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(_20pLineView.mas_bottom).mas_offset(0);
        make.height.mas_equalTo(1);
    }];
    
    [_carNumberHintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(_1pLineView.mas_bottom).mas_equalTo(10);
    }];
    
    [_carColorHintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(_carNumberHintLabel.mas_bottom).mas_offset(10);
    }];
    
    [_stCarNumberHintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(_carColorHintLabel.mas_bottom).mas_offset(10);
    }];
    
    [_telHintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(_stCarNumberHintLabel.mas_bottom).mas_equalTo(10);
    }];
    
    [_carNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_carNumberHintLabel.mas_right).mas_offset(10);
        make.top.mas_equalTo(_1pLineView.mas_bottom).mas_offset(10);
    }];
    
    [_carColorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_carColorHintLabel.mas_right).mas_offset(10);
        make.top.mas_equalTo(_carNumberLabel.mas_bottom).mas_offset(10);
    }];
    
    [_stCarNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_stCarNumberHintLabel.mas_right).mas_offset(10);
        make.top.mas_equalTo(_carColorLabel.mas_bottom).mas_offset(10);
    }];
    
    [_telLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_telHintLabel.mas_right).mas_offset(10);
        make.top.mas_equalTo(_stCarNumberLabel.mas_bottom).mas_offset(10);
    }];
    
    [_selectImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-30);
        make.width.height.mas_equalTo(20);
        make.centerY.mas_equalTo(weakSelf).mas_offset(10);
    }];
    
    [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(_telHintLabel.mas_bottom).mas_offset(10);
    }];
    
}

- (void)setSelect:(BOOL)select
{
    if (select) {
        _selectImageView.image = [UIImage imageNamed:@"shqbk_checked"];
    }else{
        _selectImageView.image = [UIImage imageNamed:@"shqbk_unchecked"];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
