//
//  LSTChooseTypeVC.m
//  TTTTT
//
//  Created by Pactera_Admin on 2017/4/10.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

#import "LSTChooseTypeVC.h"
#import "LSTLabelsApplyTypeVC.h"
#import "LSTActionSheet.h"

#import "UIButton+Edge.h"

@interface LSTChooseTypeVC ()

@end

@implementation LSTChooseTypeVC

#pragma mark - life cycle 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

#pragma mark - initUI 初始化视图
- (void)initUI{
    
    /** 页面UI、逻辑不多，可以直接写在C*/
    self.view.backgroundColor = LSTVCBackgroundColor;
    self.title = @"选择方式";
    
    UILabel *topTitleLabel = [[UILabel alloc] init];
    topTitleLabel.text = @"提交完成后，办理方式不能修改";
    topTitleLabel.textColor = LSTBlack24FontColor;
    topTitleLabel.textAlignment = NSTextAlignmentRight;
    topTitleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:topTitleLabel];
    
    UIView *topLine = [[UIView alloc] init];
    topLine.backgroundColor = LSTLine1Color;
    [self.view addSubview:topLine];
    
    UILabel *leftTitleLabel = [[UILabel alloc] init];
    leftTitleLabel.font = [UIFont systemFontOfSize:16];
    leftTitleLabel.backgroundColor = [UIColor whiteColor];
    leftTitleLabel.textAlignment = NSTextAlignmentLeft;
    leftTitleLabel.text = @"    办理方式";
    [self.view addSubview:leftTitleLabel];
    
    UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    selectBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [selectBtn setTitle:@"请选择" forState:UIControlStateNormal];
    [selectBtn setTitleColor:LSTBlack24FontColor forState:UIControlStateNormal];
    [selectBtn addTarget:self action:@selector(tapSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
    [selectBtn setImage:[UIImage imageNamed:@"shqbk_arrow33"] forState:UIControlStateNormal];
    [self.view addSubview:selectBtn];
    [selectBtn setImagePosition:LSTImagePositionRight spacing:5];
    
    UIView *bottomLine = [[UIView alloc] init];
    bottomLine.backgroundColor = LSTLine1Color;
    [self.view addSubview:bottomLine];
    
    [topTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.right.mas_equalTo(-10);
    }];
    
    [topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(2);
        make.top.mas_equalTo(topTitleLabel.mas_bottom).mas_offset(10);
    }];
    
    [leftTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(topLine.mas_bottom).mas_offset(0);
    }];
    
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(2);
        make.top.mas_equalTo(leftTitleLabel.mas_bottom).mas_offset(0);
    }];

    [selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(100);
        make.top.mas_equalTo(topLine.mas_bottom).mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    
    
}

#pragma mark - touch Event 按钮点击事件
- (void)tapSelectBtn:(UIButton *)sender
{
    LSTActionSheet *actionSheet = [[LSTActionSheet alloc] initWithTitleArray:@[@"上门服务",@"网点办理"]];
    [[UIApplication sharedApplication].keyWindow addSubview:actionSheet];
    
    __weak typeof(self) weakSelf = self;
    actionSheet.ClickIndex = ^(NSInteger index){
        NSLog(@"_________%ld",(long)index);
        LSTLabelsApplyTypeVC *Vc = [[LSTLabelsApplyTypeVC alloc] init];
        [weakSelf.navigationController pushViewController:Vc animated:YES];
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
