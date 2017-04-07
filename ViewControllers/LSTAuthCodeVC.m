//
//  LSTAuthCodeVC.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/17.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTAuthCodeVC.h"
#import "LSTEtagLogOffDetailVC.h"
#import "LSTVertifyCodeViewController.h"

#import "NSString+Tools.h"
#import "UITextField+Space.h"
#import "UIView+Toast.h"
#import "LSTEtagLogoffAPI.h"
#import "LSTAuthentication.h"

static const CGFloat Line_Height = 1.f;
static const CGFloat Bottom_Buttom_Height = 120.f;
static const CGFloat Defult_View_Height = 40.f;

@interface LSTAuthCodeVC ()<UITextFieldDelegate>

@property (nonatomic, strong) UILabel *remindeLable;                    /** 顶部提示文字*/
@property (nonatomic, strong) UITextField *authCodeTf;                  /** 验证码输入框*/
@property (nonatomic, strong) UIButton *senderAuthCodeBtn;              /** 发送验证码按钮*/
@property (nonatomic, strong) UIButton *commitButton;                   /** 提交按钮*/

@property (nonatomic, strong) UIView *topLineView;                      /** 美工线*/
@property (nonatomic, strong) UIView *bottomLineView;

@property (nonatomic, assign, getter=isActive) BOOL active;             /** 页面是否处于活跃状态，便于释放_timer*/
@property (nonatomic, copy) NSString *phoneNumberString;

@property (nonatomic, copy) NSString *pwdToken;                         /** 记录pwdToken*/

@end

@implementation LSTAuthCodeVC

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.active = YES;
}

/** 这个页面东西比较少，不需要新建Views、Models*/
- (void)initUI
{
    self.view.backgroundColor = LSTVCBackgroundColor;
    self.title = @"验证码";
    self.phoneNumberString = [NSString stringWithFormat:@"将向手机号%@发送验证码",[NSString hiddenPhoneNumber:self.carModel.phone]];
    
    [self.view addSubview:self.remindeLable];
    [self.view addSubview:self.topLineView];
    [self.view addSubview:self.authCodeTf];
    [self.view addSubview:self.bottomLineView];
    [self.view addSubview:self.commitButton];
    [self.view addSubview:self.senderAuthCodeBtn];
    
    [self layoutCustomViews];
}
/** 布局*/
- (void)layoutCustomViews
{
    [self.remindeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(30);
    }];
    
    [self.topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.remindeLable.mas_bottom).mas_offset(20);
        make.height.mas_equalTo(Line_Height);
    }];
    
    [self.authCodeTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(self.topLineView.mas_bottom).mas_equalTo(0);
        make.height.mas_equalTo(Defult_View_Height);
        make.width.mas_equalTo(SCREEN_WIDTH-120);
    }];
    
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.authCodeTf.mas_bottom).mas_offset(0);
        make.height.mas_equalTo(Line_Height);
    }];
    
    [self.commitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.bottomLineView.mas_bottom).mas_offset(30);
        make.height.mas_equalTo(Defult_View_Height);
    }];
    
    [self.senderAuthCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.authCodeTf.mas_top).mas_offset(0);
        make.bottom.mas_equalTo(self.authCodeTf.mas_bottom).mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(Bottom_Buttom_Height);
    }];
    
}


#pragma mark - delegate Methods
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    textField.text.length ? (self.commitButton.backgroundColor = LSTGreenFontColor, self.commitButton.userInteractionEnabled = YES)
                            : (self.commitButton.backgroundColor = LSTBlack24FontColor, self.commitButton.userInteractionEnabled = NO);
    return YES;
}


