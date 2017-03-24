//
//  LSTAgreeCell.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/20.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTAgreeCell.h"

#import "UIButton+Utils.h"

@interface LSTAgreeCell ()
{
    /** 确认按钮*/
    UIButton *_agreeButton;
    /** 文本描述*/
    UILabel *_protoclContenLabel;
    /** 下一步按钮*/
    UIButton *_nextStepButton;
}
@end

@implementation LSTAgreeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.backgroundColor = LSTVCBackgroundColor;
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
    _agreeButton.selected = YES;
    [self.contentView addSubview:_agreeButton];
    
    _protoclContenLabel               = [[UILabel alloc] init];
    _protoclContenLabel.font          = [UIFont systemFontOfSize:13];
    _protoclContenLabel.numberOfLines = 0;
    _protoclContenLabel.textColor     = LSTBlack24FontColor;
    [self.contentView addSubview:_protoclContenLabel];
    
    _nextStepButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_nextStepButton setTitle:@"下一步" forState:UIControlStateNormal];
    [_nextStepButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _nextStepButton.backgroundColor = LSTGreenFontColor;
    [_nextStepButton addTarget:self action:@selector(nextButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    _nextStepButton.selected = YES;
    _nextStepButton.layer.cornerRadius = 5;
    [self.contentView addSubview:_nextStepButton];

    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:@"须知：电子标签注销后无法恢复使用，银行联名速通卡须先前往银行销卡后方能办理电子标签注销业务"];
    [attrStr addAttribute:NSForegroundColorAttributeName
                    value:[UIColor orangeColor]
                    range:NSMakeRange(0, 3)];
    _protoclContenLabel.attributedText = attrStr;
    
    [self layoutCustomViews];
    [self enlargeEdgeButton];
}

/**
 * 扩大按钮作用域，没作用写的有问题？
 */
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
    }];
    
    [_nextStepButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(_protoclContenLabel.mas_bottom).mas_offset(120);
        make.height.mas_equalTo(40);
        make.bottom.mas_equalTo(-20);
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

/**
 * 下一步按钮点击回调
 */
- (void)nextButtonTap:(UIButton *)button
{
    if (self.nextStepTapHandler) {
        self.nextStepTapHandler(button);
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
