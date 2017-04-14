//
//  CellDataTool.m
//  TTTTT
//
//  Created by Pactera_Admin on 2017/4/13.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

#import "CellDataTool.h"

@implementation CellDataTool

+ (NSMutableArray *)configCellDataWithParterm:(id)model
{
    NSMutableArray *tempArray = @[].mutableCopy;
    NSDictionary *dic1 = @{
                           @"11":@"00000",
                           @"111":@"0000000000"
                           };
    NSDictionary *dic2 = @{
                           @"w":@"ddd",
                           @"ww":@"ddd",
                           @"wwww":@"dd",
                           @"www":@"dd"
                           };
    
    NSDictionary *dic3 = @{
                           @"11":@"00000"
                           };
    
    NSDictionary *dic4 = @{
                           @"w":@"ddd",
                           @"ww":@"ddd",
                           @"wwww":@"dd",
                           @"www":@"dd"
                           };
    
    NSDictionary *dic5 = @{
                           @"w":@"ddd",
                           @"ww":@"ddd",
                           @"wwww":@"dd",
                           @"www":@"dd"
                           };
    
    [tempArray addObject:dic1];
    [tempArray addObject:dic2];
    [tempArray addObject:dic3];
    [tempArray addObject:dic4];
    [tempArray addObject:dic5];
    return tempArray;
}

@end
