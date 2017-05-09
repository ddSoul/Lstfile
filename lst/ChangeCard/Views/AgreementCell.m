//
//  AgreementCell.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/17.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "AgreementCell.h"
#import "UIButton+Utils.h"

@interface AgreementCell ()
{
    /** 确认按钮*/
    UIButton *_agreeButton;
    /** 文本描述*/
    UILabel *_protoclContenLabel;
}
@end

@implementation AgreementCell

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
    
    _agreeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_agreeButton addTarget:self action:@selector(agreenBtnTap) forControlEvents:UIControlEventTouchUpInside];
    [_agreeButton setBackgroundImage:[UIImage imageNamed:@"shqbk_unchecked"] forState:UIControlStateNormal];
    [_agreeButton setBackgroundImage:[UIImage imageNamed:@"shqbk_checked"] forState:UIControlStateSelected];
    [self.contentView addSubview:_agreeButton];
    
    _protoclContenLabel = [[UILabel alloc] init];
    _protoclContenLabel.font = [UIFont systemFontOfSize:14];
    _protoclContenLabel.numberOfLines = 2;
    [self.contentView addSubview:_protoclContenLabel];
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:@"换卡须知：为保证账户安全，申请速通卡更换后您的速通卡将进入挂失状态"];
    [attrStr addAttribute:NSForegroundColorAttributeName
                    value:[UIColor orangeColor]
                    range:NSMakeRange(0, 5)];
    _protoclContenLabel.attributedText = attrStr;
    
    [self layoutCustomViews];
    [self enlargeEdgeButton];
}

- (void)enlargeEdgeButton
{
    [_agreeButton setEnlargeEdgeWithTop:30 right:50 bottom:30 left:10];
}
/**
 * 布局
 */
- (void)layoutCustomViews
{
    [_agreeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(10);
        make.width.height.mas_equalTo(20);
    }];
    
    [_protoclContenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(_agreeButton.mas_right).mas_offset(10);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(-10);
    }];
}

/**
 * 按钮点击回调
 */
- (void)agreenBtnTap
{
    if (self.agreeTapHandler) {
        self.agreeTapHandler(_agreeButton);
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
