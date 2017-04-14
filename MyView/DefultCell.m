//
//  DefultCell.m
//  TTTTT
//
//  Created by Pactera_Admin on 2017/4/5.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

#import "DefultCell.h"
#import "Masonry.h"

#define Left_TagNumber(a) (100+a)
#define FOND_SIZE_14 ([UIFont systemFontOfSize:14])

static const CGFloat Padding_top = 50.f;                      //上内边距
static const CGFloat Line_space = 10.f;                       //行间距
static const CGFloat Padding_left = 30.f;                     //左边距
static const CGFloat Padding_right = 30.f;                    //右边距

@interface DefultCell ()
{
    UILabel *_tempLeftLabel;
    UILabel *_tempRightLabel;
    UIImageView *_selectImageView;
    
//    NSArray *_items;
    NSMutableArray *_leftLabels;
    NSMutableArray *_rightLabels;
    
    /** 美工线*/
    UIView *_1pLineView;
    UIView *_20pLineView;
    UIView *_bottomLineView;
}

@end

@implementation DefultCell

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
    
//    UILabel *label = [[UILabel alloc] init];
//    label.backgroundColor = [UIColor redColor];
//    label.numberOfLines = 0;
//    label.text = @"";
//    label.font = [UIFont systemFontOfSize:14];
//    [self.contentView addSubview:label];
//    
//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.top.mas_equalTo(0);
//    }];
    
//    _items = [self getArrayListWithType:1];
//    _leftLabels = @[].mutableCopy;
//    _rightLabels = @[].mutableCopy;
//    
//    for (int i = 0; i<_items.count; i++) {
//        UILabel *leftlabel = [[UILabel alloc] init];
//        leftlabel.tag = i;
//        leftlabel.backgroundColor = [UIColor greenColor];
//        leftlabel.text = _items[i];
//        leftlabel.font = [UIFont systemFontOfSize:15];
//        [self.contentView addSubview:leftlabel];
//        [_leftLabels addObject:leftlabel];
//        
//        UILabel *rightlabel = [[UILabel alloc] init];
//        rightlabel.tag = i;
//        rightlabel.backgroundColor = [UIColor orangeColor];
//        rightlabel.text = _items[i];
//        rightlabel.font = [UIFont systemFontOfSize:15];
//        [self.contentView addSubview:rightlabel];
//        [_rightLabels addObject:rightlabel];
//    }
//    
//    _selectImageView = [[UIImageView alloc] init];
//    _selectImageView.backgroundColor = [UIColor redColor];
//    [self.contentView addSubview:_selectImageView];
//    
//    [self layoutCustomViews];
}
- (void)setInifoDic:(NSDictionary *)inifoDic
{
    NSArray *leftTitleArray = inifoDic.allKeys;
    NSArray *rightTitleArray = inifoDic.allValues;
    _leftLabels = @[].mutableCopy;
    _rightLabels = @[].mutableCopy;
    
    for (int i = 0; i<leftTitleArray.count; i++) {
        UILabel *leftlabel = [[UILabel alloc] init];
        leftlabel.tag = i;
        leftlabel.text = leftTitleArray[i];
        leftlabel.font = FOND_SIZE_14;
        [self.contentView addSubview:leftlabel];
        [_leftLabels addObject:leftlabel];
        
        UILabel *rightlabel = [[UILabel alloc] init];
        rightlabel.tag = i;
        rightlabel.text = rightTitleArray[i];
        rightlabel.textColor = [UIColor blueColor];
        rightlabel.font = FOND_SIZE_14;
        [self.contentView addSubview:rightlabel];
        [_rightLabels addObject:rightlabel];
    }
    
    _1pLineView = [[UIView alloc] init];
    _1pLineView.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:_1pLineView];
    
    _20pLineView = [[UIView alloc] init];
    _20pLineView.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:_20pLineView];
    
    _bottomLineView = [[UIView alloc] init];
    _bottomLineView.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:_bottomLineView];
    
    
    [self layoutCustomViews];
}

/**
 * 控件布局
 */
