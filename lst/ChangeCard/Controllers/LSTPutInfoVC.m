//
//  LSTPutInfoVC.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/17.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTPutInfoVC.h"
#import "PutInfoCell.h"

@interface LSTPutInfoVC ()<UITableViewDelegate,UITableViewDataSource>

/** 信息提交类型选择List */
@property (strong, nonatomic) UITableView *chooseTypeList;
/** 底部下一步按钮*/
@property (strong, nonatomic) UIButton *nextButton;
/** 临时按钮用作单选用*/
@property (strong, nonatomic) UIButton *senderButton;

@end

@implementation LSTPutInfoVC

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

#pragma mark - initUI
- (void)initUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"提交资料";
    
    [self.view addSubview:self.chooseTypeList];
    [self.view addSubview:self.nextButton];
    
    [self layoutCustomViews];
}
- (void)layoutCustomViews
{
    [self.chooseTypeList mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.right.mas_equalTo(0);
    }];
}

#pragma mark - delegate Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PutInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"putCell"];
    
    __weak typeof(self) weakSelf = self;
    cell.selectButtonTapHandler = ^(UIButton *selectButton){
        
        [weakSelf uploadInfoTypeViewsHandler:selectButton];
    };
    return cell;
}

#pragma mark - custom Methods
- (void)nextButtonTap:(UIButton *)button
{
//    LSTAuthCodeVC *authVc = [[LSTAuthCodeVC alloc] init];
//    [self.navigationController pushViewController:authVc animated:YES];
}
/**
 * 根据损坏类型显示响应视图
 */
- (void)uploadInfoTypeViewsHandler:(UIButton *)senderBtn
{
    self.senderButton.selected = NO;
    self.senderButton = senderBtn;
    self.senderButton.selected = YES;

}

#pragma mark - touch events

#pragma mark - setter,getter

- (UITableView *)chooseTypeList
{
    if (!_chooseTypeList) {
        _chooseTypeList = [[UITableView alloc] init];
        _chooseTypeList.delegate = self;
        _chooseTypeList.dataSource = self;
        _chooseTypeList.estimatedRowHeight = 50;
        _chooseTypeList.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_chooseTypeList registerClass:[PutInfoCell class] forCellReuseIdentifier:@"putCell"];
    }
    return _chooseTypeList;
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
