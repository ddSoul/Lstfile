//
//  LSTEtagLogoffAPI.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/22.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTEtagLogoffAPI.h"
#import "LSTNetWorkTool.h"
#import "LSTETageLogoffURL.h"

#import "LSTAuthentication.h"
#import "LSTStPrincipal.h"

@implementation LSTEtagLogoffAPI

+ (void)getStCardInfoListSuccess:(successHandler)success failure:(failureHandler)failure
{
//    LSTAuthentication *auth = [LSTAuthentication authentication];
//    NSString *userId = auth.tgtPrincipal.principal.attributes.gid;
//    
//    LSTStPrincipal *stPrincipal = [auth.stPrincipals firstObject];
//    NSLog(@"stPrincipal.st=11==%@",stPrincipal.st);
//    
//    NSDictionary *params = @{
//                          @"userId":userId
//                          };
//    
//    NSString *url = [NSString stringWithFormat:@"%@%@",serverUrl,orderListUrl];
//    [LSTNetWorkTool getWithUrl:url params:params success:^(id responseObject) {
//        if (success) {
//            success(responseObject);
//        }
//    } failure:^(NSError *error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
}

@end
