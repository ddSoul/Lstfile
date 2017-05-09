//
//  LSTEtagOrderDetailView.m
//  DirectorySpecification
//
//  Created by Pactera_Admin on 2017/3/27.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTEtagOrderDetailView.h"

#define view_scal SCREEN_WIDTH/414
#define FOND_SIZE_14 ([UIFont systemFontOfSize:14 * view_scal])

static const CGFloat left_Padding = 20.f;
static const CGFloat line_Space = 10.f;

@interface LSTEtagOrderDetailView ()
{
    UILabel *_orderNumLabel;/** 订单号*/
    UILabel *_orderTimeLabel;/** 创建时间*/
    UILabel *_eTagNumLabel;/** 电子标签号*/
    UILabel *_stCardNumLabel;/** 速通卡号*/
    UILabel *_carNumLabel;/** 车牌号*/
    UILabel *_carColorLabel;/** 车牌颜色*/
}
@end

@implementation LSTEtagOrderDetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.frame = frame;
        self.backgroundColor = LSTVCBackgroundColor;
        [self createControls];
    }
    return self;
}

/**
 * 创建控件
 */
- (void)createControls
{
    //美工线
    UIView *topLineView = [[UIView alloc] init];
    topLineView.backgroundColor = LSTBlack24FontColor;
    [self addSubview:topLineView];
    
    //
    UILabel *orderNumNTLabel = [[UILabel alloc] init];
    orderNumNTLabel.font = FOND_SIZE_14;
    orderNumNTLabel.text = @"订  单  号:";
    [self addSubview:orderNumNTLabel];
    
    _orderNumLabel = [[UILabel alloc] init];
    _orderNumLabel.font = FOND_SIZE_14;
    _orderNumLabel.textColor = LSTBlack24FontColor;
    _orderNumLabel.text = @"12222312334355";
    [self addSubview:_orderNumLabel];
    
    //
    UILabel *timeNTLabel = [[UILabel alloc] init];
    timeNTLabel.font = FOND_SIZE_14;
    timeNTLabel.text = @"生成日期:";
    [self addSubview:timeNTLabel];
    
    _orderTimeLabel = [[UILabel alloc] init];
    _orderTimeLabel.font = FOND_SIZE_14;
    _orderTimeLabel.textColor = LSTBlack24FontColor;
    _orderTimeLabel.text = @"2017-03-26 00.00";
    [self addSubview:_orderTimeLabel];
    
    //
    UILabel *eTagNTLabel = [[UILabel alloc] init];
    eTagNTLabel.font = FOND_SIZE_14;
    eTagNTLabel.text = @"标  签  号:";
    [self addSubview:eTagNTLabel];
    
    _eTagNumLabel = [[UILabel alloc] init];
    _eTagNumLabel.font = FOND_SIZE_14;
    _eTagNumLabel.textColor = LSTBlack24FontColor;
    _eTagNumLabel.text = @"666777888899999";
    [self addSubview:_eTagNumLabel];

    //
    UILabel *stNumNTLabel = [[UILabel alloc] init];
    stNumNTLabel.font = FOND_SIZE_14;
    stNumNTLabel.text = @"速通卡号:";
    [self addSubview:stNumNTLabel];
    
    _stCardNumLabel = [[UILabel alloc] init];
    _stCardNumLabel.font = FOND_SIZE_14;
    _stCardNumLabel.textColor = LSTBlack24FontColor;
    _stCardNumLabel.text = @"sss2222312334355";
    [self addSubview:_stCardNumLabel];
    
    //
    UILabel *carNumNTLabel = [[UILabel alloc] init];
    carNumNTLabel.font = FOND_SIZE_14;
    carNumNTLabel.text = @"车  牌  号:";
    [self addSubview:carNumNTLabel];
    
    _carNumLabel = [[UILabel alloc] init];
    _carNumLabel.font = FOND_SIZE_14;
    _carNumLabel.textColor = LSTBlack24FontColor;
    _carNumLabel.text = @"京A88888";
    [self addSubview:_carNumLabel];
    
    //
    UILabel *carColorNTLabel = [[UILabel alloc] init];
    carColorNTLabel.font = FOND_SIZE_14;
    carColorNTLabel.text = @"车牌颜色:";
    [self addSubview:carColorNTLabel];
    
    _carColorLabel = [[UILabel alloc] init];
    _carColorLabel.font = FOND_SIZE_14;
    _carColorLabel.textColor = LSTBlack24FontColor;
    _carColorLabel.text = @"红色";
    [self addSubview:_carColorLabel];
    
    //美工线
    UIView *bottomLineView = [[UIView alloc] init];
    bottomLineView.backgroundColor = LSTBlack24FontColor;
    [self addSubview:bottomLineView];

    
    /** 布局控件, 可归为一个方法*/
    [topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    
    [orderNumNTLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(topLineView.mas_bottom).mas_offset(line_Space);
    }];
    
    [_orderNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(orderNumNTLabel.mas_right).mas_offset(left_Padding);
        make.top.mas_equalTo(topLineView.mas_bottom).mas_offset(line_Space);
    }];
    
    [timeNTLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(left_Padding);
        make.top.mas_equalTo(orderNumNTLabel.mas_bottom).mas_offset(line_Space);
    }];
    
    [_orderTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(timeNTLabel.mas_right).mas_offset(left_Padding);
        make.top.mas_equalTo(orderNumNTLabel.mas_bottom).mas_offset(line_Space);
    }];
    
    [eTagNTLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(left_Padding);
        make.top.mas_equalTo(timeNTLabel.mas_bottom).mas_offset(line_Space);
    }];
    
    [_eTagNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(eTagNTLabel.mas_right).mas_offset(left_Padding);
        make.top.mas_equalTo(timeNTLabel.mas_bottom).mas_offset(line_Space);
    }];
    
    [stNumNTLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(left_Padding);
        make.top.mas_equalTo(eTagNTLabel.mas_bottom).mas_offset(line_Space);
    }];
    
    [_stCardNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(stNumNTLabel.mas_right).mas_offset(left_Padding);
        make.top.mas_equalTo(eTagNTLabel.mas_bottom).mas_offset(line_Space);
    }];
    
    [carNumNTLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(left_Padding);
        make.top.mas_equalTo(stNumNTLabel.mas_bottom).mas_offset(line_Space);
    }];
    
    [_carNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(carNumNTLabel.mas_right).mas_offset(left_Padding);
        make.top.mas_equalTo(stNumNTLabel.mas_bottom).mas_offset(line_Space);
    }];
    
    [carColorNTLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(left_Padding);
        make.top.mas_equalTo(carNumNTLabel.mas_bottom).mas_offset(line_Space);
    }];
    
    [_carColorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(carColorNTLabel.mas_right).mas_offset(left_Padding);
        make.top.mas_equalTo(carNumNTLabel.mas_bottom).mas_offset(line_Space);
    }];
    
    [bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(_carColorLabel.mas_bottom).mas_offset(line_Space);
    }];

}

@end
