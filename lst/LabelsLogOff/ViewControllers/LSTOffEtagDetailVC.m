//
//  LSTOffEtagDetailVC.m
//  DirectorySpecification
//
//  Created by Pactera_Admin on 2017/4/6.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTOffEtagDetailVC.h"

#import "LSTEtagOrderDetailView.h"
#import "LSTEtagOrderModel.h"

@interface LSTOffEtagDetailVC ()

@property (nonatomic, strong) LSTEtagOrderDetailView *detailViews;

@end

@implementation LSTOffEtagDetailVC

- (instancetype)initWithOrderInfo:(LSTEtagOrderModel *)orderInfo{
    if (self = [super init]) {
//        self.orderInfo = orderInfo;
        self.title = @"订单详情";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view.
}

- (void)initUI
{
    self.view.backgroundColor = LSTVCBackgroundColor;
    
    [self.view addSubview:self.detailViews];
    [self.detailViews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
    }];
}

- (LSTEtagOrderDetailView *)detailViews
{
    if (!_detailViews) {
        _detailViews = [[LSTEtagOrderDetailView alloc] init];
    }
    return _detailViews;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
