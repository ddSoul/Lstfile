//
//  LSTListViewController.m
//  DirectorySpecification
//
//  Created by Pactera_Admin on 2017/4/10.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTListViewController.h"
#import "LSTEtagLogOffVC.h"
#import "LSTChangeLabelsVC.h"
#import "LSTChangeCarInfoVC.h"
#import "LSTEtagAPI.h"
#import "LSTWriteCarInfoVC.h"

#import "LSTLabelsAPI.h"

@interface LSTListViewController ()

@end

@implementation LSTListViewController

/** 方便测试页面*/

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view.
}

- (void)initUI{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    for (int i = 0; i<4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(50, 80+i*80, 200, 60);
        btn.backgroundColor = [UIColor redColor];
        btn.tag = i;
        [btn addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
}

- (void)tap:(UIButton *)btn
{
    if (btn.tag == 0) {
        LSTEtagLogOffVC *vc = [[LSTEtagLogOffVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(btn.tag == 1){
        LSTChangeLabelsVC *vc = [[LSTChangeLabelsVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(btn.tag == 2){
        LSTChangeCarInfoVC *vc = [[LSTChangeCarInfoVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
//        LSTWriteCarInfoVC *vc = [[LSTWriteCarInfoVC alloc] init];
//        [self.navigationController pushViewController:vc animated:YES];
//
//        [LSTEtagAPI getOrderListSuccess:^(id result) {
//            NSLog(@"_____ssss");
//        } failure:^(NSError *error) {
//            NSLog(@"_______ffffff");
//        }];
        
        LSTLabelsAPI *api = [LSTLabelsAPI new];
        [api lst_getOrderListSuccess:^(id result) {
            NSLog(@"_______________成功");
        } failure:^(LSTExceptionType exceptionType, NSDictionary *error) {
            NSLog(@"_______________失败");
        }];
        
//        LSTXmlVC *vc = [[LSTXmlVC alloc] init];
//        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
