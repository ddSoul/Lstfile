//
//  LSTChangeCard.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/17.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTChangeCardVC.h"
#import "LSTChooseCardVC.h"

#import "BusinessCell.h"

@interface LSTChangeCardVC ()<UITableViewDelegate,UITableViewDataSource>
/** 业务类型列表*/
@property (strong, nonatomic) UITableView *businessList;

/** 业务类型数据*/
@property (strong, nonatomic) NSArray *businessDataSouce;

@end

@implementation LSTChangeCardVC

#pragma mark - life clcye
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self initUI];
    
}

#pragma mark - intUI
- (void)initUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"业务类型";
    
    [self.view addSubview:self.businessList];
    
    [self.businessList mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
}


#pragma mark - UITableViewDelegate,DataSouce
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.businessDataSouce.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BusinessCell *cell = [tableView dequeueReusableCellWithIdentifier:@"businessCell"];
    cell.businessTypeString = self.businessDataSouce[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSTChooseCardVC *Vc = [[LSTChooseCardVC alloc] init];
    [self.navigationController pushViewController:Vc animated:YES];
}


#pragma mark - setter,getter
- (UITableView *)businessList
{
    if (!_businessList) {
        _businessList = [[UITableView alloc] init];
        _businessList.delegate = self;
        _businessList.dataSource = self;
        _businessList.estimatedRowHeight = 50;
        [_businessList registerClass:[BusinessCell class] forCellReuseIdentifier:@"businessCell"];
    }
    return _businessList;
}

- (NSArray *)businessDataSouce
{
    if (!_businessDataSouce) {
        _businessDataSouce = @[@"businessTypeString",
                               @"businessTypeString",
                               @"businessTypeString",
                               @"businessTypeString",
                               @"businessTypeString"
                               ];
    }
    return _businessDataSouce;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
