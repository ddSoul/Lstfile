//
//  LSTChangeCarInfoVC.m
//  DirectorySpecification
//
//  Created by Pactera_Admin on 2017/4/12.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTChangeCarInfoVC.h"
#import "LSTAuthCodeVC.h"
#import "LSTListTitleCell.h"
#import "LSTAgreeCell.h"
#import "LSTAlert.h"


#import "LSTETagStaicString.h"
#import "LSTCarModel.h"

#define TOTOL_CELL_COUNT(a) (a);                                                        // cell总数
#define AGERR_INDEX(index,arrayCount) ((index == arrayCount) ? 1:0)

@interface LSTChangeCarInfoVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *listView;
@property (nonatomic, strong) UIButton *nextButton;                                         /** 下一步按钮*/

@property (nonatomic, assign) NSInteger cellIndex;                                          /** 记录单选CellIndex，方便逻辑处理*/
@property (nonatomic, strong) NSMutableArray<LSTCarModel *> *carInfolistArray;              /** 数据Array*/

@property (nonatomic, assign, getter=isAgreeProtocol) BOOL agreeProtocol;                   /** 同意按钮的是否点击处理下一步按钮*/

@end

@implementation LSTChangeCarInfoVC

#pragma mark - life cycle 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI
{
    self.agreeProtocol = YES;
    
    self.view.backgroundColor = LSTVCBackgroundColor;
    self.title = @"车辆信息变更";
    
    [self.view addSubview:self.listView];
    [self.view addSubview:self.nextButton];
    
    [self.listView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.bottom.mas_equalTo(-20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(50);
    }];
    
}

#pragma mark - UITableView Delegate、DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /** 协议Cell处理*/
    if (AGERR_INDEX(indexPath.row,5)) {
        LSTAgreeCell *cell = [tableView dequeueReusableCellWithIdentifier:labelsAgree_cellID forIndexPath:indexPath];
        cell.type = LSTSpecialBussibeTypeOfChangeCarInfo;
        
        __weak typeof(self) weakSelf = self;
        /** 同意协议按钮点击处理*/
        cell.agreeTapHandler = ^(UIButton *agreeButton){
            agreeButton.selected ? (agreeButton.selected = NO, weakSelf.agreeProtocol = NO)
            : (agreeButton.selected = YES, weakSelf.agreeProtocol = YES);
            agreeButton.selected ? (weakSelf.nextButton.selected = YES, weakSelf.nextButton.userInteractionEnabled = YES)
            : (weakSelf.nextButton.selected = NO, weakSelf.nextButton.userInteractionEnabled = NO);

        };
        
        return cell;
    }
    
    LSTListTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:changeLabels_cellID forIndexPath:indexPath];
    [cell congigRightLabelsTitleWithModel:nil type:LSTSpecialBussibeTypeOfChangeLabels];
    /** 单选处理*/
    (self.cellIndex == indexPath.row) ? (cell.select = YES) : (cell.select = NO);
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!AGERR_INDEX(indexPath.row,5)) {
        self.cellIndex = indexPath.row;
        [tableView reloadData];
    };
}

#pragma mark - custom Metheds

/** 下一步点击*/
- (void)nextTap:(UIButton *)button
{
    if (self.isAgreeProtocol) {
        /** 显示提示框*/
        [self showLstAlert];
    }else{
        [LSTAlert showErrorWithString:@"请先阅读并同意须知内容" atViewController:self sureAction:^(UIAlertAction *action) {
        }];
    }
    
}

- (void)showLstAlert
{
    __weak typeof(self) weakSelf = self;
    [LSTAlert configeAlertViewControllerWithTitle:@"确定要进行注销标签操作？" message:nil style:LSTAlertControllerStyleAlert atPersentVC:self suerAction:^(UIAlertAction *action) {
        
        LSTAuthCodeVC *authCodeVC = [[LSTAuthCodeVC alloc] init];
        [weakSelf.navigationController pushViewController:authCodeVC animated:YES];
        
    } cancalAction:^(UIAlertAction *action) {
        //
    }];
}

#pragma mark - setter、getter 初始化

- (UITableView *)listView
{
    if (!_listView) {
        _listView = [[UITableView alloc] init];
        _listView.delegate = self;
        _listView.dataSource = self;
        
        _listView.estimatedRowHeight = 200;
        _listView.backgroundColor = LSTVCBackgroundColor;
        _listView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_listView registerClass:[LSTAgreeCell class] forCellReuseIdentifier:labelsAgree_cellID];
        [_listView registerClass:[LSTListTitleCell class] forCellReuseIdentifier:changeLabels_cellID];
        
    }
    return _listView;
}
- (UIButton *)nextButton
{
    if (!_nextButton) {
        _nextButton = [UIButton  buttonWithType:UIButtonTypeCustom];
        [_nextButton setBackgroundImage:[UIImage imageNamed:@"image_my_bill_unapply"] forState:UIControlStateNormal];
        [_nextButton setBackgroundImage:[UIImage imageNamed:@"image_my_bill_apply"] forState:UIControlStateSelected];
        [_nextButton setTitle:@"下一步" forState:UIControlStateNormal];
        [_nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nextButton.layer setCornerRadius:8];
        [_nextButton setClipsToBounds:YES];
        [_nextButton setSelected:NO];
        [_nextButton setUserInteractionEnabled:NO];
        
        [_nextButton addTarget:self action:@selector(nextTap:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextButton;
}

@end