#pragma mark - custom Methods
- (void)verifyAuthCode
{
    /** 校验验证码的正确性*/
    self.active = NO;
    [LSTEtagLogoffAPI vertifyAuthCodeWithCode:self.authCodeTf.text pwdtoken:self.pwdToken success:^(id result) {
        //需要提交订单
        [LSTEtagLogoffAPI postOrderWithOrder:self.orderModel carModel:self.carModel success:^(id result) {
            /** 提交订单,成功之后做跳转，可在之前加等待动画*/
            LSTEtagLogOffDetailVC *labelsDetailVc = [[LSTEtagLogOffDetailVC alloc] init];
            labelsDetailVc.model = self.carModel;
            labelsDetailVc.orderModel = self.orderModel;
            [self.navigationController pushViewController:labelsDetailVc animated:YES];
            
        } failure:^(NSError *error) {
            [self.view makeToast:@""];
        }];
    } failure:^(NSError *error) {
         [self.view makeToast:@""];
    }];
}
- (void)tapSenderButton
{
    [self senderAuthCode];
    [self timeOut];
}
- (void)senderAuthCode
{
    /** 发送验证码调用接口，之前业务需要调用两层接口，先获取passwordToken*/
    [LSTEtagLogoffAPI getPassWordTokenWithPhoneNumber:self.carModel.phone success:^(id result) {
   
        self.pwdToken = result[@"data"][@"passwordToken"];
        [LSTEtagLogoffAPI getAuthCodeWithPassWordToken:self.pwdToken success:^(id result) {
            [self.view makeToast:@"发送成功"];
        } failure:^(NSError *error) {
            [self.view makeToast:@""];
        }];
        
    } failure:^(NSError *error) {
        [self.view makeToast:@""];
    }];
}

- (void)timeOut
{
    /** 倒计时时间*/
    __block int timeout = 60;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){
            /** 倒计时结束，关闭*/
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                /** 设置界面的按钮显示 根据自己需求设置*/
                [self.senderAuthCodeBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
                self.senderAuthCodeBtn.userInteractionEnabled = YES;
            });
        }else{
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (self.isActive) {
                    [self.senderAuthCodeBtn setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
                    self.senderAuthCodeBtn.userInteractionEnabled = NO;
                    
                }else{
                    dispatch_source_cancel(_timer);
                    [self.senderAuthCodeBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
                    self.senderAuthCodeBtn.userInteractionEnabled = YES;
                }
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}


#pragma mark - setter,getter

- (UILabel *)remindeLable
{
    if (!_remindeLable) {
        _remindeLable           = [[UILabel alloc] init];
        _remindeLable.font      = [UIFont systemFontOfSize:13];
        _remindeLable.textColor = LSTBlack24FontColor;
        _remindeLable.text      = self.phoneNumberString;
    }
    return _remindeLable;
}
- (UIButton *)commitButton
{
    if (!_commitButton) {
        _commitButton                        = [UIButton buttonWithType:UIButtonTypeCustom];
        _commitButton.backgroundColor        = LSTBlack24FontColor;
        _commitButton.userInteractionEnabled = NO;
        [_commitButton setTitle:@"提交" forState:UIControlStateNormal];
        [_commitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_commitButton addTarget:self action:@selector(verifyAuthCode) forControlEvents:UIControlEventTouchUpInside];
    }
    return _commitButton;
}
- (UIView *)topLineView
{
    if (!_topLineView) {
        _topLineView                         = [[UIView alloc] init];
        _topLineView.backgroundColor         = LSTLine1Color;
    }
    return _topLineView;
}
- (UIView *)bottomLineView
{
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.backgroundColor = LSTLine1Color;
    }
    return _bottomLineView;
}
- (UITextField *)authCodeTf
{
    if (!_authCodeTf) {
        _authCodeTf                         = [[UITextField alloc] init];
        _authCodeTf.delegate                = self;
        _authCodeTf.backgroundColor         = [UIColor whiteColor];
        _authCodeTf.keyboardType            = UIKeyboardTypeNumberPad;
        _authCodeTf.placeholder             = @"请填写验证码";
        [_authCodeTf setLeftDistance:10.0f];
    }
    return _authCodeTf;
}
- (UIButton *)senderAuthCodeBtn
{
    if (!_senderAuthCodeBtn) {
        _senderAuthCodeBtn                   = [UIButton buttonWithType:UIButtonTypeCustom];
        _senderAuthCodeBtn.backgroundColor   = [UIColor whiteColor];
        _senderAuthCodeBtn.titleLabel.font   = [UIFont systemFontOfSize:14];
        [_senderAuthCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_senderAuthCodeBtn setTitleColor:LSTGreenFontColor forState:UIControlStateNormal];
        [_senderAuthCodeBtn addTarget:self action:@selector(tapSenderButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _senderAuthCodeBtn;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
