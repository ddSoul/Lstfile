//
//  LSTOtherCardCell.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/20.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTOtherCardCell.h"
#import "UIButton+Edge.h"

#define CAR_NUMBER_TAG (10)
#define PHONE_NUMBER_TAG (20)

#define view_scal SCREEN_WIDTH/414
#define FOND_SIZE_14 ([UIFont systemFontOfSize:14 * view_scal])

static const CGFloat Padding_top = 10.f;                      //上内边距
static const CGFloat Line_space = 10.f;                       //行间距
static const CGFloat Padding_left = 10.f;                     //左边距
static const CGFloat Padding_right = 20.f;
static const CGFloat Space_0 = 0.0f;
static const CGFloat Line1_heigh = 1.0f;


@interface LSTOtherCardCell ()<UITextFieldDelegate>
{
    UILabel *_titlelabel;/** 顶部提示文字*/
    UILabel *_carNumberlabel;
    UILabel *_carColorLabel;
    
    UIImageView *_selectImageView;
    UITextField *_carNumberTf;
    UIButton *_selCarColorBtn;
    
    /** 美工线*/
    UIView *_1pLineView_1;
    UIView *_1pLineView_2;
    UIView *_1pLineView_3;
    UIView *_1pLineView_4;
    UIView *_20pLineView;
    UIView *_bottomLineView;
    
    /** 新增手机号*/
    UILabel *_telLabel;
    UITextField *_inputTelTf;
    
    NSString *_saveCarNumber;
    NSString *_savePhoneNumber;

}
@end

@implementation LSTOtherCardCell

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
    _titlelabel      = [[UILabel alloc] init];
    _titlelabel.font = FOND_SIZE_14;
    _titlelabel.text = @"注销其他车辆索邦定的标签";
    [self.contentView addSubview:_titlelabel];
    
    _carNumberlabel      = [[UILabel alloc] init];
    _carNumberlabel.font = FOND_SIZE_14;
    _carNumberlabel.text = @"车牌号";
    [self.contentView addSubview:_carNumberlabel];
    
    _carColorLabel      = [[UILabel alloc] init];
    _carColorLabel.font = FOND_SIZE_14;
    _carColorLabel.text = @"车牌颜色";
    [self.contentView addSubview:_carColorLabel];
    
    _carNumberTf                = [[UITextField alloc] init];
    _carNumberTf.placeholder    = @"请输入车牌号";
    _carNumberTf.tag            = CAR_NUMBER_TAG;
    _carNumberTf.delegate       = self;
    _carNumberTf.textAlignment  = NSTextAlignmentRight;
    _carNumberTf.font           = FOND_SIZE_14;
    _carNumberTf.textColor      = LSTBlack24FontColor;
    [self.contentView addSubview:_carNumberTf];
    
    _telLabel       = [[UILabel alloc] init];
    _telLabel.font  = FOND_SIZE_14;
    _telLabel.text  = @"手机号";
    [self.contentView addSubview:_telLabel];
    
    _inputTelTf                 = [[UITextField alloc] init];
    _inputTelTf.placeholder     = @"请输入手机号";
    _inputTelTf.tag             = PHONE_NUMBER_TAG;
    _inputTelTf.delegate        = self;
    _inputTelTf.font            = FOND_SIZE_14;
    _inputTelTf.textColor       = LSTBlack24FontColor;
    _inputTelTf.textAlignment   = NSTextAlignmentRight;
    _inputTelTf.keyboardType    = UIKeyboardTypeNumberPad;
    [self.contentView addSubview:_inputTelTf];
    
    _selCarColorBtn                 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_selCarColorBtn setTitle:@"请选择" forState:UIControlStateNormal];
    _selCarColorBtn.titleLabel.font = FOND_SIZE_14;
    [_selCarColorBtn setImage:[UIImage imageNamed:@"shqbk_arrow33"] forState:UIControlStateNormal];
    [_selCarColorBtn setTitleColor:LSTBlack24FontColor forState:UIControlStateNormal];
    [_selCarColorBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_selCarColorBtn];
    /** 调整图文位置*/
    [_selCarColorBtn setImagePosition:LSTImagePositionRight spacing:5];
    
    _selectImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_selectImageView];
    
    _1pLineView_1 = [[UIView alloc] init];
    _1pLineView_1.backgroundColor = LSTLine1Color;
    [self.contentView addSubview:_1pLineView_1];
    
    _1pLineView_2 = [[UIView alloc] init];
    _1pLineView_2.backgroundColor = LSTLine1Color;
    [self.contentView addSubview:_1pLineView_2];

    _1pLineView_3 = [[UIView alloc] init];
    _1pLineView_3.backgroundColor = LSTLine1Color;
    [self.contentView addSubview:_1pLineView_3];

    _1pLineView_4 = [[UIView alloc] init];
    _1pLineView_4.backgroundColor = LSTLine1Color;
    [self.contentView addSubview:_1pLineView_4];

    
    _20pLineView = [[UIView alloc] init];
    _20pLineView.backgroundColor = LSTLineWColor;
    [self.contentView addSubview:_20pLineView];
    
    _bottomLineView = [[UIView alloc] init];
    _bottomLineView.backgroundColor = LSTLine1Color;
    [self.contentView addSubview:_bottomLineView];

}

#pragma mark - eventTouch Methods

