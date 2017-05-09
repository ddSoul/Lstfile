//
//  LSTLabelsApplyTypeVC.m
//  DirectorySpecification
//
//  Created by Pactera_Admin on 2017/4/11.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTLabelsApplyTypeVC.h"

#import "LSTLabelsOfDoorCell.h"
#import "LSTLabelsOfNetCell.h"
#import "LSTBottomPayView.h"

static NSString *const doorCellID = @"doorCell";
static NSString *const netCellID = @"netCell";

@interface LSTLabelsApplyTypeVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;                                       //主列表
@property (nonatomic, strong) LSTBottomPayView *bottomView;                                 //底部视图

@property (nonatomic, strong) LSTLabelsOfDoorCell *tempDoorCell;

@end

@implementation LSTLabelsApplyTypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI
{
    self.title = @"选择办理方式";
    self.view.backgroundColor = LSTGlobalBgColor;
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(_bottomView.mas_top).mas_offset(0);
    }];
    
    [self commitTapHandler];
}

#pragma mark - tableView Delegate、DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.row == 0) {
//        LSTLabelsOfNetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"netCell"];
//        return cell;
//    }
    
    
    LSTLabelsOfDoorCell *cell = [tableView dequeueReusableCellWithIdentifier:doorCellID forIndexPath:indexPath];
    self.tempDoorCell = cell;
    cell.detailView.hidden = YES;
    return cell;
}

#pragma mark - custom Metheds
- (void)commitTapHandler
{
    __weak typeof(self) weakSelf = self;
    self.bottomView.commitHandler = ^{
        weakSelf.tempDoorCell.detailView.hidden = NO;
    };
}

#pragma mark - setter,getter 初始化自定义控件
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 300;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = LSTGlobalBgColor;
        
        [_tableView registerNib:[UINib nibWithNibName:@"LSTLabelsOfDoorCell" bundle:nil] forCellReuseIdentifier:doorCellID];
        [_tableView registerNib:[UINib nibWithNibName:@"LSTLabelsOfNetCell" bundle:nil] forCellReuseIdentifier:netCellID];
    }
    return _tableView;
}
- (LSTBottomPayView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[LSTBottomPayView alloc] init];
    }
    return _bottomView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
