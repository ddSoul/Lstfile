//
//  LSTLabelsLogOffVC.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/20.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTEtagLogOffVC.h"
#import "LSTAuthCodeVC.h"

#import "LSTCarInfoCell.h"
#import "LSTOtherCardCell.h"
#import "LSTAgreeCell.h"
#import "FDActionSheet.h"
#import "LSTAlert.h"

#import "LSTEtagLogoffAPI.h"

#define CELL_ID_CARINFO @"lstCarInfoCell"
#define CELL_ID_OTHERINFO @"lstOtherCarCell"
#define CELL_ID_AGREEINFO @"lstAgreeCell"

#define TOTOL_CELL_COUNT(a,b) (a+b);
#define OCEEL_INDEX(a) (a)
#define AGERR_INDEX(a) (a+1)

@interface LSTEtagLogOffVC ()<UITableViewDelegate,UITableViewDataSource,FDActionSheetDelegate>

@property (nonatomic, strong) UITableView *carInfoListTableView;/** 主列表*/
@property (nonatomic, strong) UIButton *colorButton;/** 颜色选择按钮用来做文本显示的传递*/

@property (nonatomic, assign) NSInteger cellIndex;/** 记录单选CellIndex，方便逻辑处理*/
@property (nonatomic, strong) NSArray *carColorArray;/** 车颜色数组*/
@property (nonatomic, strong) NSMutableArray *carInfolistArray;/** 备用Array*/

@property (nonatomic, assign, getter=isAgreeProtocol) BOOL agreeProtocol;/** 同意按钮的是否点击处理下一步按钮、体验问题*/


@end

@implementation LSTEtagLogOffVC

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self getCardInfoList];
}
- (void)dealloc
{
    NSLog(@"___________方便测试是否有内存泄漏问题");
}

#pragma mark - initUI

- (void)initUI
{
    self.agreeProtocol        = YES;
    
    self.view.backgroundColor = LSTVCBackgroundColor;
    self.title = @"标签注销";
    [self.view addSubview:self.carInfoListTableView];
    
    [self.carInfoListTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    
}
- (void)initColorActionSheet
{
    FDActionSheet *sheet = [[FDActionSheet alloc] initWithTitle:nil
                                                       delegate:self
                                              cancelButtonTitle:@"取消"
                                              otherButtonTitles:self.carColorArray];
    sheet.delegate = self;
    [sheet show];
}

#pragma mark - delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return TOTOL_CELL_COUNT(self.carInfolistArray.count, 2);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    __weak typeof(self) weakSelf = self;
    
    /** 手动输入车辆信息Cell处理*/
    if (indexPath.row == OCEEL_INDEX(self.carInfolistArray.count)) {
        LSTOtherCardCell *cell   = [tableView dequeueReusableCellWithIdentifier:CELL_ID_OTHERINFO];
        /** 选择颜色按钮点击处理*/
        cell.chooseColorButtonTapHandler = ^(UIButton *button){
            [weakSelf initColorActionSheet];
            weakSelf.colorButton = button;
        };
        /** 判断手动输入展开与否*/
        (self.cellIndex == indexPath.row) ? (cell.expand = YES) : (cell.expand = NO);
        /** 单选处理*/
        (self.cellIndex == indexPath.row) ? (cell.select = YES) : (cell.select = NO);

        return cell;
    }
    
    /** 阅读协议Cell*/
    if (indexPath.row == AGERR_INDEX(self.carInfolistArray.count)) {
        LSTAgreeCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID_AGREEINFO];
        /** 同意协议按钮点击处理*/
        cell.agreeTapHandler = ^(UIButton *agreeButton){
            agreeButton.selected ? (agreeButton.selected = NO, weakSelf.agreeProtocol = NO)
                                 : (agreeButton.selected = YES, weakSelf.agreeProtocol = YES);
        };
        /** 下一步按钮点击处理*/
        cell.nextStepTapHandler = ^(UIButton *nextStepButton){
            
            if (weakSelf.isAgreeProtocol) {
                [weakSelf showLstAlert];
            }else{
                [LSTAlert showErrorWithString:@"请先阅读并同意须知内容" atViewController:weakSelf sureAction:^(UIAlertAction *action) {
                    weakSelf.colorButton.selected = YES;
                }];

            }
            
        };
        
        return cell;
    }
    
    /** 车辆信息Cell*/
    LSTCarInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID_CARINFO];
    /** 单选处理*/
    (self.cellIndex == indexPath.row) ? (cell.select = YES) : (cell.select = NO);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != AGERR_INDEX(self.carInfolistArray.count)) {
        self.cellIndex = indexPath.row;
        [tableView reloadData];
    };
}

/** ActionSheetDelegate Method*/
- (void)actionSheet:(FDActionSheet *)sheet clickedButtonIndex:(NSInteger)buttonIndex
{
    [self.colorButton setTitle:self.carColorArray[buttonIndex] forState:UIControlStateNormal];
    NSLog(@"_________actionSheetIndex");
}

#pragma mark - touch events
- (void)showLstAlert
{
    __weak typeof(self) weakSelf = self;

    [LSTAlert configeAlertViewControllerWithTitle:@"确定要下一步？"
                                          message:@"好吧"
                                            style:LSTAlertControllerStyleAlert
                                      atPersentVC:weakSelf
                                       suerAction:^(UIAlertAction *action){
                                                    [weakSelf authSTCardHandler];
    }
                                     cancalAction:nil];
    
}

#pragma mark - custom Methods
/** 获取数据*/
- (void)getCardInfoList
{
    [LSTEtagLogoffAPI getStCardInfoListSuccess:^(id result) {
        NSLog(@"____________请求成功");
    } failure:^(NSError *error) {
        NSLog(@"____________请求失败");
    }];
}

/** 速通卡验证处理逻辑*/
- (void)authSTCardHandler
{
    /** 需要调用接口处理逻辑*/
    /** 验证卡的有效性，成功之后进入短信验证码界面*/
    LSTAuthCodeVC *authCodeVC = [[LSTAuthCodeVC alloc] initWithPhoneNumber:@"15210025112"];
    [self.navigationController pushViewController:authCodeVC animated:YES];
}

#pragma mark - setter,getter

- (UITableView *)carInfoListTableView
{
    if (!_carInfoListTableView) {
        _carInfoListTableView                     = [[UITableView alloc] init];
        _carInfoListTableView.delegate            = self;
        _carInfoListTableView.dataSource          = self;
        _carInfoListTableView.estimatedRowHeight  = 200;
        _carInfoListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        /** 注册Cell*/
        [_carInfoListTableView registerClass:[LSTCarInfoCell class]
                      forCellReuseIdentifier:CELL_ID_CARINFO];
        [_carInfoListTableView registerClass:[LSTOtherCardCell class]
                      forCellReuseIdentifier:CELL_ID_OTHERINFO];
        [_carInfoListTableView registerClass:[LSTAgreeCell class]
                      forCellReuseIdentifier:CELL_ID_AGREEINFO];
    }
    return _carInfoListTableView;
}

- (NSArray *)carColorArray
{
    if (!_carColorArray) {
        _carColorArray = @[@"蓝色",
                           @"黄色",
                           @"白色",
                           @"黑色",
                           @"彩虹色"];
    }
    return _carColorArray;
}

- (NSMutableArray *)carInfolistArray
{
    if (!_carInfolistArray) {
//        _carInfolistArray = @[].mutableCopy;
        /** 测试数据*/
        _carInfolistArray = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"",@"", nil];
    }
    return _carInfolistArray;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
