//
//  NSString+PhoneNumber.m
//  DirectorySpecification
//
//  Created by ddSoul on 2017/3/17.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "NSString+Tools.h"
#import "LSTVehicleEnums.h"

@implementation NSString (Tools)

+ (NSString *)hiddenPhoneNumber:(NSString *)phoneNumber
{
    NSString *singleString,*combineString,*resultSting;
    
    for(int i =0; i < [phoneNumber length]; i++)
    {
        singleString = [phoneNumber substringWithRange:NSMakeRange(i,1)];
        
        /** 需要变*的地方*/
        if (i > 3 && i < 7) {
            combineString = @"*";
        }else{
            combineString = singleString;
        }
        
        /** 首位处理，空字符拼接*/
        if (resultSting) {
            resultSting = [resultSting stringByAppendingString:combineString];
        }else{
            resultSting = [NSString stringWithFormat:@"%@",combineString];
        }
    }
    
    return resultSting;
}

+ (NSString *)formatePhoneNumber:(NSString *)phoneNumber
{
    NSString *singleString,*combineString,*resultSting;
    
    for(int i =0; i < [phoneNumber length]; i++)
    {
        singleString = [phoneNumber substringWithRange:NSMakeRange(i,1)];
        
        /** 需要空格的地方*/
        if (i == 3 || i == 7) {
            combineString = [NSString stringWithFormat:@"%@%@",@" ",singleString];
        }else{
            combineString = singleString;
        }
        
        /** 首位处理，空字符拼接*/
        if (resultSting) {
            resultSting = [resultSting stringByAppendingString:combineString];
        }else{
            resultSting = [NSString stringWithFormat:@"%@",combineString];
        }
    }
    return resultSting;
}

+ (BOOL)isVerifyPhoneNumber:(NSString *)phoneNumber
{
    if (phoneNumber == nil){
        return NO;
    }
    
    /** 正则校验*/
    NSString *telRegex = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[013678]|18[0-9]|14[57])[0-9]{8}$";
    
    NSPredicate *telTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", telRegex];
    
    return [telTest evaluateWithObject:phoneNumber];
}

+ (NSString *)formateStNumber:(NSString *)stNumber
{
    NSString *singleString,*combineString,*resultSting;
    
    for(int i =0; i < [stNumber length]; i++)
    {
        singleString = [stNumber substringWithRange:NSMakeRange(i,1)];
        
        /** 需要空格的地方*/
        if (i%4 == 0) {
            combineString = [NSString stringWithFormat:@"%@%@",@" ",singleString];
        }else{
            combineString = singleString;
        }
        
        /** 首位处理，空字符拼接*/
        if (resultSting) {
            resultSting = [resultSting stringByAppendingString:combineString];
        }else{
            resultSting = [NSString stringWithFormat:@"%@",combineString];
        }
    }
    
    return resultSting;

}

+ (NSString *)isNullToString:(id)string
{
    if ([string isEqual:@"NULL"] ||
        [string isKindOfClass:[NSNull class]] ||
        [string isEqual:[NSNull null]] ||
        [string isEqual:NULL] ||
        [[string class] isSubclassOfClass:[NSNull class]] ||
        string == nil ||
        string == NULL ||
        [string isKindOfClass:[NSNull class]] ||
        [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0 ||
        [string isEqualToString:@"<null>"] ||
        [string isEqualToString:@"(null)"])
    {
        return @"";
    }
    else
    {
        return (NSString *)string;
    }
}


+ (NSString *)getNowTimeTimestamp
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    //设置时区,这个对于时间的处理有时很重要
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];
    
    NSString *timeStamp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    
    return timeStamp;
}

+ (BOOL)isVertifyCarNumber:(NSString *)carNumber
{
    if (carNumber.length!=7) {
        return NO;
    }
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-hj-zA-HJ-Z]{1}[a-hj-zA-HJ-Z_0-9]{4}[a-hj-zA-HJ-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    return [carTest evaluateWithObject:carNumber];
    
    return YES;
}

+ (NSString *)getVehicleColorWithType:(NSInteger )type
{
    NSString *colotString;
    switch (type) {
        case LSTVehicleColorBlue:
        {
            colotString = @"BLUE";
        }
            break;
        case LSTVehicleColorYellow:
        {
            colotString = @"YELLOW";
        }
            break;
        case LSTVehicleColorGreen:
        {
            colotString = @"GREEN";
        }
            break;
        case LSTVehicleColorWhite:
        {
            colotString = @"WHITE";
        }
            break;
        case LSTVehicleColorBlack:
        {
            colotString = @"BLACK";
        }
            break;
        default:
            break;
    }
    return colotString;
}

@end
