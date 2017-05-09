//
//  LSTLabelsAPI.m
//  DirectorySpecification
//
//  Created by Pactera_Admin on 2017/5/8.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTLabelsAPI.h"
#import "LSTServiceManager.h"
#import "LSTNetWorkYTKTool.h"
#import "LSTETagStaicString.h"

#import "LSTAuthentication.h"
#import "LSTStPrincipal.h"

@interface LSTLabelsAPI ()

@property (nonatomic, strong) LSTNetWorkYTKTool *serviceTool;

@end

@implementation LSTLabelsAPI

- (void)lst_getOrderListSuccess:(SuccessHandler)success failure:(FailureHandler)failure
{
    if ([LSTServiceManager readyForNetwork] == NO) {
        return failure(LSTClientExceptionTypeNetConnectionError,nil);
    }else if ([LSTServiceManager readyForAuthorization] == NO) {
        return failure(LSTClientExceptionTypeAccountError,nil);
    }
    
    LSTAuthentication *auth = [LSTAuthentication authentication];
    NSString *userId = auth.tgtPrincipal.principal.attributes.gid;
    
    NSDictionary *par = @{@"userId":userId};
    
    [self.serviceTool lst_getRequestServiceWithUrl:t_orderListUrl parameters:par complete:^(BOOL successed, NSDictionary *dict) {
        if (successed) {
            NSLog(@"_______成功");
            success(dict);
        }else{
            return failure(LSTClientExceptionTypeUnknownError,dict);
        }
    }];
}

- (LSTNetWorkYTKTool *)serviceTool
{
    _serviceTool = [LSTNetWorkYTKTool new];
    return _serviceTool;
}

@end