- (void)layoutCustomViews
{
    
    
    for (int i = 0; i< _leftLabels.count; i++) {
        UILabel *leftLabel = _leftLabels[i];
        UILabel *rightLabel = _rightLabels[i];
        
        //单行处理
        if (_leftLabels.count == 1) {
            [_20pLineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.right.mas_equalTo(0);
                make.height.mas_equalTo(20);
            }];
            
            [_1pLineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.mas_equalTo(0);
                make.top.mas_equalTo(_20pLineView.mas_bottom).mas_offset(0);
                make.height.mas_equalTo(1);
            }];
            
            
            [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(Padding_left);
                make.top.mas_equalTo(_1pLineView.mas_bottom).mas_offset(Padding_top);
            }];
            
            [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(leftLabel.mas_right).mas_offset(Padding_left);
                make.top.mas_equalTo(_1pLineView.mas_bottom).mas_offset(Padding_top);
            }];
            
            [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.bottom.mas_equalTo(0);
                make.height.mas_equalTo(1);
                make.top.mas_equalTo(rightLabel.mas_bottom).mas_offset(Line_space);
            }];

            return;
        }
        
        //首行处理
        if (leftLabel.tag == 0) {
            [_20pLineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.right.mas_equalTo(0);
                make.height.mas_equalTo(20);
            }];
            
            [_1pLineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.mas_equalTo(0);
                make.top.mas_equalTo(_20pLineView.mas_bottom).mas_offset(0);
                make.height.mas_equalTo(1);
            }];
            
            
            [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(Padding_left);
                make.top.mas_equalTo(_1pLineView.mas_bottom).mas_offset(Padding_top);
            }];
            
            [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(leftLabel.mas_right).mas_offset(Padding_left);
                make.top.mas_equalTo(_1pLineView.mas_bottom).mas_offset(Padding_top);
            }];
            //末行处理
        }else if(leftLabel.tag == _leftLabels.count - 1){
            [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(Padding_left);
                make.top.mas_equalTo(_tempLeftLabel.mas_bottom).mas_offset(Line_space);
                make.bottom.mas_equalTo(-Line_space);
            }];
            
            [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(leftLabel.mas_right).mas_offset(Padding_left);
                make.top.mas_equalTo(_tempRightLabel.mas_bottom).mas_offset(Line_space);
            }];
            
            [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.bottom.mas_equalTo(0);
                make.height.mas_equalTo(1);
                make.top.mas_equalTo(rightLabel.mas_bottom).mas_offset(Line_space);
            }];
            
        }else{
            [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(Padding_left);
                make.top.mas_equalTo(_tempLeftLabel.mas_bottom).mas_offset(Line_space);
            }];
            
            [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(leftLabel.mas_right).mas_offset(Padding_left);
                make.top.mas_equalTo(_tempRightLabel.mas_bottom).mas_offset(Line_space);
            }];
        }
        
        _tempLeftLabel = leftLabel;
        _tempRightLabel = rightLabel;
    }
    
}


//
//- (void)congigRightLabelsTitle
//{
//    if (/* DISABLES CODE */ (1)) {
//        for (UILabel *label in _rightLabels) {
//            switch (label.tag) {
//                case 0:
//                {
//                    label.text = @"京A66666";
//                }
//                    break;
//                case 1:
//                {
//                    label.text = @"66666666666";
//                }
//                    break;
//                case 2:
//                {
//                    label.text = @"1215154511212";
//                }
//                    break;
//                case 3:
//                {
//                    label.text = @"125532321";
//                }
//                    break;
//                    
//                default:
//                    break;
//            }
//        }
//    }else{
//        for (UILabel *label in _rightLabels) {
//            switch (label.tag) {
//                case 0:
//                {
//                    label.text = @"666666666";
//                }
//                    break;
//                case 1:
//                {
//                    label.text = @"555555555";
//                }
//                    break;
//                case 2:
//                {
//                    label.text = @"3333333333";
//                }
//                    break;
//                    
//                default:
//                    break;
//            }
//        }
//
//    }
//}
//
//
//- (NSArray *)getArrayListWithType:(NSInteger)type
//{
//    NSArray *array;
//    switch (type) {
//        case 0:
//        {
//            array = @[@"车  牌  号:",@"车牌颜色:",@"速通卡号:",@"手机号码:"];
//        }
//            break;
//        case 1:
//        {
//            array = @[@"车  牌  号:",@"速通卡号:",@"标  签  号:"];
//        }
//            break;
//        default:
//            break;
//    }
//
//    return array;
//}


@end
