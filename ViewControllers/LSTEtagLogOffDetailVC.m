//
//  LSTLabelsLogOffDetailVC.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/20.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTEtagLogOffDetailVC.h"
#import "LSTETagDetailView.h"

#import "LSTAlert.h"
#import "LSTEtagLogoffAPI.h"
#import "UIView+Toast.h"

static const CGFloat left_Right_Padiing = 10.f;
static const CGFloat eTagView_Height = 300.f;
static const CGFloat sure_Button_Height = 40.f;
static const CGFloat button_Radius = 5.f;

@interface LSTEtagLogOffDetailVC ()

/** 电子标签详情页面*/
@property (nonatomic, strong) LSTETagDetailView *etagDetailView;
/** 确认按钮*/
@property (nonatomic, strong) UIButton *suerButton;

@end

@implementation LSTEtagLogOffDetailVC

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
    [self.view addSubview:self.etagDetailView];
    [self.view addSubview:self.suerButton];
    [self configNavigationRightItem];
    
    [self.etagDetailView mas_makeConstraints:^(MASConstraintMaker *make) {
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
/** 导航栏右侧取消按钮*/
- (void)configNavigationRightItem
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"取消"
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(cancel)];
    item.tintColor = [UIColor whiteColor];
    NSDictionary * textAttributes=[NSDictionary dictionaryWithObjectsAndKeys:
                                   LSTBlack24FontColor, NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:14], NSFontAttributeName, nil];
    [item setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = item;
}

#pragma mark - delegate Methods

#pragma mark - custom Methods
/** 从网络加载Etag数据*/
- (void)loadEtagInfo
{
    self.etagDetailView.carModel = self.model;
}
- (void)tapSureButton:(UIButton *)button
{
    __weak typeof(self) weakSelf = self;
    [LSTAlert configeAlertViewControllerWithTitle:@"您确认注销该电子标签？" message:nil style:LSTAlertControllerStyleAlert atPersentVC:self suerAction:^(UIAlertAction *action) {
       //确认提交注销申请
        [LSTEtagLogoffAPI commitEtagLogOffApplyWithOrderNo:weakSelf.orderModel.orderNo carModel:weakSelf.model success:^(id result) {
            [self.navigationController popToRootViewControllerAnimated:YES];
        } failure:^(NSError *error) {
            [self.view makeToast:@"出错了"];
        }];
    } cancalAction:^(UIAlertAction *action) {
        //取消Alert
    }];
}
- (void)cancel
{
    [LSTAlert configeAlertViewControllerWithTitle:@"您确认取消注销该电子标签？" message:nil style:LSTAlertControllerStyleAlert atPersentVC:self suerAction:^(UIAlertAction *action) {
        //确认取消
        [LSTEtagLogoffAPI alterOrderStatusWithOderNo:self.orderModel.orderNo success:^(id result) {
            [self.view makeToast:@"操作成功"];
        } failure:^(NSError *error) {
            [self.view makeToast:@""];
        }];

    } cancalAction:^(UIAlertAction *action) {
        //取消Alert
    }];
}

#pragma mark - touch events

#pragma mark - setter,getter
- (LSTETagDetailView *)etagDetailView
{
    if (!_etagDetailView) {
        _etagDetailView                     = [[LSTETagDetailView alloc] init];
        _etagDetailView.backgroundColor     = [UIColor whiteColor];
        _etagDetailView.layer.cornerRadius  = button_Radius;
    }
    return _etagDetailView;
}
- (UIButton *)suerButton
{
    if (!_suerButton) {
        _suerButton                     = [UIButton buttonWithType:UIButtonTypeCustom];
        _suerButton.backgroundColor     = LSTGreenFontColor;
        _suerButton.layer.cornerRadius  = button_Radius;
        [_suerButton setTitle:@"确定" forState:UIControlStateNormal];
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
