//
//  LSTAlert.h
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/21.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

typedef NS_ENUM(NSInteger,LSTAlertControllerStyle){
    LSTAlertControllerStyleActionSheet = 0,//默认Alert
    LSTAlertControllerStyleAlert,
};

@interface LSTAlert : NSObject


/**
 * 快速创建AlertController
 *
 * @param title 标题描述
 * @param messagee 消息描述
 * @param style 样式
 * @param sureHandler 确认处理
 * @param canclehandler 取消处理
 */
+ (void)configeAlertViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)messagee
                                      style:(LSTAlertControllerStyle)style
                                atPersentVC:(UIViewController *)persentVc
                                 suerAction:(void (^)(UIAlertAction *action))sureHandler
                               cancalAction:(void (^)(UIAlertAction *action))canclehandler;


/**
 * 网络状态错误提示框
 *
 * @param persentViewController 所在的VC
 */
+ (void)showNetWorkErrorAtViewController:(UIViewController *)persentViewController;

/**
 *  文字提示
 *
 *  @param errorString 错误文字
 */
+ (void)showErrorWithString:(NSString *)errorString atViewController:(UIViewController *)persentViewController;

/**
 * 警告提示带确认操作
 *
 */
+ (void)showErrorWithString:(NSString *)errorString atViewController:(UIViewController *)persentViewController sureAction:(void (^)(UIAlertAction *action))sureHandler;

@end




/**----------------------------------自定义LSTProgressHUB----------------------------------*/

/** ProgressHUB*/
@interface LSTProgressHUB : NSObject

+ (void)showProgress;

+ (void)dismissProgress;
/**
 *  progress消失
 */
//+ (void)statusDismiss;

/**
 *  文字提示
 *
 *  @param errorString 错误文字
 */
+ (void)showErrorWithString:(NSString *)errorString;

/**
 *  文字提示
 *
 *  @param successString
 */
+ (void)showSuccessWithString:(NSString *)successString;


/**
 * 错误提示
 *
 */
//+ (void)showLocalErrorWithImage:(NSString *)imageName errorString:(NSString *)errorStr;

@end
