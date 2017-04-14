//
//  TableViewController.m
//  TTTTT
//
//  Created by Pactera_Admin on 2017/4/5.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewDataSource.h"
#import "TableViewDelegate.h"
#import "DefultCell.h"
#import "LSTChooseTypeVC.h"
#import "ButtonCell.h"
#import "MsCell.h"
#import "CellDataTool.h"

@interface TableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *foundTableView;
@property (nonatomic, strong) TableViewDataSource *xl_dataSource;
@property (nonatomic, strong) TableViewDelegate *xl_delegate;

@property (nonatomic, strong) NSMutableArray *formArray;

@property (nonatomic, assign, getter=isEx) BOOL ex;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self configUI];
    [self loadData];
    // Do any additional setup after loading the view.
}


- (void)configUI
{
    self.foundTableView = [[UITableView alloc] init];
    self.foundTableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.foundTableView.delegate = self;
    self.foundTableView.dataSource = self;
    self.foundTableView.estimatedRowHeight = 10;
    [self.foundTableView registerClass:[DefultCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.foundTableView];
}

- (void)loadData
{
    
    self.formArray = [CellDataTool configCellDataWithParterm:nil];
    [self.foundTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.formArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DefultCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.inifoDic = self.formArray[indexPath.row];
//    cell.msString = @"";
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [self.foundTableView reloadData];
}


- (TableViewDelegate *)xl_delegate
{
    if (!_xl_delegate) {
        _xl_delegate = [[TableViewDelegate alloc] init];
    }
    return _xl_delegate;
}

- (TableViewDataSource *)xl_dataSource
{
    if (!_xl_dataSource) {
        _xl_dataSource = [[TableViewDataSource alloc] init];
    }
    return _xl_dataSource;
}

- (NSMutableArray *)formArray
{
    if (!_formArray) {
        _formArray = @[].mutableCopy;
    }
    return _formArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
