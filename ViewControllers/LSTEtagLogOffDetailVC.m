//
//  LSTLabelsLogOffDetailVC.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/20.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTEtagLogOffDetailVC.h"

#import "LSTETagDetailView.h"

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
        make.left.top.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(300);
    }];
    [self.suerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.bottom.mas_equalTo(-10);
        make.height.mas_equalTo(50);
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
    NSLog(@"___加载Etag信息数据");
//    self.etagDetailView.eTagModel = nil;
}
- (void)tapSureButton:(UIButton *)button
{
    NSLog(@"___确认按钮点击");
}
- (void)cancel
{
    NSLog(@"___取消");
}

#pragma mark - touch events

#pragma mark - setter,getter
- (LSTETagDetailView *)etagDetailView
{
    if (!_etagDetailView) {
        _etagDetailView                     = [[LSTETagDetailView alloc] init];
        _etagDetailView.backgroundColor     = [UIColor whiteColor];
        _etagDetailView.layer.cornerRadius  = 5;
    }
    return _etagDetailView;
}
- (UIButton *)suerButton
{
    if (!_suerButton) {
        _suerButton                     = [UIButton buttonWithType:UIButtonTypeCustom];
        _suerButton.backgroundColor     = LSTGreenFontColor;
        _suerButton.layer.cornerRadius  = 5;
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
