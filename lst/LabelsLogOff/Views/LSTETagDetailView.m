//
//  LSTETagDetailView.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/21.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTETagDetailView.h"
#import "LSTCarModel.h"

#import "NSString+Tools.h"

#define view_scal SCREEN_WIDTH/414
#define FOND_SIZE_14 ([UIFont systemFontOfSize:14 * view_scal])

@interface LSTETagDetailView ()
{
    /** 电子标签号*/
    UILabel *_eTagLabel;
    /** 车牌号*/
    UILabel *_carNumberLabel;
    /** 车辆颜色*/
    UILabel *_carColorLabel;
    /** 速通卡号*/
    UILabel *_stCarNumberLabel;
    
}
@end

@implementation LSTETagDetailView

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
    
    UILabel *eTagTitleLabel = [[UILabel alloc] init];
    eTagTitleLabel.text = @"您将要注销的标签";
    eTagTitleLabel.font = FOND_SIZE_14;
    [self addSubview:eTagTitleLabel];
    
    _eTagLabel = [[UILabel alloc] init];
    _eTagLabel.font = FOND_SIZE_14;
    _eTagLabel.text = @"1111 2222 3333 44444";
    _eTagLabel.textColor = LSTGreenFontColor;
    [self addSubview:_eTagLabel];
    
    UILabel *infoTitleLabel = [[UILabel alloc] init];
    infoTitleLabel.font = FOND_SIZE_14;
    infoTitleLabel.text = @"该标签对应的车辆信息如下";
    [self addSubview:infoTitleLabel];
    
    UILabel *carNTLabel = [[UILabel alloc] init];
    carNTLabel.font = FOND_SIZE_14;
    carNTLabel.text = @"车  牌  号:";
    [self addSubview:carNTLabel];
    
    UILabel *carColorTLabel = [[UILabel alloc] init];
    carColorTLabel.font = FOND_SIZE_14;
    carColorTLabel.text = @"车牌颜色:";
    [self addSubview:carColorTLabel];
    
    UILabel *stNTLabel = [[UILabel alloc] init];
    stNTLabel.font = FOND_SIZE_14;
    stNTLabel.text = @"速通卡号:";
    [self addSubview:stNTLabel];
    
    _carNumberLabel = [[UILabel alloc] init];
    _carNumberLabel.font = FOND_SIZE_14;
    _carNumberLabel.textColor = LSTBlack24FontColor;
    _carNumberLabel.text = @"京A11111";
    [self addSubview:_carNumberLabel];
    
    _carColorLabel = [[UILabel alloc] init];
    _carColorLabel.font = FOND_SIZE_14;
    _carColorLabel.textColor = LSTBlack24FontColor;
    _carColorLabel.text = @"彩色";
    [self addSubview:_carColorLabel];
    
    _stCarNumberLabel = [[UILabel alloc] init];
    _stCarNumberLabel.font = FOND_SIZE_14;
    _stCarNumberLabel.text = @"6666888880000";
    _stCarNumberLabel.textColor = LSTBlack24FontColor;
    [self addSubview:_stCarNumberLabel];
    

    __weak typeof(self) weakSelf = self;
    /** 布局*/
    [topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.centerX.mas_equalTo(weakSelf).mas_offset(0);
        make.width.height.mas_equalTo(40);
    }];
    
    [eTagTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(topImageView.mas_bottom).mas_offset(30);
    }];
    
    [_eTagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(eTagTitleLabel.mas_right).mas_offset(10);
        make.top.mas_equalTo(topImageView.mas_bottom).mas_offset(30);
    }];
    
    [infoTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(eTagTitleLabel.mas_bottom).mas_offset(30);
    }];
    
    [carNTLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(infoTitleLabel.mas_bottom).mas_offset(25);
    }];
    
    [_carNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(carNTLabel.mas_right).mas_offset(20);
        make.top.mas_equalTo(infoTitleLabel.mas_bottom).mas_offset(25);
    }];
    
    [carColorTLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(carNTLabel.mas_bottom).mas_offset(20);
    }];
    
    [_carColorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(carColorTLabel.mas_right).mas_offset(20);
        make.top.mas_equalTo(carNTLabel.mas_bottom).mas_offset(20);
    }];
    
    [stNTLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(carColorTLabel.mas_bottom).mas_offset(20);
    }];
    
    [_stCarNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(stNTLabel.mas_right).mas_offset(20);
        make.top.mas_equalTo(carColorTLabel.mas_bottom).mas_offset(20);
    }];
}

/**
 * 赋值
 */
- (void)setCarModel:(LSTCarModel *)carModel
{
    _eTagLabel.text = [NSString formateStNumber:carModel.labelNo];
    _carNumberLabel.text = carModel.vehicleInfo.vehicleLicense.licensePlateNumber;
    _carColorLabel.text = carModel.vehicleInfo.vehicleColor;
    _stCarNumberLabel.text = [NSString isNullToString:carModel.cardNo];
}

@end
