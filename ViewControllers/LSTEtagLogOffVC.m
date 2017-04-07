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
#import "UIView+Toast.h"

#import "LSTAuthentication.h"
#import "LSTEtagLogoffAPI.h"
#import "LSTDataManager.h"
#import "LSTCarModel.h"
#import "NSString+Tools.h"
#import "LSTEtagOrderModel.h"
#import "LSTVehicleEnums.h"

#define TOTOL_CELL_COUNT(a,b) (a+b);                                                        // cell总数
#define OCEEL_INDEX(a) (a)                                                                  //手动输入信息cell索引
#define AGERR_INDEX(a) (a+1)                                                                //同意信息cell索引

static NSString * const cell_ID_CarInfo = @"lstCarInfoCell";
static NSString * const cell_ID_InputInfo = @"lstInputInfoCell";
static NSString * const cell_ID_Agree = @"lstAgreeCell";

typedef NS_ENUM(NSInteger, LSTCommitInfoType){
    LSTCommitInfoTypeOfDefulet = 1,                                                         //获取列表信息提交,不需要做校验
    LSTCommitInfoTypeOfInput                                                                //手动输入信息提交，需要做信息校验
};

@interface LSTEtagLogOffVC ()<UITableViewDelegate,UITableViewDataSource,FDActionSheetDelegate>

@property (nonatomic, strong) UITableView *carInfoListTableView;                            /** 主列表*/
@property (nonatomic, strong) UIButton *colorButton;                                        /** 颜色选择按钮用来做文本显示的传递*/

@property (nonatomic, assign) NSInteger cellIndex;                                          /** 记录单选CellIndex，方便逻辑处理*/
@property (nonatomic, strong) NSArray *carColorArray;                                       /** 车颜色数组*/
@property (nonatomic, strong) NSMutableArray<LSTCarModel *> *carInfolistArray;              /** 数据Array*/

@property (nonatomic, copy) NSString *phoneNumber;                                          /** 手动输入信息的电话号和车牌号*/
@property (nonatomic, copy) NSString *carNumber;                                            /** 车牌号*/
@property (nonatomic, copy) NSString *saveOrderNumber;                                      /** 保存生成的订单号，方便传递*/
@property (nonatomic, copy) NSString *saveCarColor;                                         /** 保存车牌颜色*/
@property (nonatomic, assign) NSInteger vehicleColor;
@property (nonatomic, strong) LSTEtagOrderModel *saveOrderModel;                            /** 生成订单信息Modle*/

@property (nonatomic, assign, getter=isAgreeProtocol) BOOL agreeProtocol;                   /** 同意按钮的是否点击处理下一步按钮、体验问题*/


@end

@implementation LSTEtagLogOffVC

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self loadData];
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
        LSTOtherCardCell *cell   = [tableView dequeueReusableCellWithIdentifier:cell_ID_InputInfo];
        /** 选择颜色按钮点击处理*/
        cell.chooseColorButtonTapHandler = ^(UIButton *button){
            [weakSelf initColorActionSheet];
            weakSelf.colorButton = button;
        };
        cell.textFiledEndEidtHandler = ^(NSString *carNumber, NSString *phoneNumber){
            weakSelf.carNumber = carNumber;
            weakSelf.phoneNumber = phoneNumber;
        };
        
        /** 判断手动输入展开与否*/
        (self.cellIndex == indexPath.row) ? (cell.expand = YES) : (cell.expand = NO);
        /** 单选处理*/
        (self.cellIndex == indexPath.row) ? (cell.select = YES) : (cell.select = NO);

        return cell;
    }
    
    /** 阅读协议Cell*/
    if (indexPath.row == AGERR_INDEX(self.carInfolistArray.count)) {
        LSTAgreeCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_ID_Agree];
        /** 同意协议按钮点击处理*/
        cell.agreeTapHandler = ^(UIButton *agreeButton){
            agreeButton.selected ? (agreeButton.selected = NO, weakSelf.agreeProtocol = NO)
                                 : (agreeButton.selected = YES, weakSelf.agreeProtocol = YES);
        };
        /** 下一步按钮点击处理*/
        cell.nextStepTapHandler = ^(UIButton *nextStepButton){
            
            if (weakSelf.isAgreeProtocol) {
                /** 显示提示框*/
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
    LSTCarInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_ID_CarInfo];
    cell.carModel = self.carInfolistArray[indexPath.row];
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
    [self.colorButton setTitle:[NSString stringWithFormat:@"  %@",self.carColorArray[buttonIndex]] forState:UIControlStateNormal];
    self.saveCarColor = self.carColorArray[buttonIndex];
    self.vehicleColor = buttonIndex;

}

#pragma mark - custom Methods

