//
//  LSTBottomPayView.m
//  DirectorySpecification
//
//  Created by Pactera_Admin on 2017/4/11.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTBottomPayView.h"

@interface LSTBottomPayView ()
{
    UIView *_lineView;
    UILabel *_moneyLabel;
    UIButton *_commitBtn;
}
@end

@implementation LSTBottomPayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.frame = frame;
        [self createControls];
    }
    return self;
}

/**
 * 创建控件
 */
- (void)createControls
{
    self.backgroundColor = [UIColor whiteColor];
    
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = LSTBlack24FontColor;
    [self addSubview:_lineView];
    
    _moneyLabel = [[UILabel alloc] init];
    _moneyLabel.text = @"合计支付：0.00元";
    _moneyLabel.font = [UIFont systemFontOfSize:13];
    _moneyLabel.textColor = LSTBlack24FontColor;
    [self addSubview:_moneyLabel];
    
    _commitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _commitBtn.backgroundColor = LSTGreenFontColor;
    _commitBtn.titleLabel.textColor = [UIColor whiteColor];
    [_commitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [_commitBtn addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_commitBtn];
    
    [self layoutCustomViews];
}

- (void)layoutCustomViews
{
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    
    [_commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_lineView.mas_bottom).mas_offset(0);
        make.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(100);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_commitBtn.mas_left).mas_offset(-10);
        make.top.mas_equalTo(10);
    }];
}

- (void)tap:(UIButton *)button
{
    if (self.commitHandler) {
        self.commitHandler();
    };
}

@end
