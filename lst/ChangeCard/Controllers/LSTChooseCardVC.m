//
//  LSTChooseCardVC.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/17.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTChooseCardVC.h"
#import "LSTAuthCodeVC.h"

#import "ETCCradCell.h"
#import "AgreementCell.h"

@interface LSTChooseCardVC ()<UITableViewDelegate,UITableViewDataSource>

/** 卡片列表*/
@property (strong, nonatomic) UITableView *etcCardList;
/** 底部下一步按钮*/
@property (strong, nonatomic) UIButton *nextButton;

@end

@implementation LSTChooseCardVC

#pragma mark - life clcye
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"选择卡片";
    
    [self.view addSubview:self.etcCardList];
    [self.view addSubview:self.nextButton];
    
    /** 布局*/
    [self.etcCardList mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(0);
    }];
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.bottom.right.mas_equalTo(-30);
        make.height.mas_equalTo(40);
    }];
}

#pragma mark - UITableView delegate,dataSouce
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    /** 测试数*/
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /** 测试数*/
    if (indexPath.row == 3) {
        AgreementCell *cell = [tableView dequeueReusableCellWithIdentifier:@"agreeCell"];
        cell.agreeTapHandler = ^(UIButton *agreeButton){
            /** 更具协议按钮的select属性更改nextButton的select属性*/
            agreeButton.selected ? (agreeButton.selected = NO) : (agreeButton.selected = YES);
            agreeButton.selected ? (self.nextButton.selected = YES ,self.nextButton.userInteractionEnabled = YES)
            : (self.nextButton.selected = NO,self.nextButton.userInteractionEnabled = NO);

        };
        return cell;
    }
    ETCCradCell *cell = [tableView dequeueReusableCellWithIdentifier:@"etcCell"];
    return cell;
}

#pragma mark - custom Methods
- (void)nextButtonTap:(UIButton *)button
{
    LSTAuthCodeVC *authVc = [[LSTAuthCodeVC alloc] init];
    [self.navigationController pushViewController:authVc animated:YES];
}

#pragma mark - setter,getter
- (UITableView *)etcCardList
{
    if (!_etcCardList) {
        _etcCardList = [[UITableView alloc] init];
        _etcCardList.delegate = self;
        _etcCardList.dataSource = self;
        _etcCardList.estimatedRowHeight = 100;
        [_etcCardList registerClass:[ETCCradCell class] forCellReuseIdentifier:@"etcCell"];
        [_etcCardList registerClass:[AgreementCell class] forCellReuseIdentifier:@"agreeCell"];
    }
    return _etcCardList;
}
- (UIButton *)nextButton
{
    if (!_nextButton) {
        _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextButton setBackgroundImage:[UIImage imageNamed:@"shqbk_button3"] forState:UIControlStateNormal];
        [_nextButton setBackgroundImage:[UIImage imageNamed:@"shqbk_button4"] forState:UIControlStateSelected];
        [_nextButton addTarget:self action:@selector(nextButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
