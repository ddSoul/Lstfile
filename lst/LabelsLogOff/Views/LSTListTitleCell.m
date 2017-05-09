//
//  LSTListTitleCell.m
//  DirectorySpecification
//
//  Created by Pactera_Admin on 2017/4/10.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTListTitleCell.h"
#import "LSTCarModel.h"
#import "LSTETagStaicString.h"


#define Left_TagNumber(a) (100+a)

#define view_scal SCREEN_WIDTH/414
#define FOND_SIZE_14 ([UIFont systemFontOfSize:14 * view_scal])

static const CGFloat Padding_top = 10.f;                      //上内边距
static const CGFloat Line_space = 10.f;                       //行间距
static const CGFloat Padding_left = 20.f;                     //左边距
//static const CGFloat Padding_right = 30.f;                    //右边距
static const CGFloat Space_0 = 0.0f;
static const CGFloat Line20_hegih = 20.0;
static const CGFloat Line1_hegih = 1.0f;

@interface LSTListTitleCell ()
{
    UIImageView *_selectImageView;
    
    NSArray *_items;
    NSMutableArray <UILabel *>*_leftLabels;
    NSMutableArray <UILabel *>*_rightLabels;
    
    /** 美工线*/
    UIView *_1pLineView;
    UIView *_20pLineView;
    UIView *_bottomLineView;
    
    NSString *_cellTypeString;
}

@end

@implementation LSTListTitleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    _cellTypeString = reuseIdentifier;
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self configeUI];
    }
    return self;
}
/**
 *  创建控件
 */
- (void)configeUI
{
    //判断需要创建哪种类型的Cell
    if ([_cellTypeString isEqualToString:offLabels_cellID]) {
         _items = [self getArrayListWithType:LSTSpecialBussibeTypeOfLabelsOff];
    }else if([_cellTypeString isEqualToString:changeLabels_cellID]){
        _items = [self getArrayListWithType:LSTSpecialBussibeTypeOfChangeLabels];
    };
   
    _leftLabels = @[].mutableCopy;
    _rightLabels = @[].mutableCopy;
    
    for (int i = 0; i<_items.count; i++) {
        UILabel *leftlabel = [[UILabel alloc] init];
        leftlabel.tag = i;
        leftlabel.text = _items[i];
        leftlabel.font = FOND_SIZE_14;
        [self.contentView addSubview:leftlabel];
        [_leftLabels addObject:leftlabel];
        
        UILabel *rightlabel = [[UILabel alloc] init];
        rightlabel.tag = i;
        rightlabel.text = _items[i];
        rightlabel.textColor = LSTBlack24FontColor;
        rightlabel.font = FOND_SIZE_14;
        [self.contentView addSubview:rightlabel];
        [_rightLabels addObject:rightlabel];
    }
    
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

/**
 * 控件布局
 */
- (void)layoutCustomViews
{
    UILabel *lastLabel;
    
    [_20pLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(Space_0);
        make.height.mas_equalTo(Line20_hegih);
    }];
    
    [_1pLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(Space_0);
        make.top.mas_equalTo(_20pLineView.mas_bottom).mas_offset(Space_0);
        make.height.mas_equalTo(Line1_hegih);
    }];

    for (int i = 0; i< _leftLabels.count; i++) {
        UILabel *leftLabel = _leftLabels[i];
        UILabel *rightLabel = _rightLabels[i];

        [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0) {
                make.top.mas_equalTo(_1pLineView.mas_bottom).mas_offset(Padding_top);
            }else{
                make.top.mas_equalTo(lastLabel.mas_bottom).mas_offset(Padding_top);
            }
            make.left.mas_equalTo(Padding_left);
        }];
        
        [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0) {
                make.top.mas_equalTo(_1pLineView.mas_bottom).mas_offset(Padding_top);
            }else{
                make.top.mas_equalTo(lastLabel.mas_bottom).mas_offset(Padding_top);
            }
            make.left.mas_equalTo(leftLabel.mas_right).mas_offset(Padding_left);
        }];
        
        lastLabel = leftLabel;
    }
    
    [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(Space_0);
        make.height.mas_equalTo(Line1_hegih);
        make.top.mas_equalTo(lastLabel.mas_bottom).mas_offset(Line_space);
    }];
    
    __weak typeof(self) weakSelf = self;
    [_selectImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.width.height.mas_equalTo(20);
        make.centerY.mas_equalTo(weakSelf).mas_offset(10);
    }];
    
}


/**
 * 更具Model、type配置列表数据
 */
- (void)congigRightLabelsTitleWithModel:(LSTCarModel *)model type:(LSTSpecialBussibeType)type
{
    if (type == LSTSpecialBussibeTypeOfLabelsOff) {
        for (UILabel *label in _rightLabels) {
            switch (label.tag) {
                case 0:
                {
                    label.text = model.vehicleInfo.vehicleLicense.licensePlateNumber;
                }
                    break;
                case 1:
                {
                    label.text = model.vehicleInfo.vehicleColor;
                }
                    break;
                case 2:
                {
                    label.text = model.cardNo;
                }
                    break;
                case 3:
                {
                    label.text = model.phone;
                }
                    break;
                    
                default:
                    break;
            }
        }
    }else if(type == LSTSpecialBussibeTypeOfChangeLabels){
        for (UILabel *label in _rightLabels) {
            switch (label.tag) {
                case 0:
                {
                    label.text = model.vehicleInfo.vehicleLicense.licensePlateNumber;
                }
                    break;
                case 1:
                {
                    label.text = model.cardNo;
                }
                    break;
                case 2:
                {
                    label.text = model.labelNo;
                }
                    break;
                    
                default:
                    break;
            }
        }
        
    }
}


/**
 * 初始化列表数据
 */
- (NSArray *)getArrayListWithType:(LSTSpecialBussibeType)type
{
    NSArray *array;
    switch (type) {
        case LSTSpecialBussibeTypeOfLabelsOff:
        {
            array = @[@"车  牌  号:",@"车牌颜色:",@"速通卡号:",@"手机号码:"];
        }
            break;
        case LSTSpecialBussibeTypeOfChangeLabels:
        {
            array = @[@"车  牌  号:",@"速通卡号:",@"标  签  号:"];
        }
            break;
        default:
            break;
    }
    
    return array;
}

#pragma mark - set Select
- (void)setSelect:(BOOL)select
{
    if (select) {
        _selectImageView.image = [UIImage imageNamed:@"shqbk_checked"];
    }else{
        _selectImageView.image = [UIImage imageNamed:@"shqbk_unchecked"];
    }
}




@end