- (void)click:(UIButton *)button
{
    if (self.chooseColorButtonTapHandler) {
        self.chooseColorButtonTapHandler(button);
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if (textField.tag == CAR_NUMBER_TAG) {
        _saveCarNumber = textField.text;
    }else if(textField.tag == PHONE_NUMBER_TAG){
        _savePhoneNumber = textField.text;
    };
    
    if (_savePhoneNumber.length && _saveCarNumber.length) {
        if (self.textFiledEndEidtHandler) {
            self.textFiledEndEidtHandler(_saveCarNumber, _savePhoneNumber);
        }
    }
    return YES;
}

#pragma mark - custom Methods
/** 视图隐藏与否*/
- (void)isHiddenViews:(BOOL)isHidden
{
    _carColorLabel.hidden   = isHidden;
    _carNumberTf.hidden     = isHidden;
    _carNumberlabel.hidden  = isHidden;
    _selCarColorBtn.hidden  = isHidden;
    _telLabel.hidden        = isHidden;
    _inputTelTf.hidden      = isHidden;
    _1pLineView_2.hidden    = isHidden;
    _1pLineView_3.hidden    = isHidden;
    _1pLineView_4.hidden    = isHidden;
    
}



#pragma mark - setter,getter

- (void)setSelect:(BOOL)select
{
    if (select) {
        _selectImageView.image = [UIImage imageNamed:@"shqbk_checked"];
    }else{
        _selectImageView.image = [UIImage imageNamed:@"shqbk_unchecked"];
    }
}

/**
 * 根据是否展开进行视图处理
 */
- (void)setExpand:(BOOL)expand
{
    if (expand) {
        
        [self isHiddenViews:NO];
        
        [_20pLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(Space_0);
            make.height.mas_equalTo(20);
        }];
        
        [_1pLineView_1 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(Space_0);
            make.top.mas_equalTo(_20pLineView.mas_bottom).mas_offset(Space_0);
            make.height.mas_equalTo(Line1_heigh);
        }];

        /** 第一行*/
        [_titlelabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Padding_left);
            make.top.mas_equalTo(_1pLineView_1.mas_bottom).mas_offset(Line_space);
        }];
        
        [_1pLineView_2 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(Space_0);
            make.height.mas_equalTo(Line1_heigh);
            make.top.mas_equalTo(_titlelabel.mas_bottom).mas_offset(Padding_top);
        }];
        
        /** 第二行*/
        [_carNumberlabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Padding_left);
            make.top.mas_equalTo(_titlelabel.mas_bottom).mas_offset(20);
        }];
        
        [_carNumberTf mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-Padding_right);
            make.width.mas_equalTo(200);
            make.top.mas_equalTo(_titlelabel.mas_bottom).mas_offset(20);
        }];
        
        [_1pLineView_3 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(Space_0);
            make.height.mas_equalTo(Line1_heigh);
            make.top.mas_equalTo(_carNumberlabel.mas_bottom).mas_offset(Padding_top);
        }];
        
        /** 第三行*/
        [_carColorLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Padding_left);
            make.top.mas_equalTo(_carNumberlabel.mas_bottom).mas_offset(20);
        }];

        [_selCarColorBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(Space_0);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(_carColorLabel.mas_height);
            make.top.mas_equalTo(_carNumberTf.mas_bottom).mas_offset(20);
        }];
        
        [_1pLineView_4 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(Space_0);
            make.height.mas_equalTo(Line1_heigh);
            make.top.mas_equalTo(_carColorLabel.mas_bottom).mas_offset(Line_space);
        }];
        
        /** 第四行*/
        [_telLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Padding_left);
            make.top.mas_equalTo(_carColorLabel.mas_bottom).mas_offset(20);
        }];
        
        [_inputTelTf mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-Padding_right);
            make.width.mas_equalTo(200);
            make.top.mas_equalTo(_selCarColorBtn.mas_bottom).mas_offset(20);
        }];
        
        /** 右侧图片*/
        [_selectImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-Padding_right);
            make.top.mas_equalTo(30);
            make.width.height.mas_equalTo(20);
        }];
        
        /** 底部美工线*/
        [_bottomLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(Space_0);
            make.top.mas_equalTo(_telLabel.mas_bottom).mas_offset(Padding_top);
            make.height.mas_equalTo(1);
            make.bottom.mas_equalTo(Space_0).priorityLow();
        }];
        
    }else{
        
        [self isHiddenViews:YES];
        
        [_20pLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(Space_0);
            make.height.mas_equalTo(20);
        }];
        
        [_1pLineView_1 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.left.mas_equalTo(Space_0);
            make.top.mas_equalTo(_20pLineView.mas_bottom).mas_offset(Space_0);
            make.height.mas_equalTo(Line1_heigh);
        }];
        
        [_titlelabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Padding_left);
            make.top.mas_equalTo(_1pLineView_1.mas_bottom).mas_offset(Padding_top);
        }];
        
        [_selectImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-Padding_right);
            make.top.mas_equalTo(30);
            make.width.height.mas_equalTo(20);
        }];
        
        [_bottomLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(Space_0);
            make.top.mas_equalTo(_titlelabel.mas_bottom).mas_offset(Padding_top);
            make.height.mas_equalTo(Line1_heigh);
            make.bottom.mas_equalTo(Space_0).priorityLow();
        }];

        
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
