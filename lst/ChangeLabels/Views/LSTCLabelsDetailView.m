//
//  LSTCLabelsDetailView.m
//  DirectorySpecification
//
//  Created by Pactera_Admin on 2017/4/12.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTCLabelsDetailView.h"

#define FOND_SIZE_14 ([UIFont systemFontOfSize:14])

@interface LSTCLabelsDetailView ()
{
    /** 电子标签号*/
    UILabel *_eTagLabel;
    /** 车牌号*/
    UILabel *_carNumberLabel;
    /** 车辆颜色*/
    UILabel *_carColorLabel;
    /** 速通卡号*/
    UILabel *_stCarNumberLabel;
    /** 开户人*/
    UILabel *_personLabel;
    
}
@end

@implementation LSTCLabelsDetailView

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
    UIImageView *topImageView = [[UIImageView alloc] init];
    topImageView.image = [UIImage imageNamed:@"eTagImage"];
    [self addSubview:topImageView];
    
    UILabel *topTitleLabel = [[UILabel alloc] init];
    topTitleLabel.text = @"您将要更换的标签信息如下";
    topTitleLabel.font = FOND_SIZE_14;
    [self addSubview:topTitleLabel];
    
    //
    UILabel *etagTLabel = [[UILabel alloc] init];
    etagTLabel.font = FOND_SIZE_14;
    etagTLabel.text = @"标  签  号:";
    [self addSubview:etagTLabel];
    
    _eTagLabel = [[UILabel alloc] init];
    _eTagLabel.font = FOND_SIZE_14;
    _eTagLabel.text = @"1111 2222 3333 44444";
    _eTagLabel.textColor = LSTGreenFontColor;
    [self addSubview:_eTagLabel];

    //
    UILabel *carNTLabel = [[UILabel alloc] init];
    carNTLabel.font = FOND_SIZE_14;
    carNTLabel.text = @"车  牌  号:";
    [self addSubview:carNTLabel];
    
    _carNumberLabel = [[UILabel alloc] init];
    _carNumberLabel.font = FOND_SIZE_14;
    _carNumberLabel.textColor = LSTBlack24FontColor;
    _carNumberLabel.text = @"京A11111";
    [self addSubview:_carNumberLabel];

    
    //
    UILabel *carColorTLabel = [[UILabel alloc] init];
    carColorTLabel.font = FOND_SIZE_14;
    carColorTLabel.text = @"车牌颜色:";
    [self addSubview:carColorTLabel];
    
    _carColorLabel = [[UILabel alloc] init];
    _carColorLabel.font = FOND_SIZE_14;
    _carColorLabel.textColor = LSTBlack24FontColor;
    _carColorLabel.text = @"彩色";
    [self addSubview:_carColorLabel];
    
    //
    UILabel *stNTLabel = [[UILabel alloc] init];
    stNTLabel.font = FOND_SIZE_14;
    stNTLabel.text = @"速通卡号:";
    [self addSubview:stNTLabel];
    
    _stCarNumberLabel = [[UILabel alloc] init];
    _stCarNumberLabel.font = FOND_SIZE_14;
    _stCarNumberLabel.text = @"6666888880000";
    _stCarNumberLabel.textColor = LSTBlack24FontColor;
    [self addSubview:_stCarNumberLabel];
    
    //
    UILabel *personTLabel = [[UILabel alloc] init];
    personTLabel.font = FOND_SIZE_14;
    personTLabel.text = @"开  户  人:";
    [self addSubview:personTLabel];
    
    _personLabel = [[UILabel alloc] init];
    _personLabel.font = FOND_SIZE_14;
    _personLabel.textColor = LSTBlack24FontColor;
    _personLabel.text = @"张三";
    [self addSubview:_personLabel];
    
    
    
    __weak typeof(self) weakSelf = self;
    /** 布局*/
    [topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.centerX.mas_equalTo(weakSelf).mas_offset(0);
        make.width.height.mas_equalTo(40);
    }];
    
    [topTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(topImageView.mas_bottom).mas_offset(30);
    }];
    

    [stNTLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(topTitleLabel.mas_bottom).mas_offset(20);
    }];
    
    [_stCarNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(stNTLabel.mas_right).mas_offset(20);
        make.top.mas_equalTo(topTitleLabel.mas_bottom).mas_offset(20);
    }];

    [etagTLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(stNTLabel.mas_bottom).mas_offset(20);
    }];
    
    [_eTagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(etagTLabel.mas_right).mas_offset(20);
        make.top.mas_equalTo(stNTLabel.mas_bottom).mas_offset(20);
    }];
    
   
    [personTLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(etagTLabel.mas_bottom).mas_offset(20);
    }];
    
    [_personLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(personTLabel.mas_right).mas_offset(20);
        make.top.mas_equalTo(etagTLabel.mas_bottom).mas_offset(20);
    }];
    
    [carNTLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(personTLabel.mas_bottom).mas_offset(20);
    }];
    
    [_carNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(carNTLabel.mas_right).mas_offset(20);
        make.top.mas_equalTo(personTLabel.mas_bottom).mas_offset(20);
    }];
    
    [carColorTLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(carNTLabel.mas_bottom).mas_offset(20);
    }];
    
    [_carColorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(carColorTLabel.mas_right).mas_offset(20);
        make.top.mas_equalTo(carNTLabel.mas_bottom).mas_offset(20);
//        make.bottom.mas_equalTo(-30);
    }];
    
}

@end
