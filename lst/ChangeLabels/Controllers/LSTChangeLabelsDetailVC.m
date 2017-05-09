//
//  LSTChangeLabelsDetailVC.m
//  DirectorySpecification
//
//  Created by Pactera_Admin on 2017/4/10.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTChangeLabelsDetailVC.h"
#import "LSTChooseTypeVC.h"
#import "LSTCLabelsDetailView.h"

#import "LSTAlert.h"
#import "LSTEtagAPI.h"
#import "UIView+Toast.h"

static const CGFloat left_Right_Padiing = 10.f;
static const CGFloat eTagView_Height = 300.f;
static const CGFloat sure_Button_Height = 40.f;
static const CGFloat button_Radius = 5.f;

@interface LSTChangeLabelsDetailVC ()

/** 电子标签详情页面*/
@property (nonatomic, strong) LSTCLabelsDetailView *detailView;
/** 确认按钮*/
@property (nonatomic, strong) UIButton *suerButton;

@end

@implementation LSTChangeLabelsDetailVC

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self loadEtagInfo];
}

#pragma mark - initUI
- (void)initUI
{
    self.view.backgroundColor = LSTVCBackgroundColor;
    self.title = @"银行联名卡电子标签注销";
    [self.view addSubview:self.detailView];
    [self.view addSubview:self.suerButton];
    
    [self.detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(left_Right_Padiing);
        make.right.mas_equalTo(-left_Right_Padiing);
        make.height.mas_equalTo(eTagView_Height);
    }];
    [self.suerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(left_Right_Padiing);
        make.right.bottom.mas_equalTo(-left_Right_Padiing);
        make.height.mas_equalTo(sure_Button_Height);
    }];
}

#pragma mark - delegate Methods

#pragma mark - custom Methods
/** 从网络加载Etag数据*/
- (void)loadEtagInfo
{
//    self.etagDetailView.carModel = self.model;
}
- (void)tapSureButton:(UIButton *)button
{
    LSTChooseTypeVC *chooseVC = [[LSTChooseTypeVC alloc] init];
    [self.navigationController pushViewController:chooseVC animated:YES];
    
}

#pragma mark - touch events

#pragma mark - setter,getter
- (LSTCLabelsDetailView *)detailView
{
    if (!_detailView) {
        _detailView                     = [[LSTCLabelsDetailView alloc] init];
        _detailView.backgroundColor     = [UIColor whiteColor];
        _detailView.layer.cornerRadius  = button_Radius;
    }
    return _detailView;
}
- (UIButton *)suerButton
{
    if (!_suerButton) {
        _suerButton                     = [UIButton buttonWithType:UIButtonTypeCustom];
        _suerButton.backgroundColor     = LSTGreenFontColor;
        _suerButton.layer.cornerRadius  = button_Radius;
        [_suerButton setTitle:@"下一步" forState:UIControlStateNormal];
        [_suerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_suerButton addTarget:self action:@selector(tapSureButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _suerButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
