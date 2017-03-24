//
//  LSTAlert.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/21.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTAlert.h"

@implementation LSTAlert

+ (void)configeAlertViewControllerWithTitle:(NSString *)title
                                                   message:(NSString *)messagee
                                                     style:(LSTAlertControllerStyle)style
                                               atPersentVC:(UIViewController *)persentVc
                                                suerAction:(void (^)(UIAlertAction *action))sureHandler
                                              cancalAction:(void (^)(UIAlertAction *action))canclehandler
{
    UIAlertControllerStyle controllerStyle = (UIAlertControllerStyle )style;
    
    /** 初始化*/
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:messagee
                                                                      preferredStyle:controllerStyle];
    
    /** 如果有处理添加*/
    if (sureHandler) {
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定"
                                                             style:UIAlertActionStyleDefault
                                                           handler:sureHandler];
        [sureAction setValue:LSTGreenFontColor forKey:@"_titleTextColor"];
        [alertController addAction:sureAction];
    }

    /** 如果有处理添加*/
    if (canclehandler) {
        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消"
                                                               style:UIAlertActionStyleCancel
                                                             handler:canclehandler];
        [cancleAction setValue:LSTGreenFontColor forKey:@"_titleTextColor"];
        
         [alertController addAction:cancleAction];
    }
    
    [persentVc presentViewController:alertController animated:YES completion:nil];

//    return alertController;
}

+ (void)showNetWorkErrorAtViewController:(UIViewController *)persentViewController
{
    [self configeAlertViewControllerWithTitle:nil message:@"" style:LSTAlertControllerStyleAlert atPersentVC:persentViewController suerAction:^(UIAlertAction *action) {
            //
    } cancalAction:nil];
    
}

+ (void)showErrorWithString:(NSString *)errorString atViewController:(UIViewController *)persentViewController
{

    [self configeAlertViewControllerWithTitle:nil message:errorString style:LSTAlertControllerStyleAlert atPersentVC:persentViewController suerAction:^(UIAlertAction *action) {
        // 错误提示取消
    } cancalAction:nil];
}


/**
 * 警告提示带确认操作
 */
+ (void)showErrorWithString:(NSString *)errorString atViewController:(UIViewController *)persentViewController sureAction:(void (^)(UIAlertAction *action))sureHandler;
{
    [self configeAlertViewControllerWithTitle:nil message:errorString style:LSTAlertControllerStyleAlert atPersentVC:persentViewController suerAction:sureHandler cancalAction:nil];
}

@end



