//
//  ETCCradCell.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/17.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "ETCCradCell.h"

@interface ETCCradCell ()
{
    /** 背景图*/
    UIImageView *_backgroundImageView;
    /** 车牌号*/
    UILabel *_carNumberLabel;
    /** etc卡号*/
    UILabel *_etcNumberLabel;
    /** secletcImage*/
    UIImageView *_selectImageView;
}
@end

@implementation ETCCradCell

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
    
    _backgroundImageView = [[UIImageView alloc] init];
    _backgroundImageView.image = [UIImage imageNamed:@"shqbk_button4"];
    [self.contentView addSubview:_backgroundImageView];
    
    _carNumberLabel = [[UILabel alloc] init];
    _carNumberLabel.font = [UIFont systemFontOfSize:14];
    _carNumberLabel.text = @"京A88888";
    [self.contentView addSubview:_carNumberLabel];
    
    _etcNumberLabel = [[UILabel alloc] init];
    _etcNumberLabel.font = [UIFont systemFontOfSize:14];
    _etcNumberLabel.text = @"123 123 123";
    [self.contentView addSubview:_etcNumberLabel];
    
    _selectImageView = [[UIImageView alloc] init];
    _selectImageView.image = [UIImage imageNamed:@"shqbk_checked"];
    [self.contentView addSubview:_selectImageView];
    
    [self layoutCustomViews];
}

/**
 * 布局
 */
- (void)layoutCustomViews
{
    [_backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(10);
        make.height.mas_equalTo(60);
        make.bottom.right.mas_equalTo(-10);
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