/** 获取数据*/
- (void)loadData
{
    [LSTProgressHUB showProgress];
    [LSTEtagLogoffAPI getOffEtagCardListSuccess:^(id result) {

        /** 存放数据刷新cell*/
        [self.carInfolistArray addObjectsFromArray:result];
        [self.carInfoListTableView reloadData];
        [LSTProgressHUB dismissProgress];
        
        /** 获取订单号，在获取列表之后，也可用信号控制*/
        [LSTEtagLogoffAPI getOrderNumberSuccess:^(id result) {
            
            self.saveOrderModel = [LSTEtagOrderModel mj_objectWithKeyValues:result[@"data"]];
            
        } failure:^(NSError *error) {
            [self.view makeToast:@"订单获取失败"];
        }];
    } failure:^(NSError *error) {
        [LSTProgressHUB dismissProgress];
        [self.view makeToast:@"获取列表失败，请重新尝试"];
    }];
}

/** 点击下一步按钮处理,type提交的类型*/
- (void)tapNextStepHandlerWithCommitType:(LSTCommitInfoType)commitType
{
    switch (commitType) {
        case LSTCommitInfoTypeOfDefulet:
        {
            LSTCarModel *model = self.carInfolistArray[self.cellIndex];
            [self pushAuthCodeViewControllerWithCarMode:model];
        }
            break;
        case LSTCommitInfoTypeOfInput:
        {
            /** 校验处理*/
            [self locationVertifyInputInfoIsNull];
        }
            break;
            
        default:
            break;
    }
}

/** 本地校验输入信息格式是否正确*/
- (void)locationVertifyInputInfoIsNull
{
    if ([NSString isVerifyPhoneNumber:self.phoneNumber] && self.saveCarColor && [NSString isVertifyCarNumber:self.carNumber] ) {
        //需要调用接口提交输入的信息
        [self serverVerfityInputCarInfo];
    }else{
        //提示错误信息
        [self.view makeToast:@"请输入正确的车辆信息"];
        
    }
}

/** 提交服务器校验输入的车辆信息是否正确*/
- (void)serverVerfityInputCarInfo
{
    [LSTEtagLogoffAPI verfityEtagCardWithPhoneNo:self.phoneNumber lincensePlateNumber:self.carNumber vehicleColor:self.vehicleColor success:^(id result) {
        /** 根据返回信息做跳转处理*/
        LSTCarModel *model =
        [LSTCarModel mj_objectWithKeyValues:result[@"data"]];
        [self pushAuthCodeViewControllerWithCarMode:model];
        
    } failure:^(NSError *error) {
        /** 校验失败提示*/
        [self.view makeToast:@"验证出问题了，请重新尝试"];
    }];
}

- (void)showLstAlert
{
    __weak typeof(self) weakSelf = self;
    
    [LSTAlert configeAlertViewControllerWithTitle:@"确定要进行注销标签操作？" message:nil style:LSTAlertControllerStyleAlert atPersentVC:self suerAction:^(UIAlertAction *action) {
        /** 根据cellIndex判断哪种操作类型*/
        if (weakSelf.cellIndex == OCEEL_INDEX(self.carInfolistArray.count)) {
            [weakSelf tapNextStepHandlerWithCommitType:LSTCommitInfoTypeOfInput];
        }else{
            [weakSelf tapNextStepHandlerWithCommitType:LSTCommitInfoTypeOfDefulet];
        }

    } cancalAction:^(UIAlertAction *action) {
        //
    }];
}

- (void)pushAuthCodeViewControllerWithCarMode:(LSTCarModel *)model
{
    LSTAuthCodeVC *authCodeVc = [[LSTAuthCodeVC alloc] init];
    authCodeVc.carModel = model;
    authCodeVc.orderModel = self.saveOrderModel;
    [self.navigationController pushViewController:authCodeVc animated:YES];

}

#pragma mark - setter,getter

- (UITableView *)carInfoListTableView
{
    if (!_carInfoListTableView) {
        _carInfoListTableView = [[UITableView alloc] init];
        _carInfoListTableView.delegate = self;
        _carInfoListTableView.dataSource = self;
        _carInfoListTableView.estimatedRowHeight = 200;
        _carInfoListTableView.backgroundColor = LSTVCBackgroundColor;
        _carInfoListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        /** 注册Cell*/
        [_carInfoListTableView registerClass:[LSTCarInfoCell class]
                      forCellReuseIdentifier:cell_ID_CarInfo];
        [_carInfoListTableView registerClass:[LSTOtherCardCell class]
                      forCellReuseIdentifier:cell_ID_InputInfo];
        [_carInfoListTableView registerClass:[LSTAgreeCell class]
                      forCellReuseIdentifier:cell_ID_Agree];
    }
    return _carInfoListTableView;
}

- (NSArray *)carColorArray
{
    if (!_carColorArray) {
        _carColorArray = @[@"蓝色",
                           @"黄色",
                           @"绿色",
                           @"白色",
                           @"黑色"
                           ];
    }
    return _carColorArray;
}

- (NSMutableArray *)carInfolistArray
{
    if (!_carInfolistArray) {
        _carInfolistArray = @[].mutableCopy;
    }
    return _carInfolistArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
